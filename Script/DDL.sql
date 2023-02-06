-- This Script is responsible for creating the Relational Database tables and establishing their restrictions.

-- Available at https://github.com/clubProgramacaoSSA/Programing-Club-Relational-Database
    -- Made by:
        --Adrian Widmer | GitHub: https://github.com/Awi-24
        --Antonio Horácio Magalhaes | GitHub: https://github.com/antoniohoracio77
        --Fernando Antonio Marques Schettini | GitHub: https://github.com/FernandoSchett
        --Orlando Mota Pires | GitHub: https://github.com/orlandomotapires

 
-- 1
CREATE TABLE IF NOT EXISTS captain(          
    ID_captain SERIAL NOT NULL PRIMARY KEY,
    ID_member INT NOT NULL,
    captain_name VARCHAR(500) NOT NULL  
);  

-- 2
CREATE TABLE IF NOT EXISTS certificate(          
    ID_certificate SERIAL NOT NULL PRIMARY KEY,
    ID_member INT NOT NULL,
    certificate_description VARCHAR(1000),
    DT_emission DATE NOT NULL DEFAULT CURRENT_DATE,
    hours INT NOT NULL CHECK (hours > 1),
    meta_points VARCHAR(1000) NOT NULL,
    URL_certificate VARCHAR(1000) NOT NULL UNIQUE 
);  

-- 3
CREATE TABLE IF NOT EXISTS city(        
    ID_city SERIAL NOT NULL PRIMARY KEY,
    ID_state INT NOT NULL,
    city_name VARCHAR(500) NOT NULL UNIQUE 
);       

-- 4
CREATE TABLE IF NOT EXISTS club_account(          
    ID_club_account SERIAL NOT NULL PRIMARY KEY,
    ID_member INT NOT NULL,
    login VARCHAR(500) NOT NULL UNIQUE,
    jpq_score INT NOT NULL,
    password VARCHAR(1000) NOT NULL 
);       

-- 5
CREATE TABLE IF NOT EXISTS country(          
    ID_country SERIAL NOT NULL PRIMARY KEY,
    country_name VARCHAR(500) UNIQUE NOT NULL  
);        

--6
CREATE TABLE IF NOT EXISTS course(         
    ID_course SERIAL NOT NULL PRIMARY KEY,
    course_name VARCHAR(500) NOT NULL UNIQUE  
);       

--7
CREATE TABLE IF NOT EXISTS difficulty_degree(          
    ID_difficulty_degree SERIAL NOT NULL PRIMARY KEY,
    difficulty VARCHAR(500) NOT NULL UNIQUE 
);       

--8
CREATE TABLE IF NOT EXISTS education_institution(          
    ID_education_institution SERIAL NOT NULL PRIMARY KEY,
    ID_place INT NOT NULL,
    education_institution_name VARCHAR(500) NOT NULL  
);      

--9
CREATE TABLE IF NOT EXISTS encounter(          
    ID_encounter SERIAL NOT NULL PRIMARY KEY,
    ID_organizer INT NOT NULL,
    ID_project INT NOT NULL,
    DT_start DATE,
    DT_end DATE   
);      

--10
CREATE TABLE IF NOT EXISTS encounter_attendance(     
    ID_encounter_attendance SERIAL NOT NULL PRIMARY KEY,
    ID_encounter INT NOT NULL,
    ID_member INT NOT NULL  
);      

--11
CREATE TABLE IF NOT EXISTS encounter_image(     
    ID_encounter_image SERIAL NOT NULL PRIMARY KEY,
    ID_encounter INT NOT NULL,
    ID_image INT NOT NULL 
);   

--12
CREATE TABLE IF NOT EXISTS encounter_subject(     
    ID_encounter_subject SERIAL NOT NULL PRIMARY KEY,
    ID_subject INT NOT NULL,
    ID_encounter INT NOT NULL  
);      

