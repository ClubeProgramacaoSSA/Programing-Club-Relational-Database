-- This Script is responsible for creating the Relational Database tables and establishing their restrictions.

-- Available at https://github.com/clubProgramacaoSSA/Programing-Club-Relational-Database
    -- Made by:
        --Adrian Widmer | GitHub: https://github.com/Awi-24
        --Antonio Horácio Magalhaes | GitHub: https://github.com/antoniohoracio77
        --Fernando Antonio Marques Schettini | GitHub: https://github.com/FernandoSchett
        --Orlando Mota Pires | GitHub: https://github.com/orlandomotapires

-- 1    
CREATE TABLE IF NOT EXISTS TB_captain(     
    ID_captain SERIAL NOT NULL,     
    ID_member INT NOT NULL,     
    captain_name VARCHAR(50) NOT NULL 
);   

-- 2    
CREATE TABLE IF NOT EXISTS TB_city(     
    ID_city SERIAL NOT NULL,     
    ID_state INT NOT NULL,     
    name VARCHAR(50) NOT NULL 
);  

-- 3    
CREATE TABLE IF NOT EXISTS TB_club_account(     
    ID_club_account SERIAL NOT NULL,     
    ID_member INT NOT NULL,     
    login VARCHAR(100) NOT NULL,     
    jpq_score INT NOT NULL,     
    password VARCHAR(500) NOT NULL 
);    

-- 4
CREATE TABLE IF NOT EXISTS TB_country(     
    ID_country SERIAL NOT NULL,     
    name VARCHAR(50) 
);     

-- 5
CREATE TABLE IF NOT EXISTS TB_course(     
    ID_course SERIAL NOT NULL,     
    name VARCHAR(50) NOT NULL UNIQUE 
);    

-- 6
CREATE TABLE IF NOT EXISTS TB_difficulty_degree(     
    ID_difficulty_degree SERIAL NOT NULL,     
    difficulty VARCHAR(50) NOT NULL
);    

-- 7
CREATE TABLE IF NOT EXISTS TB_education_institution(     
    ID_education_institution SERIAL NOT NULL,     
    ID_public_place INT NOT NULL,     
    name VARCHAR(50) NOT NULL 
);   

-- 8
CREATE TABLE IF NOT EXISTS TB_encounter(     
    ID_encounter SERIAL NOT NULL,     
    ID_organizer INT NOT NULL,     
    ID_project INT NOT NULL,     
    DT_start DATE,     
    DT_end DATE  
);   

-- 9
CREATE TABLE IF NOT EXISTS TB_encounter_attendance(
    ID_encounter_attendance SERIAL NOT NULL,
    ID_encounter INT NOT NULL,
    ID_member INT NOT NULL 
);   

-- 10
CREATE TABLE IF NOT EXISTS TB_encounter_image(
    ID_encounter_image SERIAL NOT NULL,
    ID_encounter INT NOT NULL,
    ID_image INT NOT NULL 
);

-- 11
CREATE TABLE IF NOT EXISTS TB_encounter_subject(
    ID_encounter_subject SERIAL NOT NULL,
    ID_subject INT NOT NULL,
    ID_encounter INT NOT NULL 
);   

-- 12
CREATE TABLE IF NOT EXISTS TB_event(
    ID_event SERIAL NOT NULL,
    ID_place INT NOT NULL,
    description VARCHAR(100),
    DT_start DATE,
    DT_end DATE,
    name VARCHAR(50) NOT NULL 
);    

-- 13
CREATE TABLE IF NOT EXISTS TB_event_attendance(
    ID_event_attendance SERIAL NOT NULL,
    ID_member INT NOT NULL,
    ID_event INT NOT NULL,
    max_jpq_score INT  
);    

-- 14
CREATE TABLE IF NOT EXISTS TB_event_image(
    ID_event_image SERIAL NOT NULL,
    ID_event INT NOT NULL,
    ID_image INT NOT NULL   
);    

-- 15  
CREATE TABLE IF NOT EXISTS TB_function(
    ID_function SERIAL NOT NULL,
    name_function VARCHAR(50) NOT NULL,
    function_description VARCHAR(100) NOT NULL 
);    

-- 16
CREATE TABLE IF NOT EXISTS TB_image(
    ID_image SERIAL NOT NULL,
    ID_image_category INT NOT NULL,
    description VARCHAR(100),
    image oid NOT NULL,
    name VARCHAR(200),
    DT_image DATE 
);    

-- 17
CREATE TABLE IF NOT EXISTS TB_image_category(
    ID_image_category SERIAL NOT NULL,
    name VARCHAR(50) UNIQUE 
);    

