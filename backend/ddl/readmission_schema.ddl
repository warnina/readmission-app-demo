DROP TABLE IF EXISTS activity;
CREATE TABLE activity (activityid UUID NOT NULL, type CHARACTER VARYING(50) NOT NULL, occurence_dt DATE NOT NULL, extid CHARACTER VARYING(200), label CHARACTER VARYING(100) NOT NULL, description CHARACTER VARYING(500), icon CHARACTER VARYING(50), PRIMARY KEY (activityid));
DROP TABLE IF EXISTS appointment;
CREATE TABLE appointment (appointmentid UUID NOT NULL, userid UUID NOT NULL, start_date DATE NOT NULL, end_date DATE, location CHARACTER VARYING(200), physician CHARACTER VARYING(100), reason CHARACTER VARYING(500), reason_es CHARACTER VARYING(500), confirmed BOOLEAN DEFAULT false NOT NULL, confirmed_dt DATE, reschedule_phone CHARACTER VARYING(200), cancelled BOOLEAN DEFAULT false NOT NULL, cancelled_dt DATE, days_reminder INTEGER DEFAULT 0 NOT NULL, PRIMARY KEY (appointmentid));
DROP TABLE IF EXISTS contact;
CREATE TABLE contact (contactid UUID NOT NULL, userid UUID NOT NULL, contact_extid CHARACTER VARYING(200), contact_label CHARACTER VARYING(200), PRIMARY KEY (contactid));
DROP TABLE IF EXISTS facility;
CREATE TABLE facility (facilityid UUID NOT NULL, facility CHARACTER VARYING(50), address CHARACTER VARYING(100), type CHARACTER VARYING(50), logo_url CHARACTER VARYING(100), photo_url CHARACTER VARYING(100), PRIMARY KEY (facilityid));
DROP TABLE IF EXISTS medication;
CREATE TABLE medication (medicationid UUID NOT NULL, userid UUID NOT NULL, from_dt DATE, until_dt DATE, label CHARACTER VARYING(100), prescription CHARACTER VARYING NOT NULL, take_dow_mask CHARACTER VARYING(7), dosage_info CHARACTER VARYING(50), usage_info CHARACTER VARYING(500), warnings_info CHARACTER VARYING(500), PRIMARY KEY (medicationid));
DROP TABLE IF EXISTS question;
CREATE TABLE question (questionid UUID NOT NULL, surveyid UUID NOT NULL, type CHARACTER VARYING(50) NOT NULL, question CHARACTER VARYING(100) NOT NULL, responses CHARACTER VARYING(500), data JSON, multiple_choice BOOLEAN, has_other BOOLEAN, other_label CHARACTER VARYING, sequence INTEGER DEFAULT 1 NOT NULL, PRIMARY KEY (questionid));
DROP TABLE IF EXISTS response;
CREATE TABLE response (userid UUID NOT NULL, surveyid UUID NOT NULL, questionid UUID NOT NULL, answers CHARACTER VARYING(500), other CHARACTER VARYING(500), skipped BOOLEAN DEFAULT false, CONSTRAINT answer_pkey PRIMARY KEY (userid, surveyid, questionid));
DROP TABLE IF EXISTS schedule;
CREATE TABLE schedule (scheduleid UUID NOT NULL, label CHARACTER VARYING, userid UUID NOT NULL, dow_mask CHARACTER VARYING(7), start_dt DATE, end_dt DATE, repeats BOOLEAN, type CHARACTER VARYING, data JSON, PRIMARY KEY (scheduleid));
DROP TABLE IF EXISTS session;
CREATE TABLE session (sessionid UUID NOT NULL, userid UUID NOT NULL, login_dt DATE, exp_dt DATE, PRIMARY KEY (sessionid));
DROP TABLE IF EXISTS survey;
CREATE TABLE survey (surveyid UUID NOT NULL, title CHARACTER VARYING(50) NOT NULL, description CHARACTER VARYING(200), created_dt DATE, data JSON, final_msg CHARACTER VARYING(200), PRIMARY KEY (surveyid));
DROP TABLE IF EXISTS task;
CREATE TABLE task (taskid UUID NOT NULL, type CHARACTER VARYING(50), extid CHARACTER VARYING(200), due_dt DATE, completed_dt DATE, status CHARACTER VARYING(50), created_dt DATE, data JSON, surveyid UUID, appointmentid UUID, medicationid UUID, scheduleid UUID, userid UUID, PRIMARY KEY (taskid));
DROP TABLE IF EXISTS user;
CREATE TABLE user (userid UUID NOT NULL, type CHARACTER VARYING(20) NOT NULL, is_patient BOOLEAN DEFAULT true NOT NULL, first_name CHARACTER VARYING(50) NOT NULL, last_name CHARACTER VARYING(50) NOT NULL, patientid CHARACTER VARYING(50), pass_hash CHARACTER VARYING(50), last_login_dt DATE, contact_information CHARACTER VARYING(500), other_information CHARACTER VARYING(500), extid CHARACTER VARYING(100), department CHARACTER VARYING(50), location CHARACTER VARYING(100), suffix CHARACTER VARYING(10), prefix CHARACTER VARYING(10), affiliated_facilityid UUID, photo_url CHARACTER VARYING(200), username CHARACTER VARYING(30) NOT NULL, PRIMARY KEY (userid));
ALTER TABLE "appointment" ADD CONSTRAINT appointment_fk1 FOREIGN KEY ("userid") REFERENCES "user" ("userid");
ALTER TABLE "contact" ADD CONSTRAINT contact_fk1 FOREIGN KEY ("userid") REFERENCES "user" ("userid");
ALTER TABLE "medication" ADD CONSTRAINT medication_fk1 FOREIGN KEY ("userid") REFERENCES "user" ("userid");
ALTER TABLE "question" ADD CONSTRAINT question_fk1 FOREIGN KEY ("surveyid") REFERENCES "survey" ("surveyid");
ALTER TABLE "response" ADD CONSTRAINT answer_fk1 FOREIGN KEY ("userid") REFERENCES "user" ("userid");
ALTER TABLE "response" ADD CONSTRAINT answer_fk2 FOREIGN KEY ("surveyid") REFERENCES "survey" ("surveyid");
ALTER TABLE "response" ADD CONSTRAINT answer_fk3 FOREIGN KEY ("questionid") REFERENCES "question" ("questionid");
ALTER TABLE "schedule" ADD CONSTRAINT schedule_fk1 FOREIGN KEY ("userid") REFERENCES "user" ("userid");
ALTER TABLE "session" ADD CONSTRAINT session_fk1 FOREIGN KEY ("userid") REFERENCES "user" ("userid");
ALTER TABLE "task" ADD CONSTRAINT task_fk1 FOREIGN KEY ("surveyid") REFERENCES "survey" ("surveyid");
ALTER TABLE "task" ADD CONSTRAINT task_fk2 FOREIGN KEY ("appointmentid") REFERENCES "appointment" ("appointmentid");
ALTER TABLE "task" ADD CONSTRAINT task_fk3 FOREIGN KEY ("medicationid") REFERENCES "medication" ("medicationid");
ALTER TABLE "task" ADD CONSTRAINT task_fk4 FOREIGN KEY ("scheduleid") REFERENCES "schedule" ("scheduleid");
ALTER TABLE "task" ADD CONSTRAINT task_fk5 FOREIGN KEY ("userid") REFERENCES "user" ("userid");