--13
CREATE TABLE IF NOT EXISTS event(     
    ID_event SERIAL NOT NULL PRIMARY KEY,
    ID_place INT NOT NULL,
    event_description VARCHAR(500),
    DT_start DATE,
    DT_end DATE,
    event_name VARCHAR(500) NOT NULL  
);       

--14
CREATE TABLE IF NOT EXISTS event_attendance(     
    ID_event_attendance SERIAL NOT NULL PRIMARY KEY,
    ID_member INT NOT NULL,
    ID_event INT NOT NULL,
    DT_start DATE,
    DT_end DATE,
    max_jpq_score INT DEFAULT 0   
);       

--15
CREATE TABLE IF NOT EXISTS event_image(     
    ID_event_image SERIAL NOT NULL PRIMARY KEY,
    ID_event INT NOT NULL,
    ID_image INT NOT NULL    
);      

--16
CREATE TABLE IF NOT EXISTS event_project(     
    ID_event_project SERIAL NOT NULL PRIMARY KEY,
    ID_event INT NOT NULL,
    ID_project INT NOT NULL,
    project_event_description VARCHAR(300)   
);      

--17
CREATE TABLE IF NOT EXISTS function(     
    ID_function SERIAL NOT NULL PRIMARY KEY,
    function_name VARCHAR(500) NOT NULL UNIQUE,
    function_description VARCHAR(500) UNIQUE,
    max_jpq_score INT DEFAULT 0 CHECK (max_jpq_score > -1) 
);        

--18
CREATE TABLE IF NOT EXISTS image(     
    ID_image SERIAL NOT NULL PRIMARY KEY,
    ID_image_category INT NOT NULL,
    image_description VARCHAR(500),
    image BYTEA UNIQUE,
    image_name VARCHAR(200) UNIQUE,
    DT_image DATE DEFAULT CURRENT_DATE,
    URL_image VARCHAR(1000) UNIQUE
);       

--19
CREATE TABLE IF NOT EXISTS image_category(     
    ID_image_category SERIAL NOT NULL PRIMARY KEY,
    image_category_name VARCHAR(500) UNIQUE NOT NULL  
);       

--20
CREATE TABLE IF NOT EXISTS institution_course(     
    ID_institution_course SERIAL NOT NULL PRIMARY KEY,
    ID_course INT NOT NULL,
    ID_institution INT NOT NULL  
);      

--21
CREATE TABLE IF NOT EXISTS leader(     
    ID_leader SERIAL NOT NULL PRIMARY KEY,
    ID_member INT NOT NULL,
    leader_name VARCHAR(500) NOT NULL  
);   

--22
CREATE TABLE IF NOT EXISTS member(     
    ID_member SERIAL NOT NULL PRIMARY KEY,
    ID_institution_course INT NOT NULL,
    ID_member_photo INT NOT NULL,
    ID_occupation INT NOT NULL,
    DT_birth DATE,
    DT_club_entrance DATE NOT NULL DEFAULT CURRENT_DATE,
    DT_college_entrance DATE NOT NULL,
    gender CHAR(1) NOT NULL,
    member_name VARCHAR(500) NOT NULL UNIQUE 
);      

--23
CREATE TABLE IF NOT EXISTS member_project(     
    ID_member_project SERIAL NOT NULL PRIMARY KEY,
    ID_member INT NOT NULL,
    ID_function INT NOT NULL,
    ID_project INT NOT NULL,
    DT_enter_project DATE NOT NULL DEFAULT CURRENT_DATE,
    DT_exit_project DATE  
);       

--24
CREATE TABLE IF NOT EXISTS member_role(     
    ID_member_role SERIAL NOT NULL PRIMARY KEY,
    ID_role INT NOT NULL,
    ID_member INT NOT NULL,
    DT_role_enter DATE NOT NULL DEFAULT CURRENT_DATE,
    DT_role_exit DATE 
);      

--25
CREATE TABLE IF NOT EXISTS member_team(     
    ID_member_team SERIAL NOT NULL PRIMARY KEY,
    ID_team INT NOT NULL,
    ID_member INT NOT NULL  
);      