-- 18
CREATE TABLE IF NOT EXISTS TB_institution_course(
    ID_institution_course SERIAL NOT NULL,
    ID_course INT NOT NULL,
    ID_institution INT NOT NULL 
);   

-- 19
CREATE TABLE IF NOT EXISTS TB_leader(
    ID_leader SERIAL NOT NULL,
    ID_member INT NOT NULL,
    name_leader VARCHAR(50) NOT NULL 
);

-- 20
CREATE TABLE IF NOT EXISTS TB_member(
    ID_member SERIAL NOT NULL,
    ID_institution_course INT NOT NULL,
    ID_member_photo INT NOT NULL,
    DT_birth DATE,
    DT_club_entrance DATE NOT NULL,
    DT_college_entrance DATE NOT NULL,
    gender CHAR(1) NOT NULL,
    login VARCHAR(50) NOT NULL,
    member_name VARCHAR(50) NOT NULL,
    occupation VARCHAR(50) 
);   

-- 21
CREATE TABLE IF NOT EXISTS TB_member_project(
    ID_member_project SERIAL NOT NULL,
    ID_member INT NOT NULL,
    ID_project INT NOT NULL,
    ID_function INT NOT NULL,
    DT_enter_project DATE NOT NULL,
    DT_exit_project DATE 
);    

-- 22
CREATE TABLE IF NOT EXISTS TB_member_role(
    ID_member_role SERIAL NOT NULL,
    ID_role INT NOT NULL,
    ID_member INT NOT NULL,
    DT_role_enter DATE NOT NULL,
    DT_role_exit DATE,
    max_jpq_score INT 
);   

-- 23
CREATE TABLE IF NOT EXISTS TB_member_team(
    ID_member_team SERIAL NOT NULL,
    ID_team INT NOT NULL,
    ID_member INT NOT NULL 
);    

-- 24
CREATE TABLE IF NOT EXISTS TB_online_encounter(
    ID_online_encounter SERIAL NOT NULL,
    ID_platform INT NOT NULL,
    ID_encounter INT NOT NULL 
);    

-- 25
CREATE TABLE IF NOT EXISTS TB_online_phase(
    ID_online_phase SERIAL NOT NULL,
    ID_phase INT NOT NULL,
    ID_platform INT NOT NULL 
);   

-- 26
CREATE TABLE IF NOT EXISTS TB_organizer(
    ID_organizer SERIAL NOT NULL,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(50) 
);   

-- 27
CREATE TABLE IF NOT EXISTS TB_organizer_comittee(
    ID_organizer_comittee SERIAL NOT NULL,
    ID_event INT NOT NULL,
    ID_member INT NOT NULL 
);    

-- 28
CREATE TABLE IF NOT EXISTS TB_phase(
    ID_phase SERIAL NOT NULL,
    ID_tournament INT NOT NULL,
    number INT NOT NULL,
    DT_start DATE NOT NULL,
    DT_end DATE NOT NULL 
);   

-- 29
CREATE TABLE IF NOT EXISTS TB_place(
    ID_place SERIAL NOT NULL,
    ID_public_place INT NOT NULL,
    description VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL 
);    

-- 30
CREATE TABLE IF NOT EXISTS TB_platform(
    ID_platform SERIAL NOT NULL,
    URL_platform VARCHAR(100) NOT NULL UNIQUE,
    platform_name VARCHAR(50) NOT NULL UNIQUE 
);    

-- 31
CREATE TABLE IF NOT EXISTS TB_presencial_encounter(
    ID_presencial_encounter SERIAL NOT NULL,
    ID_encounter INT NOT NULL,
    ID_place INT NOT NULL 
);    

-- 32
CREATE TABLE IF NOT EXISTS TB_presential_phase(
    ID_presential_phase SERIAL NOT NULL,
    ID_phase INT NOT NULL,
    ID_place INT NOT NULL 
);    

-- 33
CREATE TABLE IF NOT EXISTS TB_project(
    ID_project SERIAL NOT NULL,
    ID_project_type INT NOT NULL,
    ID_leader INT NOT NULL,
    description VARCHAR(100),
    DT_start DATE,
    DT_foreseen_end DATE,
    name VARCHAR(50),
    max_jpq_score INT,
    URL_gitHub VARCHAR(100) 
);    

-- 34
CREATE TABLE IF NOT EXISTS TB_project_image(
    ID_project_image SERIAL NOT NULL,
    ID_image INT NOT NULL,
    ID_project INT NOT NULL 
);   
 
