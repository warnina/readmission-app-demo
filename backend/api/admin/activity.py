# activities
from typing import Optional
from pydantic import BaseModel
from datetime import date
from uuid import UUID
from sqlalchemy.orm import Session
from typing import List
from fastapi import Depends, HTTPException, APIRouter
from api.db_utils import get_db  # Add this function in db_functions.py file

router = APIRouter( tags=["admin -> activities"])
##app = FastAPI()

class ActivityBase(BaseModel):
    type: str
    occurence_dt: date
    extid: Optional[str]
    label: str
    description: Optional[str]
    icon: Optional[str]

class ActivityCreate(ActivityBase):
    pass

class Activity(ActivityBase):
    activityid: UUID
    class Config:
        orm_mode = True


@router.post("/create", response_model=Activity)
def create_activity(activity: ActivityCreate, db: Session = Depends(get_db)):
    db_activity = Activity(**activity.dict())
    db.add(db_activity)
    db.commit()
    db.refresh(db_activity)
    return db_activity


@router.get("/get/{activity_id}", response_model=Activity)
def read_activity(activity_id: UUID, db: Session = Depends(get_db)):
    db_activity = db.query(Activity).filter(Activity.activityid == activity_id).first()
    if db_activity is None:
        raise HTTPException(status_code=404, detail="Activity not found")
    return db_activity


@router.get("/list/", response_model=List[Activity])
def read_activities(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    activities = db.query(Activity).offset(skip).limit(limit).all()
    return activities


@router.put("/update/{activity_id}", response_model=Activity)
def update_activity(activity_id: UUID, activity: ActivityCreate, db: Session = Depends(get_db)):
    db_activity = db.query(Activity).filter(Activity.activityid == activity_id).first()
    if db_activity is None:
        raise HTTPException(status_code=404, detail="Activity not found")
    for k, v in activity.dict().items():
        setattr(db_activity, k, v)
    db.commit()
    return db_activity


@router.delete("/delete/{activity_id}")
def delete_activity(activity_id: UUID, db: Session = Depends(get_db)):
    db_activity = db.query(Activity).filter(Activity.activityid == activity_id).first()
    if db_activity is None:
        raise HTTPException(status_code=404, detail="Activity not found")
    db.delete(db_activity)
    db.commit()
    return {"detail": f"Activity id {activity_id} has been deleted"}