--26
CREATE TABLE IF NOT EXISTS occupation(     
    ID_occupation SERIAL NOT NULL PRIMARY KEY,
    occupation_name VARCHAR(500) NOT NULL UNIQUE 
);     

--27
CREATE TABLE IF NOT EXISTS online_encounter(     
    ID_online_encounter SERIAL NOT NULL PRIMARY KEY,
    ID_platform INT NOT NULL,
    ID_encounter INT NOT NULL,
    URL_encounter VARCHAR(1000) UNIQUE,
    URL_record VARCHAR(1000) UNIQUE
);       

--28
CREATE TABLE IF NOT EXISTS online_phase(     
    ID_online_phase SERIAL NOT NULL PRIMARY KEY,
    ID_phase INT NOT NULL,
    ID_platform INT NOT NULL  
);      

--29
CREATE TABLE IF NOT EXISTS organizer(     
    ID_organizer SERIAL NOT NULL PRIMARY KEY,
    organizer_name VARCHAR(500) NOT NULL UNIQUE,
    organizer_description VARCHAR(500)  
);      

--30
CREATE TABLE IF NOT EXISTS organizing_comitteee(      
    ID_organizing_comitteee SERIAL NOT NULL PRIMARY KEY,
    ID_event INT NOT NULL,
    ID_member INT NOT NULL  
);  

--31     
CREATE TABLE IF NOT EXISTS phase(     
    ID_phase SERIAL NOT NULL PRIMARY KEY,
    ID_tournament INT NOT NULL,
    DT_start DATE NOT NULL,
    DT_end DATE NOT NULL,
    number_phase INT NOT NULL DEFAULT 1
);      

--32
CREATE TABLE IF NOT EXISTS place(     
    ID_place SERIAL NOT NULL PRIMARY KEY,
    ID_public_place INT NOT NULL,
    place_description VARCHAR(500) NOT NULL,
    place_name VARCHAR(500) NOT NULL UNIQUE 
);       

--33
CREATE TABLE IF NOT EXISTS platform(     
    ID_platform SERIAL NOT NULL PRIMARY KEY,
    URL_platform VARCHAR(500) NOT NULL UNIQUE,
    platform_name VARCHAR(500) NOT NULL UNIQUE  
);  

--34
CREATE TABLE IF NOT EXISTS presential_encounter(     
    ID_presential_encounter SERIAL NOT NULL PRIMARY KEY,
    ID_encounter INT NOT NULL,
    ID_place INT NOT NULL  
);       

--35
CREATE TABLE IF NOT EXISTS presential_phase(     
    ID_presential_phase SERIAL NOT NULL PRIMARY KEY,
    ID_phase INT NOT NULL,
    ID_place INT NOT NULL  
);       

--36
CREATE TABLE IF NOT EXISTS project(     
    ID_project SERIAL NOT NULL PRIMARY KEY,
    ID_face_image INT NOT NULL,
    ID_leader INT NOT NULL,
    ID_project_type INT NOT NULL,
    project_description VARCHAR(500),
    DT_start DATE DEFAULT CURRENT_DATE,
    DT_end DATE,
    DT_foreseen_end DATE,
    project_name VARCHAR(500),
    max_jpq_score INT CHECK (max_jpq_score > 0),
    URL_gitHub VARCHAR(500) UNIQUE
);       

--37
CREATE TABLE IF NOT EXISTS project_image(     
    ID_project_image SERIAL NOT NULL PRIMARY KEY,
    ID_image INT NOT NULL,
    ID_project INT NOT NULL  
);       

--38
CREATE TABLE IF NOT EXISTS project_subject(     
    ID_project_subject SERIAL NOT NULL PRIMARY KEY,
    ID_subject INT NOT NULL,
    ID_project INT NOT NULL  
);      

--39
CREATE TABLE IF NOT EXISTS project_type(     
    ID_project_type SERIAL NOT NULL PRIMARY KEY,
    project_type VARCHAR(500) NOT NULL UNIQUE
);    