-- 35
CREATE TABLE IF NOT EXISTS TB_project_subject(
    ID_project_subject SERIAL NOT NULL,
    ID_subject INT NOT NULL,
    ID_project INT NOT NULL 
);   

-- 36
CREATE TABLE IF NOT EXISTS TB_project_type(
    ID_project_type SERIAL NOT NULL,
    title VARCHAR(50) NOT NULL 
);
  
-- 37
CREATE TABLE IF NOT EXISTS TB_public_place(
    ID_public_place SERIAL NOT NULL,
    ID_city INT NOT NULL,
    name VARCHAR(50) 
);

-- 38
CREATE TABLE IF NOT EXISTS TB_question(
    ID_question SERIAL NOT NULL,
    ID_difficulty_degree INT NOT NULL,
    enunciado VARCHAR(200) NOT NULL,
    name VARCHAR(100) NOT NULL,
    correct_answer VARCHAR(500),
    max_jpq_score INT 
);    

-- 39
CREATE TABLE IF NOT EXISTS TB_question_origin(
    ID_question_origin SERIAL NOT NULL,
    question_origin VARCHAR (100) NOT NULL 
);   

-- 40
CREATE TABLE IF NOT EXISTS TB_question_subject(
    ID_question_subject SERIAL NOT NULL,
    ID_subject INT NOT NULL,
    ID_question INT NOT NULL,
    max_jpq_score INT  
);

-- 41
CREATE TABLE IF NOT EXISTS TB_score_transaction(
    ID_score_transaction SERIAL NOT NULL,
    ID_club_account INT NOT NULL,
    ID_transaction_score_type INT NOT NULL,
    score_jpq_quantity INT 
);    

-- 42
CREATE TABLE IF NOT EXISTS TB_score_transaction_event_attendance(
    ID_score_transaction_event_attendance SERIAL NOT NULL,
    ID_score_transaction INT NOT NULL,
    ID_event_attendance INT NOT NULL 
);

-- 43
CREATE TABLE IF NOT EXISTS TB_score_transaction_member_role(
    ID_score_transaction_member_role SERIAL NOT NULL,
    ID_member_role INT NOT NULL,
    ID_score_transaction INT NOT NULL 
);   

-- 44
CREATE TABLE IF NOT EXISTS TB_score_transaction_project(
    ID_score_transaction_project SERIAL NOT NULL,
    ID_score_transaction INT NOT NULL,
    ID_project INT NOT NULL,
    project_rating VARCHAR(500) 
);   
 
-- 45
CREATE TABLE IF NOT EXISTS TB_score_transaction_question(
    ID_score_transaction_question SERIAL NOT NULL,
    ID_score_transaction INT NOT NULL,
    ID_question INT NOT NULL,
    question_rating VARCHAR(500)  
);

-- 46
CREATE TABLE IF NOT EXISTS TB_score_transaction_tournament_team_phase(
    ID_score_transaction_tournament_team_phase SERIAL NOT NULL,
    ID_tournament_team_phase INT NOT NULL,
    ID_score_transaction INT NOT NULL 
);   

-- 47
CREATE TABLE IF NOT EXISTS TB_state(
    ID_state SERIAL NOT NULL,
    ID_country INT NOT NULL,
    name VARCHAR(50) NOT NULL 
);   

-- 48
CREATE TABLE IF NOT EXISTS TB_status(
    ID_status SERIAL NOT NULL,
    description VARCHAR(100) NOT NULL 
);

-- 49
CREATE TABLE IF NOT EXISTS TB_subject(
    ID_subject SERIAL NOT NULL,
    subject VARCHAR(100) 
);

-- 50
CREATE TABLE IF NOT EXISTS TB_team(
    ID_team SERIAL NOT NULL,
    ID_captain INT NOT NULL,
    DT_criation DATE NOT NULL,
    name VARCHAR(50) NOT NULL 
);

-- 51
CREATE TABLE IF NOT EXISTS TB_team_question_phase(
    ID_team_question_phase SERIAL NOT NULL,
    ID_tournament_team_phase INT NOT NULL,
    ID_question INT NOT NULL,
    ID_status INT NOT NULL,
    number_try INT NOT NULL 
);   
 
-- 52
CREATE TABLE IF NOT EXISTS TB_tournament_team(
    ID_tournament_team SERIAL NOT NULL,
    ID_team INT NOT NULL,
    ID_tournament INT NOT NULL,
    team_position INT NOT NULL UNIQUE 
);   