--40
CREATE TABLE IF NOT EXISTS public_place(     
    ID_public_place SERIAL NOT NULL PRIMARY KEY,
    ID_city INT NOT NULL,
    CEP VARCHAR(500) NOT NULL,
    complement VARCHAR(1000),
 	district_name VARCHAR(500) NOT NULL,
    number VARCHAR(500) NOT NULL,
    street_name VARCHAR(500) NOT NULL 
);   
--41
CREATE TABLE IF NOT EXISTS question(     
    ID_question SERIAL NOT NULL PRIMARY KEY,
    ID_difficulty_degree INT NOT NULL,
    ID_question_origin INT NOT NULL,
    statement VARCHAR(200) NOT NULL,
    question_name VARCHAR(500) NOT NULL,
    correct_answer VARCHAR(1000),
    max_jpq_score INT CHECK (max_jpq_score > 0)
);       

--42
CREATE TABLE IF NOT EXISTS question_origin(     
    ID_question_origin SERIAL NOT NULL PRIMARY KEY,
    question_origin VARCHAR (500) NOT NULL  
);      

--43
CREATE TABLE IF NOT EXISTS question_subject(     
    ID_question_subject SERIAL NOT NULL PRIMARY KEY,
    ID_subject INT NOT NULL,
    ID_question INT NOT NULL 
);   

--44
CREATE TABLE IF NOT EXISTS score_transaction(     
    ID_score_transaction SERIAL NOT NULL PRIMARY KEY,
    ID_club_account INT NOT NULL,
    ID_score_transaction_type INT NOT NULL,
    DT_transaction DATE NOT NULL DEFAULT CURRENT_DATE,
    HR_transaction TIME NOT NULL DEFAULT CURRENT_TIME,
    score_jpq_quantity INT NOT NULL
);       

--45
CREATE TABLE IF NOT EXISTS score_transaction_event_attendance(     
    ID_score_transaction_event_attendance SERIAL NOT NULL PRIMARY KEY,
    ID_score_transaction INT NOT NULL,
    ID_event_attendance INT NOT NULL  
);      

--46
CREATE TABLE IF NOT EXISTS score_transaction_project(     
    ID_score_transaction_project SERIAL NOT NULL PRIMARY KEY,
    ID_score_transaction INT NOT NULL,
    ID_project INT NOT NULL,
    project_rating VARCHAR(1000)  
);       

--47
CREATE TABLE IF NOT EXISTS score_transaction_question(     
    ID_score_transaction_question SERIAL NOT NULL PRIMARY KEY,
    ID_score_transaction INT NOT NULL,
    ID_question INT NOT NULL,
    question_rating VARCHAR(1000)   
);   

--48
CREATE TABLE IF NOT EXISTS score_transaction_role(     
    ID_score_transaction_role SERIAL NOT NULL PRIMARY KEY,
    ID_member_role INT NOT NULL,
    ID_score_transaction INT NOT NULL  
);   

--49
CREATE TABLE IF NOT EXISTS score_transaction_tournament_team_phase(     
    ID_score_transaction_tournament_team_phase SERIAL NOT NULL PRIMARY KEY,
    ID_tournament_team_phase INT NOT NULL,
    ID_score_transaction INT NOT NULL  
);   

--50
CREATE TABLE IF NOT EXISTS score_transaction_type(     
    ID_score_transaction_type SERIAL NOT NULL PRIMARY KEY,     
    score_transaction_type VARCHAR (500) NOT NULL UNIQUE
);  

--51
CREATE TABLE IF NOT EXISTS state(
    ID_state SERIAL NOT NULL PRIMARY KEY,
    ID_country INT NOT NULL,
    state_name VARCHAR(500) NOT NULL
);

--52
CREATE TABLE IF NOT EXISTS status(
    ID_status SERIAL NOT NULL PRIMARY KEY,
    status_description VARCHAR(500) NOT NULL UNIQUE
);

--53
CREATE TABLE IF NOT EXISTS subject(
    ID_subject SERIAL NOT NULL PRIMARY KEY,
    subject VARCHAR(500) NOT NULL UNIQUE
);

--54
CREATE TABLE IF NOT EXISTS team(
    ID_team SERIAL NOT NULL PRIMARY KEY,
    ID_captain INT NOT NULL,
    DT_creation DATE NOT NULL,
    team_name VARCHAR(500) NOT NULL 
);

--55
CREATE TABLE IF NOT EXISTS tournament(
    ID_tournament SERIAL NOT NULL PRIMARY KEY,
    ID_organizer INT NOT NULL,     
    tournament_name VARCHAR(500) NOT NULL,     
    DT_start DATE DEFAULT CURRENT_DATE,     
    DT_end DATE 
);

--56
CREATE TABLE IF NOT EXISTS tournament_team(
    ID_tournament_team SERIAL NOT NULL PRIMARY KEY,
    ID_team INT NOT NULL,
    ID_tournament INT NOT NULL,
    team_placing INT NOT NULL UNIQUE CHECK (team_placing > 0)
);

--57
CREATE TABLE IF NOT EXISTS tournament_team_phase(
    ID_tournament_team_phase SERIAL NOT NULL PRIMARY KEY,
    ID_tournament_team INT NOT NULL,
    ID_phase INT NOT NULL, 
    placing_phase INT NOT NULL UNIQUE CHECK (placing_phase > 0),
    max_jpq_score INT 
);

--58
CREATE TABLE IF NOT EXISTS tournament_team_phase_question(
    ID_tournament_team_phase_question SERIAL NOT NULL PRIMARY KEY,
    ID_tournament_team_phase INT NOT NULL,
    ID_question INT NOT NULL,
    ID_status INT NOT NULL,
    attempts_number INT DEFAULT 0 
);   
 
-- GENDER CONSTRAINT
ALTER TABLE member ADD CONSTRAINT CK_gender_member CHECK(gender in('F','M'));

-- encounter_subject
ALTER TABLE encounter_subject ADD CONSTRAINT FK_encounter_subject_subject FOREIGN KEY (ID_subject) REFERENCES subject(ID_subject);
ALTER TABLE encounter_subject ADD CONSTRAINT FK_encounter_subject_encounter FOREIGN KEY (ID_encounter) REFERENCES encounter(ID_encounter);

-- project_subject
ALTER TABLE project_subject ADD CONSTRAINT FK_project_subject_subject FOREIGN KEY (ID_subject) REFERENCES subject(ID_subject);
ALTER TABLE project_subject ADD CONSTRAINT FK_project_subject_project FOREIGN KEY (ID_project) REFERENCES project(ID_project);

-- question_subject
ALTER TABLE question_subject ADD CONSTRAINT FK_question_subject_subject FOREIGN KEY (ID_subject) REFERENCES subject (ID_subject);
ALTER TABLE question_subject ADD CONSTRAINT FK_question_subject_question FOREIGN KEY (ID_question) REFERENCES question (ID_question);

-- captain
ALTER TABLE captain ADD CONSTRAINT FK_captain_member FOREIGN KEY (ID_member) REFERENCES member(ID_member);

--member_role
ALTER TABLE member_role ADD CONSTRAINT FK_member_role_function FOREIGN KEY (ID_role) REFERENCES function(ID_function);
ALTER TABLE member_role ADD CONSTRAINT FK_member_role_member FOREIGN KEY (ID_member) REFERENCES member(ID_member);

--certificate
ALTER TABLE certificate ADD CONSTRAINT FK_certificate_member FOREIGN KEY (ID_member) REFERENCES member(ID_member);

-- city
ALTER TABLE city ADD CONSTRAINT FK_city_state FOREIGN KEY (ID_state) REFERENCES state(ID_state);

-- organizing_comitteee
ALTER TABLE organizing_comitteee ADD CONSTRAINT FK_organizing_comitteee_event FOREIGN KEY (ID_event) REFERENCES  event(ID_event);
ALTER TABLE organizing_comitteee ADD CONSTRAINT FK_organizing_comitteee_member FOREIGN KEY (ID_member) REFERENCES  member(ID_member);