-- 53
CREATE TABLE IF NOT EXISTS TB_tournament_team_phase(
    ID_tournament_team_phase SERIAL NOT NULL,
    ID_tournament_team INT NOT NULL,
    ID_phase INT NOT NULL,
    team_position_phase INT NOT NULL UNIQUE,
    max_jpq_score INT 
);  

-- 54
CREATE TABLE IF NOT EXISTS TB_transaction_score_type(     
    ID_transaction_score_type SERIAL  NOT NULL,     
    transaction_score_type VARCHAR (100) NOT NULL 
);  

-- 55
CREATE TABLE IF NOT EXISTS TB_tournament(
    ID_tournament SERIAL NOT NULL,
    ID_organizer INT NOT NULL,     
    name VARCHAR(50) NOT NULL,     
    DT_start DATE,     
    DT_end DATE 
);

-- GENDER CONSTRAINT
ALTER TABLE TB_member ADD CONSTRAINT CK_gender_member CHECK(gender in('F','M'));

-- PRIMARY KEY CONSTRAINTS
ALTER TABLE TB_captain ADD CONSTRAINT PK_captain PRIMARY KEY (ID_captain); 
ALTER TABLE TB_city ADD CONSTRAINT PK_city PRIMARY KEY (ID_city); 
ALTER TABLE TB_club_account ADD CONSTRAINT PK_club_account PRIMARY KEY (ID_club_account);
ALTER TABLE TB_country ADD CONSTRAINT PK_country PRIMARY KEY (ID_country); 
ALTER TABLE TB_course ADD CONSTRAINT PK_course PRIMARY KEY (ID_course); 
ALTER TABLE TB_difficulty_degree ADD CONSTRAINT PK_difficulty_degree PRIMARY KEY (ID_difficulty_degree); 
ALTER TABLE TB_education_institution ADD CONSTRAINT PK_education_institution PRIMARY KEY (ID_education_institution); 
ALTER TABLE TB_encounter ADD CONSTRAINT PK_encounter PRIMARY KEY (ID_encounter); 
ALTER TABLE TB_encounter_attendance ADD CONSTRAINT PK_preseca_encounter PRIMARY KEY (ID_encounter_attendance); 
ALTER TABLE TB_encounter_image ADD CONSTRAINT PK_encounter_image PRIMARY KEY (ID_encounter_image); 
ALTER TABLE TB_encounter_subject ADD CONSTRAINT PK_encounter_subject PRIMARY KEY (ID_encounter_subject); 
ALTER TABLE TB_event ADD CONSTRAINT PK_event PRIMARY KEY (ID_event); 
ALTER TABLE TB_event_attendance ADD CONSTRAINT PK_event_attendance PRIMARY KEY (ID_event_attendance); 
ALTER TABLE TB_event_image ADD CONSTRAINT PK_event_image PRIMARY KEY (ID_event_image); 
ALTER TABLE TB_function ADD CONSTRAINT PK_function PRIMARY KEY (ID_function); 
ALTER TABLE TB_image ADD CONSTRAINT PK_image PRIMARY KEY (ID_image); 
ALTER TABLE TB_image_category ADD CONSTRAINT PK_image_category PRIMARY KEY (ID_image_category); 
ALTER TABLE TB_institution_course ADD CONSTRAINT PK_institution_course PRIMARY KEY (ID_institution_course); 
ALTER TABLE TB_leader ADD CONSTRAINT PK_leader PRIMARY KEY (ID_leader); 
ALTER TABLE TB_member ADD CONSTRAINT PK_member PRIMARY KEY (ID_member); 
ALTER TABLE TB_member_project ADD CONSTRAINT PK_member_project PRIMARY KEY (ID_member_project); 
ALTER TABLE TB_member_role ADD CONSTRAINT PK_member_role PRIMARY KEY (ID_member_role);
ALTER TABLE TB_member_team ADD CONSTRAINT PK_member_team PRIMARY KEY (ID_member_team); 
ALTER TABLE TB_online_encounter ADD CONSTRAINT PK_online_encounter PRIMARY KEY (ID_online_encounter); 
ALTER TABLE TB_online_phase ADD CONSTRAINT PK_online_phase PRIMARY KEY (ID_online_phase); 
ALTER TABLE TB_organizer ADD CONSTRAINT PK_organizer PRIMARY KEY(ID_organizer);
ALTER TABLE TB_organizer_comittee ADD CONSTRAINT PK_organizer_comittee PRIMARY KEY (ID_organizer_comittee); 
ALTER TABLE TB_phase ADD CONSTRAINT PK_phase PRIMARY KEY (ID_phase); 
ALTER TABLE TB_place ADD CONSTRAINT PK_place PRIMARY KEY (ID_place); 
ALTER TABLE TB_platform ADD CONSTRAINT PK_platafomra PRIMARY KEY (ID_platform); 
ALTER TABLE TB_presencial_encounter ADD CONSTRAINT PK_presencial_encounter PRIMARY KEY (ID_presencial_encounter);
ALTER TABLE TB_presential_phase ADD CONSTRAINT PK_presential_phase PRIMARY KEY (ID_presential_phase); 
ALTER TABLE TB_project ADD CONSTRAINT PK_project PRIMARY KEY (ID_project); 
ALTER TABLE TB_project_image ADD CONSTRAINT PK_project_image PRIMARY KEY (ID_project_image); 
ALTER TABLE TB_project_subject ADD CONSTRAINT PK_project_subject PRIMARY KEY (ID_project_subject); 
ALTER TABLE TB_project_type ADD CONSTRAINT PK_project_type PRIMARY KEY (ID_project_type);
ALTER TABLE TB_public_place ADD CONSTRAINT PK_public_place PRIMARY KEY (ID_public_place); 
ALTER TABLE TB_question ADD CONSTRAINT PK_question PRIMARY KEY (ID_question); 
ALTER TABLE TB_question_origin ADD CONSTRAINT PK_question_origin PRIMARY KEY (ID_question_origin); 
ALTER TABLE TB_question_subject ADD CONSTRAINT PK_question_subject PRIMARY KEY(ID_question_subject); 
ALTER TABLE TB_score_transaction ADD CONSTRAINT PK_score_transaction PRIMARY KEY (ID_score_transaction); 
ALTER TABLE TB_score_transaction_event_attendance ADD CONSTRAINT PK_score_transaction_event_attendance PRIMARY KEY (ID_score_transaction_event_attendance); 
ALTER TABLE TB_score_transaction_member_role ADD CONSTRAINT PK_score_transaction_member_role PRIMARY KEY (ID_score_transaction_member_role); 
ALTER TABLE TB_score_transaction_project ADD CONSTRAINT PK_score_transaction_project PRIMARY KEY (ID_score_transaction_project); 
ALTER TABLE TB_score_transaction_question ADD CONSTRAINT PK_score_transaction_question PRIMARY KEY (ID_score_transaction_question); 
ALTER TABLE TB_score_transaction_tournament_team_phase ADD CONSTRAINT PK_score_transaction_tournament_team_phase PRIMARY KEY (ID_score_transaction_tournament_team_phase); 
ALTER TABLE TB_state ADD CONSTRAINT PK_state PRIMARY KEY (ID_state); 
ALTER TABLE TB_status ADD CONSTRAINT PK_status PRIMARY KEY (ID_status); 
ALTER TABLE TB_subject ADD CONSTRAINT PK_subject PRIMARY KEY (ID_subject); 
ALTER TABLE TB_team ADD CONSTRAINT PK_team PRIMARY KEY (ID_team); 
ALTER TABLE TB_team_question_phase ADD CONSTRAINT PK_team_question_phase PRIMARY KEY (ID_team_question_phase); 
ALTER TABLE TB_tournament ADD CONSTRAINT PK_tournament PRIMARY KEY (ID_tournament); 
ALTER TABLE TB_tournament_team ADD CONSTRAINT PK_tournament_team PRIMARY KEY (ID_tournament_team); 
ALTER TABLE TB_tournament_team_phase ADD CONSTRAINT PK_tournament_team_phase PRIMARY KEY (ID_tournament_team_phase); 
ALTER TABLE TB_transaction_score_type ADD CONSTRAINT PK_transaction_score_type PRIMARY KEY (ID_transaction_score_type);


-- FOREIGN KEY CONSTRAINTS

-- TB_captain
ALTER TABLE TB_captain ADD CONSTRAINT FK_captain_member FOREIGN KEY (ID_member) REFERENCES TB_member(ID_member);

-- TB_city
ALTER TABLE TB_city ADD CONSTRAINT FK_city_state FOREIGN KEY (ID_state) REFERENCES TB_state(ID_state);

-- TB_clube_account
ALTER TABLE TB_club_account ADD CONSTRAINT FK_club_account_member FOREIGN KEY (ID_member) REFERENCES TB_member(ID_member);

-- TB_education_institution
ALTER TABLE TB_education_institution ADD CONSTRAINT FK_education_institution_public_place FOREIGN KEY (ID_public_place) REFERENCES  TB_public_place (ID_public_place);

-- TB_encounter
ALTER TABLE TB_encounter ADD CONSTRAINT FK_encounter_organizer FOREIGN KEY (ID_organizer) REFERENCES TB_member(ID_member);
ALTER TABLE TB_encounter ADD CONSTRAINT FK_encounter_project FOREIGN KEY (ID_project) REFERENCES TB_project(ID_project);

-- TB_encounter_attendence
ALTER TABLE TB_encounter_attendance ADD CONSTRAINT FK_encounter_attendance_encounter FOREIGN KEY (ID_encounter) REFERENCES  TB_encounter(ID_encounter);
ALTER TABLE TB_encounter_attendance ADD CONSTRAINT FK_encounter_attendance_member FOREIGN KEY (ID_member) REFERENCES  TB_member(ID_member);