-- club_account
ALTER TABLE club_account ADD CONSTRAINT FK_club_account_member FOREIGN KEY (ID_member) REFERENCES member(ID_member);

-- institution_course
ALTER TABLE institution_course ADD CONSTRAINT FK_institution_course_course FOREIGN KEY (ID_course) REFERENCES  course(ID_course);
ALTER TABLE institution_course ADD CONSTRAINT FK_institution_course_education_institution FOREIGN KEY (ID_institution) REFERENCES  education_institution(ID_education_institution);

-- encounter
ALTER TABLE encounter ADD CONSTRAINT FK_encounter_organizer FOREIGN KEY (ID_organizer) REFERENCES member(ID_member);
ALTER TABLE encounter ADD CONSTRAINT FK_encounter_project FOREIGN KEY (ID_project) REFERENCES project(ID_project);

-- online_encounter 
ALTER TABLE online_encounter ADD CONSTRAINT FK_online_encounter_plataform FOREIGN KEY (ID_platform) REFERENCES platform(ID_platform);
ALTER TABLE online_encounter ADD CONSTRAINT FK_online_encounter_encounter FOREIGN KEY (ID_encounter) REFERENCES encounter(ID_encounter);

-- presential_encounter
ALTER TABLE presential_encounter ADD CONSTRAINT FK_presential_encounter_encounter FOREIGN KEY (ID_encounter) REFERENCES encounter(ID_encounter);
ALTER TABLE presential_encounter ADD CONSTRAINT FK_presential_encounter_place FOREIGN KEY (ID_place) REFERENCES  place(ID_place);

-- team
ALTER TABLE team ADD CONSTRAINT FK_team_captain FOREIGN KEY (ID_captain) REFERENCES  captain(ID_captain);

-- tournament_team
ALTER TABLE tournament_team ADD CONSTRAINT FK_tournament_team_team FOREIGN KEY (ID_team) REFERENCES  team(ID_team);
ALTER TABLE tournament_team ADD CONSTRAINT FK_tournament_team_tournament FOREIGN KEY (ID_tournament) REFERENCES  tournament(ID_tournament);

-- tournament_team_phase
ALTER TABLE tournament_team_phase ADD CONSTRAINT FK_tournament_team_phase_tournament_team FOREIGN KEY (ID_tournament_team) REFERENCES  tournament_team(ID_tournament_team);
ALTER TABLE tournament_team_phase ADD CONSTRAINT FK_tournament_team_phase_phase FOREIGN KEY (ID_phase) REFERENCES  phase(ID_phase);

-- state
ALTER TABLE state ADD CONSTRAINT FK_state_country FOREIGN KEY (ID_country) REFERENCES  country(ID_country);

-- event
ALTER TABLE event ADD CONSTRAINT FK_event_place FOREIGN KEY (ID_place) REFERENCES place(ID_place);

--event_project
ALTER TABLE event_project ADD CONSTRAINT FK_event_project_event FOREIGN KEY (ID_event) REFERENCES event(ID_event);
ALTER TABLE event_project ADD CONSTRAINT FK_event_project_project FOREIGN KEY (ID_project) REFERENCES project(ID_project);

-- phase
ALTER TABLE phase ADD CONSTRAINT FK_phase_tournament FOREIGN KEY (ID_tournament) REFERENCES  tournament (ID_tournament);

-- online_phase
ALTER TABLE online_phase ADD CONSTRAINT FK_online_phase_phase FOREIGN KEY (ID_phase) REFERENCES  phase(ID_phase);
ALTER TABLE online_phase ADD CONSTRAINT FK_online_phase_platform FOREIGN KEY (ID_platform) REFERENCES  platform(ID_platform);

-- presential_phase
ALTER TABLE presential_phase ADD CONSTRAINT FK_presential_phase_phase FOREIGN KEY (ID_phase) REFERENCES  phase(ID_phase);
ALTER TABLE presential_phase ADD CONSTRAINT FK_presential_phase_place FOREIGN KEY (ID_place) REFERENCES  place(ID_place);