-- TB_encounter_image
ALTER TABLE TB_encounter_image ADD CONSTRAINT FK_encounter_image_encounter FOREIGN KEY (ID_encounter) REFERENCES  TB_encounter (ID_encounter);
ALTER TABLE TB_encounter_image ADD CONSTRAINT FK_encounter_image_image FOREIGN KEY (ID_image) REFERENCES  TB_image(ID_image);

-- TB_encounter_subject
ALTER TABLE TB_encounter_subject ADD CONSTRAINT FK_encounter_subject_encounter FOREIGN KEY (ID_encounter) REFERENCES TB_encounter(ID_encounter);
ALTER TABLE TB_encounter_subject ADD CONSTRAINT FK_encounter_subject_subject FOREIGN KEY (ID_subject) REFERENCES TB_subject(ID_subject);

-- TB_event
ALTER TABLE TB_event ADD CONSTRAINT FK_event_place FOREIGN KEY (ID_place) REFERENCES TB_place(ID_place);

-- TB_event_attendence
ALTER TABLE TB_event_attendance ADD CONSTRAINT FK_event_attendance_event FOREIGN KEY (ID_event) REFERENCES  TB_event(ID_event);
ALTER TABLE TB_event_attendance ADD CONSTRAINT FK_event_attendance_member FOREIGN KEY (ID_member) REFERENCES  TB_member(ID_member);

-- TB_event_image
ALTER TABLE TB_event_image ADD CONSTRAINT FK_event_image_event FOREIGN KEY (ID_event) REFERENCES  TB_event(ID_event);
ALTER TABLE TB_event_image ADD CONSTRAINT FK_event_image_image FOREIGN KEY (ID_image) REFERENCES  TB_image(ID_image);

-- TB_image
ALTER TABLE TB_image ADD CONSTRAINT FK_image_image_category FOREIGN KEY (ID_image_category) REFERENCES TB_image_category(ID_image_category);

-- TB_institution_course
ALTER TABLE TB_institution_course ADD CONSTRAINT FK_institution_course_course FOREIGN KEY (ID_course) REFERENCES  TB_course(ID_course);
ALTER TABLE TB_institution_course ADD CONSTRAINT FK_institution_course_education_institution FOREIGN KEY (ID_institution) REFERENCES  TB_education_institution(ID_education_institution);

-- TB_leader
ALTER TABLE TB_leader ADD CONSTRAINT FK_leader_member FOREIGN KEY (ID_member) REFERENCES  TB_member (ID_member);

-- TB_member
ALTER TABLE TB_member ADD CONSTRAINT FK_member_image FOREIGN KEY (ID_member_photo) REFERENCES  TB_image(ID_image);
ALTER TABLE TB_member ADD CONSTRAINT FK_member_institution_course FOREIGN KEY (ID_institution_course) REFERENCES  TB_institution_course(ID_institution_course);

-- TB_member_project
ALTER TABLE TB_member_project ADD CONSTRAINT FK_member_project_function FOREIGN KEY (ID_function) REFERENCES  TB_function(ID_function);
ALTER TABLE TB_member_project ADD CONSTRAINT FK_member_project_member FOREIGN KEY (ID_member) REFERENCES  TB_member(ID_member);
ALTER TABLE TB_member_project ADD CONSTRAINT FK_member_project_project FOREIGN KEY (ID_project) REFERENCES  TB_project(ID_project);

-- TB_member_role
ALTER TABLE TB_member_role ADD CONSTRAINT FK_member_role_function FOREIGN KEY (ID_role) REFERENCES TB_function(ID_function);
ALTER TABLE TB_member_role ADD CONSTRAINT FK_member_role_member FOREIGN KEY (ID_member) REFERENCES TB_member(ID_member);

-- TB_member_team
ALTER TABLE TB_member_team ADD CONSTRAINT FK_member_team_member FOREIGN KEY (ID_member) REFERENCES  TB_member(ID_member);
ALTER TABLE TB_member_team ADD CONSTRAINT FK_member_team_team FOREIGN KEY(ID_team) REFERENCES  TB_team(ID_team);