-- tournament_team_phase_question
ALTER TABLE tournament_team_phase_question ADD CONSTRAINT FK_tournament_team_phase_question_tournament_team_phase FOREIGN KEY (ID_tournament_team_phase) REFERENCES  tournament_team_phase (ID_tournament_team_phase);
ALTER TABLE tournament_team_phase_question ADD CONSTRAINT FK_tournament_team_phase_question_question FOREIGN KEY (ID_question) REFERENCES  question(ID_question);
ALTER TABLE tournament_team_phase_question ADD CONSTRAINT FK_tournament_team_phase_question_status FOREIGN KEY (ID_status) REFERENCES  status(ID_status);

-- image
ALTER TABLE image ADD CONSTRAINT FK_image_image_category FOREIGN KEY (ID_image_category) REFERENCES image_category(ID_image_category);

-- encounter_image
ALTER TABLE encounter_image ADD CONSTRAINT FK_encounter_image_encounter FOREIGN KEY (ID_encounter) REFERENCES  encounter (ID_encounter);
ALTER TABLE encounter_image ADD CONSTRAINT FK_encounter_image_image FOREIGN KEY (ID_image) REFERENCES  image(ID_image);

-- project_image
ALTER TABLE project_image ADD CONSTRAINT FK_project_image_image FOREIGN KEY (ID_image) REFERENCES  image(ID_image);
ALTER TABLE project_image ADD CONSTRAINT FK_project_image_project FOREIGN KEY (ID_project) REFERENCES  project (ID_project);

-- event_image
ALTER TABLE event_image ADD CONSTRAINT FK_event_image_event FOREIGN KEY (ID_event) REFERENCES  event(ID_event);
ALTER TABLE event_image ADD CONSTRAINT FK_event_image_image FOREIGN KEY (ID_image) REFERENCES  image(ID_image);

-- education_institution
ALTER TABLE education_institution ADD CONSTRAINT FK_education_institution_place FOREIGN KEY (ID_place) REFERENCES  place (ID_place);

-- leader
ALTER TABLE leader ADD CONSTRAINT FK_leader_member FOREIGN KEY (ID_member) REFERENCES  member(ID_member);

-- place
ALTER TABLE place ADD CONSTRAINT FK_place_public_place FOREIGN KEY (ID_public_place) REFERENCES  public_place (ID_public_place);

-- public_place
ALTER TABLE public_place ADD CONSTRAINT FK_public_place_city FOREIGN KEY (ID_city) REFERENCES  city(ID_city);

-- member
ALTER TABLE member ADD CONSTRAINT FK_member_institution_course FOREIGN KEY (ID_institution_course) REFERENCES  institution_course(ID_institution_course);
ALTER TABLE member ADD CONSTRAINT FK_member_image FOREIGN KEY (ID_member_photo) REFERENCES  image(ID_image);
ALTER TABLE member ADD CONSTRAINT FK_member_occupation FOREIGN KEY (ID_occupation) REFERENCES  occupation(ID_occupation);

-- member_team
ALTER TABLE member_team ADD CONSTRAINT FK_member_team_team FOREIGN KEY(ID_team) REFERENCES  team(ID_team);
ALTER TABLE member_team ADD CONSTRAINT FK_member_team_member FOREIGN KEY (ID_member) REFERENCES  member(ID_member);

-- member_project 
ALTER TABLE member_project ADD CONSTRAINT FK_member_project_member FOREIGN KEY (ID_member) REFERENCES  member(ID_member);
ALTER TABLE member_project ADD CONSTRAINT FK_member_project_project FOREIGN KEY (ID_project) REFERENCES  project(ID_project);
ALTER TABLE member_project ADD CONSTRAINT FK_member_project_function FOREIGN KEY (ID_function) REFERENCES  function(ID_function);

--score_transaction
ALTER TABLE score_transaction ADD CONSTRAINT FK_score_transaction_club_account FOREIGN KEY (ID_club_account) REFERENCES  club_account(ID_club_account);
ALTER TABLE score_transaction ADD CONSTRAINT FK_score_transaction_score_transaction_type FOREIGN KEY (ID_score_transaction_type) REFERENCES  score_transaction_type(ID_score_transaction_type);

--score_transaction_role
ALTER TABLE score_transaction_role ADD CONSTRAINT FK_score_transaction_role_member_role FOREIGN KEY (ID_member_role) REFERENCES  member_role(ID_member_role);
ALTER TABLE score_transaction_role ADD CONSTRAINT FK_score_transaction_role_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES  score_transaction(ID_score_transaction);

--score_transaction_event_attendance
ALTER TABLE score_transaction_event_attendance ADD CONSTRAINT FK_score_transaction_event_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES  score_transaction(ID_score_transaction);
ALTER TABLE score_transaction_event_attendance ADD CONSTRAINT FK_score_transaction_event_attendance FOREIGN KEY (ID_event_attendance) REFERENCES  event_attendance(ID_event_attendance);

-- score_transaction_project
ALTER TABLE score_transaction_project ADD CONSTRAINT FK_score_transaction_project_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES score_transaction(ID_score_transaction);
ALTER TABLE score_transaction_project ADD CONSTRAINT FK_score_transaction_project_project FOREIGN KEY (ID_project) REFERENCES project(ID_project);

-- score_transaction_question
ALTER TABLE score_transaction_question ADD CONSTRAINT FK_score_transaction_question_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES score_transaction(ID_score_transaction);
ALTER TABLE score_transaction_question ADD CONSTRAINT FK_score_transaction_question_question FOREIGN KEY (ID_question) REFERENCES question(ID_question);

-- score_transaction_tournament_team_phase
ALTER TABLE score_transaction_tournament_team_phase ADD CONSTRAINT FK_score_transaction_tournament_team_phase_tournament_team_phase FOREIGN KEY (ID_tournament_team_phase) REFERENCES tournament_team_phase(ID_tournament_team_phase);
ALTER TABLE score_transaction_tournament_team_phase ADD CONSTRAINT FK_score_transaction_tournament_team_phase_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES score_transaction(ID_score_transaction);

-- event_attendance
ALTER TABLE event_attendance ADD CONSTRAINT FK_event_attendance_event FOREIGN KEY (ID_event) REFERENCES event(ID_event);
ALTER TABLE event_attendance ADD CONSTRAINT FK_event_attendance_member FOREIGN KEY (ID_member) REFERENCES member(ID_member);

-- encounter_attendance
ALTER TABLE encounter_attendance ADD CONSTRAINT FK_encounter_attendance_encounter FOREIGN KEY (ID_encounter) REFERENCES  encounter(ID_encounter);
ALTER TABLE encounter_attendance ADD CONSTRAINT FK_encounter_attendance_member FOREIGN KEY (ID_member) REFERENCES  member(ID_member);

-- project
ALTER TABLE project ADD CONSTRAINT FK_project_leader FOREIGN KEY (ID_leader) REFERENCES leader(ID_leader);
ALTER TABLE project ADD CONSTRAINT FK_project_project_type FOREIGN KEY (ID_project_type) REFERENCES project_type(ID_project_type);
ALTER TABLE project ADD CONSTRAINT FK_project_face_image FOREIGN KEY (ID_face_image) REFERENCES image(ID_image);

-- question
ALTER TABLE question ADD CONSTRAINT FK_question_difficulty_degree FOREIGN KEY (ID_difficulty_degree) REFERENCES difficulty_degree(ID_difficulty_degree);
ALTER TABLE question ADD CONSTRAINT FK_question_question_origin FOREIGN KEY (ID_question_origin) REFERENCES question_origin(ID_question_origin);

-- tournament
ALTER TABLE tournament ADD CONSTRAINT FK_tournament_organizer FOREIGN KEY (ID_organizer) REFERENCES  organizer(ID_organizer);