-- TB_online_encounter
ALTER TABLE TB_online_encounter ADD CONSTRAINT FK_online_encounter_encounter FOREIGN KEY (ID_encounter) REFERENCES TB_encounter(ID_encounter);
ALTER TABLE TB_online_encounter ADD CONSTRAINT FK_online_encounter_platform FOREIGN KEY (ID_platform) REFERENCES TB_platform(ID_platform);

-- TB_online_phase
ALTER TABLE TB_online_phase ADD CONSTRAINT FK_online_phase_phase FOREIGN KEY (ID_phase) REFERENCES  TB_phase(ID_phase);
ALTER TABLE TB_online_phase ADD CONSTRAINT FK_online_phase_platform FOREIGN KEY (ID_platform) REFERENCES  TB_platform(ID_platform);

-- TB_organizer_comittee
ALTER TABLE TB_organizer_comittee ADD CONSTRAINT FK_organizer_comittee_event FOREIGN KEY (ID_event) REFERENCES  TB_event(ID_event);
ALTER TABLE TB_organizer_comittee ADD CONSTRAINT FK_organizer_comittee_member FOREIGN KEY (ID_member) REFERENCES  TB_member(ID_member);

-- TB_phase
ALTER TABLE TB_phase ADD CONSTRAINT FK_phase_tournament FOREIGN KEY (ID_tournament) REFERENCES  TB_tournament (ID_tournament);

-- TB_place
ALTER TABLE TB_place ADD CONSTRAINT FK_place_public_place FOREIGN KEY (ID_public_place) REFERENCES  TB_public_place (ID_public_place);

-- TB_-- TB_presencial_encounter
ALTER TABLE TB_presencial_encounter ADD CONSTRAINT FK_presencial_encounter_encounter FOREIGN KEY (ID_encounter) REFERENCES TB_encounter(ID_encounter);
ALTER TABLE TB_presencial_encounter ADD CONSTRAINT FK_presencial_encounter_place FOREIGN KEY (ID_place) REFERENCES  TB_place(ID_place);


-- TB_presential_phase
ALTER TABLE TB_presential_phase ADD CONSTRAINT FK_presential_phase_phase FOREIGN KEY (ID_phase) REFERENCES  TB_phase(ID_phase);
ALTER TABLE TB_presential_phase ADD CONSTRAINT FK_presential_phase_place FOREIGN KEY (ID_place) REFERENCES  TB_place(ID_place);


-- TB_project
ALTER TABLE TB_project ADD CONSTRAINT FK_project_leader FOREIGN KEY (ID_leader) REFERENCES  TB_leader(ID_leader);
ALTER TABLE TB_project ADD CONSTRAINT FK_project_project_type FOREIGN KEY (ID_project_type) REFERENCES TB_project_type (ID_project_type);


-- TB_project_image
ALTER TABLE TB_project_image ADD CONSTRAINT FK_project_image_image FOREIGN KEY (ID_image) REFERENCES  TB_image(ID_image);
ALTER TABLE TB_project_image ADD CONSTRAINT FK_project_image_project FOREIGN KEY (ID_project) REFERENCES  TB_project (ID_project);


-- TB_project_subject
ALTER TABLE TB_project_subject ADD CONSTRAINT FK_project_subject_project FOREIGN KEY (ID_project) REFERENCES TB_project(ID_project);
ALTER TABLE TB_project_subject ADD CONSTRAINT FK_project_subject_subject FOREIGN KEY (ID_subject) REFERENCES TB_subject(ID_subject);

-- TB_public_place
ALTER TABLE TB_public_place ADD CONSTRAINT FK_public_place_city FOREIGN KEY (ID_city) REFERENCES  TB_city(ID_city);

-- TB_question
ALTER TABLE TB_question ADD CONSTRAINT FK_question_difficulty_degree FOREIGN KEY (ID_difficulty_degree) REFERENCES  TB_difficulty_degree(ID_difficulty_degree);

-- TB_question_subject
ALTER TABLE TB_question_subject ADD CONSTRAINT FK_question_subject_question FOREIGN KEY (ID_question) REFERENCES TB_question (ID_question);
ALTER TABLE TB_question_subject ADD CONSTRAINT FK_question_subject_subject FOREIGN KEY (ID_subject) REFERENCES TB_subject (ID_subject);

-- TB_scor_transaction
ALTER TABLE TB_score_transaction ADD CONSTRAINT FK_score_transaction_club_account FOREIGN KEY (ID_club_account) REFERENCES  TB_club_account(ID_club_account);
ALTER TABLE TB_score_transaction ADD CONSTRAINT FK_score_transaction_transaction_score_type FOREIGN KEY (ID_transaction_score_type) REFERENCES  TB_transaction_score_type(ID_transaction_score_type);

-- TB_score_transaction_event_attendance
ALTER TABLE TB_score_transaction_event_attendance ADD CONSTRAINT FK_score_transaction_event_attendance FOREIGN KEY (ID_event_attendance) REFERENCES  TB_event_attendance(ID_event_attendance);
ALTER TABLE TB_score_transaction_event_attendance ADD CONSTRAINT FK_score_transaction_event_attendance_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES  TB_score_transaction(ID_score_transaction);


-- TB_score_transection_member_role
ALTER TABLE TB_score_transaction_member_role ADD CONSTRAINT FK_score_transaction_member_role_member_role FOREIGN KEY (ID_member_role) REFERENCES  TB_member_role(ID_member_role);
ALTER TABLE TB_score_transaction_member_role ADD CONSTRAINT FK_score_transaction_member_role_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES  TB_score_transaction(ID_score_transaction);

-- TB_score_transaction_project
ALTER TABLE TB_score_transaction_project ADD CONSTRAINT FK_score_transaction_project_project FOREIGN KEY (ID_project) REFERENCES TB_project(ID_project);
ALTER TABLE TB_score_transaction_project ADD CONSTRAINT FK_score_transaction_project_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES TB_score_transaction(ID_score_transaction);

-- TB_score_transaction_question
ALTER TABLE TB_score_transaction_question ADD CONSTRAINT FK_score_transaction_question_question FOREIGN KEY (ID_question) REFERENCES TB_question(ID_question);
ALTER TABLE TB_score_transaction_question ADD CONSTRAINT FK_score_transaction_question_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES TB_score_transaction(ID_score_transaction);


-- TB_score_transaction_tournament_team_phase
ALTER TABLE TB_score_transaction_tournament_team_phase ADD CONSTRAINT FK_score_transaction_tournament_team_phase_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES TB_score_transaction(ID_score_transaction);
ALTER TABLE TB_score_transaction_tournament_team_phase ADD CONSTRAINT FK_score_transaction_tournament_team_phase_tournament_team_phas FOREIGN KEY (ID_tournament_team_phase) REFERENCES TB_tournament_team_phase(ID_tournament_team_phase);

-- TB_state
ALTER TABLE TB_state ADD CONSTRAINT FK_state_country FOREIGN KEY (ID_country) REFERENCES  TB_country(ID_country);

-- TB_team
ALTER TABLE TB_team ADD CONSTRAINT FK_team_captain FOREIGN KEY (ID_captain) REFERENCES  TB_captain(ID_captain);

-- TB_team_question_phase
ALTER TABLE TB_team_question_phase ADD CONSTRAINT FK_team_question_phase_question FOREIGN KEY (ID_question) REFERENCES  TB_question(ID_question);
ALTER TABLE TB_team_question_phase ADD CONSTRAINT FK_team_question_phase_status FOREIGN KEY (ID_status) REFERENCES  TB_status(ID_status);
ALTER TABLE TB_team_question_phase ADD CONSTRAINT FK_team_question_phase_tournament_team_phase FOREIGN KEY (ID_tournament_team_phase) REFERENCES  TB_tournament_team_phase (ID_tournament_team_phase);

-- TB_tournament
ALTER TABLE TB_tournament ADD CONSTRAINT FK_tournament_organizer FOREIGN KEY (ID_organizer) REFERENCES  TB_organizer(ID_organizer);

-- TB_tournament_team
ALTER TABLE TB_tournament_team ADD CONSTRAINT FK_tournament_team_team FOREIGN KEY (ID_team) REFERENCES  TB_team(ID_team);
ALTER TABLE TB_tournament_team ADD CONSTRAINT FK_tournament_team_tournament FOREIGN KEY (ID_tournament) REFERENCES  TB_tournament(ID_tournament);

-- TB_tournament_team_phase
ALTER TABLE TB_tournament_team_phase ADD CONSTRAINT FK_tournament_team_phase_phase FOREIGN KEY (ID_phase) REFERENCES  TB_phase(ID_phase);
ALTER TABLE TB_tournament_team_phase ADD CONSTRAINT FK_tournament_team_phase_tournament_team FOREIGN KEY (ID_tournament_team) REFERENCES  TB_tournament_team(ID_tournament_team);



