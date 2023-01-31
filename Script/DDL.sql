-- This Script is responsible for creating the Relational Database tables and establishing their restrictions.

-- Available at https://github.com/clubProgramacaoSSA/Programing-Club-Relational-Database
    -- Made by:
        --Adrian Widmer | GitHub: https://github.com/Awi-24
        --Antonio Horácio Magalhaes | GitHub: https://github.com/antoniohoracio77
        --Fernando Antonio Marques Schettini | GitHub: https://github.com/FernandoSchett
        --Orlando Mota Pires | GitHub: https://github.com/orlandomotapires

 
-- 1
CREATE TABLE IF NOT EXISTS TB_captain(          
    ID_captain SERIAL NOT NULL PRIMARY KEY,
    ID_member INT NOT NULL,
    captain_name VARCHAR(500) NOT NULL  
);  

-- 2
CREATE TABLE IF NOT EXISTS TB_certificate(          
    ID_certificate SERIAL NOT NULL PRIMARY KEY,
    ID_member INT NOT NULL,
    certificate_description VARCHAR(1000),
    DT_emission DATE NOT NULL,
    hours INT NOT NULL,
    meta_points VARCHAR(1000) NOT NULL,
    URL_certificate VARCHAR(1000) NOT NULL 
);  

-- 3
CREATE TABLE IF NOT EXISTS TB_city(        
    ID_city SERIAL NOT NULL PRIMARY KEY,
    ID_state INT NOT NULL,
    city_name VARCHAR(500) NOT NULL 
);       

-- 4
CREATE TABLE IF NOT EXISTS TB_club_account(          
    ID_club_account SERIAL NOT NULL PRIMARY KEY,
    ID_member INT NOT NULL,
    login VARCHAR(500) NOT NULL,
    jpq_score INT NOT NULL,
    password VARCHAR(1000) NOT NULL 
);       

-- 5
CREATE TABLE IF NOT EXISTS TB_country(          
    ID_country SERIAL NOT NULL PRIMARY KEY,
    country_name VARCHAR(500)  
);        

--6
CREATE TABLE IF NOT EXISTS TB_course(         
    ID_course SERIAL NOT NULL PRIMARY KEY,
    course_name VARCHAR(500) NOT NULL UNIQUE  
);       

--7
CREATE TABLE IF NOT EXISTS TB_difficulty_degree(          
    ID_difficulty_degree SERIAL NOT NULL PRIMARY KEY,
    difficulty VARCHAR(500) NOT NULL 
);       

--8
CREATE TABLE IF NOT EXISTS TB_education_institution(          
    ID_education_institution SERIAL NOT NULL PRIMARY KEY,
    ID_place INT NOT NULL,
    education_institution_name VARCHAR(500) NOT NULL  
);      

--9
CREATE TABLE IF NOT EXISTS TB_encounter(          
    ID_encounter SERIAL NOT NULL PRIMARY KEY,
    ID_organizer INT NOT NULL,
    ID_project INT NOT NULL,
    DT_start DATE,
    DT_end DATE  
);      

--10
CREATE TABLE IF NOT EXISTS TB_encounter_attendance(     
    ID_encounter_attendance SERIAL NOT NULL PRIMARY KEY,
    ID_encounter INT NOT NULL,
    ID_member INT NOT NULL  
);      

--11
CREATE TABLE IF NOT EXISTS TB_encounter_image(     
    ID_encounter_image SERIAL NOT NULL PRIMARY KEY,
    ID_encounter INT NOT NULL,
    ID_image INT NOT NULL 
);   

--12
CREATE TABLE IF NOT EXISTS TB_encounter_subject(     
    ID_encounter_subject SERIAL NOT NULL PRIMARY KEY,
    ID_subject INT NOT NULL,
    ID_encounter INT NOT NULL  
);      

--13
CREATE TABLE IF NOT EXISTS TB_event(     
    ID_event SERIAL NOT NULL PRIMARY KEY,
    ID_place INT NOT NULL,
    event_description VARCHAR(500),
    DT_start DATE,
    DT_end DATE,
    event_name VARCHAR(500) NOT NULL  
);       

--14
CREATE TABLE IF NOT EXISTS TB_event_attendance(     
    ID_event_attendance SERIAL NOT NULL PRIMARY KEY,
    ID_member INT NOT NULL,
    ID_event INT NOT NULL,
    DT_start DATE,
    DT_end DATE,
    max_jpq_score INT   
);       

--15
CREATE TABLE IF NOT EXISTS TB_event_image(     
    ID_event_image SERIAL NOT NULL PRIMARY KEY,
    ID_event INT NOT NULL,
    ID_image INT NOT NULL    
);      

--16
CREATE TABLE IF NOT EXISTS TB_event_project(     
    ID_event_project SERIAL NOT NULL PRIMARY KEY,
    ID_event INT NOT NULL,
    ID_project INT NOT NULL,
    project_event_description VARCHAR(300) NOT NULL   
);      

--17
CREATE TABLE IF NOT EXISTS TB_function(     
    ID_function SERIAL NOT NULL PRIMARY KEY,
    function_name VARCHAR(500) NOT NULL,
    function_description VARCHAR(500) NOT NULL,
    max_jpq_score INT  
);        

--18
CREATE TABLE IF NOT EXISTS TB_image(     
    ID_image SERIAL NOT NULL PRIMARY KEY,
    ID_image_category INT NOT NULL,
    image_description VARCHAR(500),
    image BYTEA,
    image_name VARCHAR(200),
    DT_image DATE,
    URL_image VARCHAR(1000) 
);       

--19
CREATE TABLE IF NOT EXISTS TB_image_category(     
    ID_image_category SERIAL NOT NULL PRIMARY KEY,
    image_category_name VARCHAR(500) UNIQUE  
);       

--20
CREATE TABLE IF NOT EXISTS TB_institution_course(     
    ID_institution_course SERIAL NOT NULL PRIMARY KEY,
    ID_course INT NOT NULL,
    ID_institution INT NOT NULL  
);      

--21
CREATE TABLE IF NOT EXISTS TB_leader(     
    ID_leader SERIAL NOT NULL PRIMARY KEY,
    ID_member INT NOT NULL,
    leader_name VARCHAR(500) NOT NULL  
);   

--22
CREATE TABLE IF NOT EXISTS TB_member(     
    ID_member SERIAL NOT NULL PRIMARY KEY,
    ID_institution_course INT NOT NULL,
    ID_member_photo INT NOT NULL,
    ID_occupation INT NOT NULL,
    DT_birth DATE,
    DT_club_entrance DATE NOT NULL,
    DT_college_entrance DATE NOT NULL,
    gender CHAR(1) NOT NULL,
    member_name VARCHAR(500) NOT NULL 
);      

--23
CREATE TABLE IF NOT EXISTS TB_member_project(     
    ID_member_project SERIAL NOT NULL PRIMARY KEY,
    ID_member INT NOT NULL,
    ID_function INT NOT NULL,
    ID_project INT NOT NULL,
    DT_enter_project DATE NOT NULL,
    DT_exit_project DATE  
);       

--24
CREATE TABLE IF NOT EXISTS TB_member_role(     
    ID_member_role SERIAL NOT NULL PRIMARY KEY,
    ID_role INT NOT NULL,
    ID_member INT NOT NULL,
    DT_role_enter DATE NOT NULL,
    DT_role_exit DATE 
);      

--25
CREATE TABLE IF NOT EXISTS TB_member_team(     
    ID_member_team SERIAL NOT NULL PRIMARY KEY,
    ID_team INT NOT NULL,
    ID_member INT NOT NULL  
);      


--26
CREATE TABLE IF NOT EXISTS TB_occupation(     
    ID_occupation SERIAL NOT NULL PRIMARY KEY,
    occupation_name VARCHAR(500) NOT NULL 
);     

--27
CREATE TABLE IF NOT EXISTS TB_online_encounter(     
    ID_online_encounter SERIAL NOT NULL PRIMARY KEY,
    ID_platform INT NOT NULL,
    ID_encounter INT NOT NULL,
    URL_encounter VARCHAR(1000),
    URL_record VARCHAR(1000) 
);       

--28
CREATE TABLE IF NOT EXISTS TB_online_phase(     
    ID_online_phase SERIAL NOT NULL PRIMARY KEY,
    ID_phase INT NOT NULL,
    ID_platform INT NOT NULL  
);      

--29
CREATE TABLE IF NOT EXISTS TB_organizer(     
    ID_organizer SERIAL NOT NULL PRIMARY KEY,
    organizer_name VARCHAR(500) NOT NULL,
    organizer_description VARCHAR(500)  
);      

--30
CREATE TABLE IF NOT EXISTS TB_organizing_comitteee(      
    ID_organizing_comitteee SERIAL NOT NULL PRIMARY KEY,
    ID_event INT NOT NULL,
    ID_member INT NOT NULL  
);  

--31     
CREATE TABLE IF NOT EXISTS TB_phase(     
    ID_phase SERIAL NOT NULL PRIMARY KEY,
    ID_tournament INT NOT NULL,
    DT_start DATE NOT NULL,
    DT_end DATE NOT NULL,
    number_phase INT NOT NULL 
);      

--32
CREATE TABLE IF NOT EXISTS TB_place(     
    ID_place SERIAL NOT NULL PRIMARY KEY,
    ID_public_place INT NOT NULL,
    place_description VARCHAR(500) NOT NULL,
    place_name VARCHAR(500) NOT NULL 
);       

--33
CREATE TABLE IF NOT EXISTS TB_platform(     
    ID_platform SERIAL NOT NULL PRIMARY KEY,
    URL_platform VARCHAR(500) NOT NULL UNIQUE,
    platform_name VARCHAR(500) NOT NULL UNIQUE  
);  

--34
CREATE TABLE IF NOT EXISTS TB_presential_encounter(     
    ID_presential_encounter SERIAL NOT NULL PRIMARY KEY,
    ID_encounter INT NOT NULL,
    ID_place INT NOT NULL  
);       

--35
CREATE TABLE IF NOT EXISTS TB_presential_phase(     
    ID_presential_phase SERIAL NOT NULL PRIMARY KEY,
    ID_phase INT NOT NULL,
    ID_place INT NOT NULL  
);       

--36
CREATE TABLE IF NOT EXISTS TB_project(     
    ID_project SERIAL NOT NULL PRIMARY KEY,
    ID_face_image INT NOT NULL,
    ID_leader INT NOT NULL,
    ID_project_type INT NOT NULL,
    project_description VARCHAR(500),
    DT_start DATE,
    DT_end DATE,
    DT_foreseen_end DATE,
    project_name VARCHAR(500),
    max_jpq_score INT,
    URL_gitHub VARCHAR(500)  
);       

--37
CREATE TABLE IF NOT EXISTS TB_project_image(     
    ID_project_image SERIAL NOT NULL PRIMARY KEY,
    ID_image INT NOT NULL,
    ID_project INT NOT NULL  
);       

--38
CREATE TABLE IF NOT EXISTS TB_project_subject(     
    ID_project_subject SERIAL NOT NULL PRIMARY KEY,
    ID_subject INT NOT NULL,
    ID_project INT NOT NULL  
);      

--39
CREATE TABLE IF NOT EXISTS TB_project_type(     
    ID_project_type SERIAL NOT NULL PRIMARY KEY,
    project_type VARCHAR(500) NOT NULL  
);    

--40
CREATE TABLE IF NOT EXISTS TB_public_place(     
    ID_public_place SERIAL NOT NULL PRIMARY KEY,
    ID_city INT NOT NULL,
    CEP VARCHAR(500) NOT NULL,
    complement VARCHAR(1000),
 	district_name VARCHAR(500) NOT NULL,
    number VARCHAR(500) NOT NULL,
    street_name VARCHAR(500) NOT NULL 
);   
--41
CREATE TABLE IF NOT EXISTS TB_question(     
    ID_question SERIAL NOT NULL PRIMARY KEY,
    ID_difficulty_degree INT NOT NULL,
    ID_question_origin INT NOT NULL,
    statement VARCHAR(200) NOT NULL,
    question_name VARCHAR(500) NOT NULL,
    correct_answer VARCHAR(1000),
    max_jpq_score INT  
);       

--42
CREATE TABLE IF NOT EXISTS TB_question_origin(     
    ID_question_origin SERIAL NOT NULL PRIMARY KEY,
    question_origin VARCHAR (500) NOT NULL  
);      

--43
CREATE TABLE IF NOT EXISTS TB_question_subject(     
    ID_question_subject SERIAL NOT NULL PRIMARY KEY,
    ID_subject INT NOT NULL,
    ID_question INT NOT NULL 
);   

--44
CREATE TABLE IF NOT EXISTS TB_score_transaction(     
    ID_score_transaction SERIAL NOT NULL PRIMARY KEY,
    ID_club_account INT NOT NULL,
    ID_score_transaction_type INT NOT NULL,
    DT_transaction DATE NOT NULL,
    HR_transaction TIME NOT NULL,
    score_jpq_quantity INT NOT NULL 
);       

--45
CREATE TABLE IF NOT EXISTS TB_score_transaction_event_attendance(     
    ID_score_transaction_event_attendance SERIAL NOT NULL PRIMARY KEY,
    ID_score_transaction INT NOT NULL,
    ID_event_attendance INT NOT NULL  
);      

--46
CREATE TABLE IF NOT EXISTS TB_score_transaction_project(     
    ID_score_transaction_project SERIAL NOT NULL PRIMARY KEY,
    ID_score_transaction INT NOT NULL,
    ID_project INT NOT NULL,
    project_rating VARCHAR(1000)  
);       

--47
CREATE TABLE IF NOT EXISTS TB_score_transaction_question(     
    ID_score_transaction_question SERIAL NOT NULL PRIMARY KEY,
    ID_score_transaction INT NOT NULL,
    ID_question INT NOT NULL,
    question_rating VARCHAR(1000)   
);   

--48
CREATE TABLE IF NOT EXISTS TB_score_transaction_role(     
    ID_score_transaction_role SERIAL NOT NULL PRIMARY KEY,
    ID_member_role INT NOT NULL,
    ID_score_transaction INT NOT NULL  
);   

--49
CREATE TABLE IF NOT EXISTS TB_score_transaction_tournament_team_phase(     
    ID_score_transaction_tournament_team_phase SERIAL NOT NULL PRIMARY KEY,
    ID_tournament_team_phase INT NOT NULL,
    ID_score_transaction INT NOT NULL  
);   

--100
CREATE TABLE IF NOT EXISTS TB_score_transaction_type(     
    ID_score_transaction_type SERIAL NOT NULL PRIMARY KEY,     
    score_transaction_type VARCHAR (500) NOT NULL 
);  

--51
CREATE TABLE IF NOT EXISTS TB_state(
    ID_state SERIAL NOT NULL PRIMARY KEY,
    
    ID_country INT NOT NULL,
    state_name VARCHAR(500) NOT NULL 
);

--52
CREATE TABLE IF NOT EXISTS TB_status(
    ID_status SERIAL NOT NULL PRIMARY KEY,
    status_description VARCHAR(500) NOT NULL 
);

--53
CREATE TABLE IF NOT EXISTS TB_subject(
    ID_subject SERIAL NOT NULL PRIMARY KEY,
    subject VARCHAR(500) 
);

--54
CREATE TABLE IF NOT EXISTS TB_team(
    ID_team SERIAL NOT NULL PRIMARY KEY,
    ID_captain INT NOT NULL,
    DT_creation DATE NOT NULL,
    team_name VARCHAR(500) NOT NULL 
);

--55
CREATE TABLE IF NOT EXISTS TB_tournament(
    ID_tournament SERIAL NOT NULL PRIMARY KEY,
    ID_organizer INT NOT NULL,     
    tournament_name VARCHAR(500) NOT NULL,     
    DT_start DATE,     
    DT_end DATE 
);

--56
CREATE TABLE IF NOT EXISTS TB_tournament_team(
    ID_tournament_team SERIAL NOT NULL PRIMARY KEY,
    ID_team INT NOT NULL,
    ID_tournament INT NOT NULL,
    team_placing INT NOT NULL UNIQUE 
);

--57
CREATE TABLE IF NOT EXISTS TB_tournament_team_phase(
    ID_tournament_team_phase SERIAL NOT NULL PRIMARY KEY,
    ID_tournament_team INT NOT NULL,
    ID_phase INT NOT NULL , 
    placing_phase INT NOT NULL UNIQUE,
    max_jpq_score INT 
);

--58
CREATE TABLE IF NOT EXISTS TB_tournament_team_phase_question(
    ID_tournament_team_phase_question SERIAL NOT NULL PRIMARY KEY,
    ID_tournament_team_phase INT NOT NULL,
    ID_question INT NOT NULL,
    ID_status INT NOT NULL,
    attempts_number INT NOT NULL 
);   
 
-- GENDER CONSTRAINT
ALTER TABLE TB_member ADD CONSTRAINT CK_gender_member CHECK(gender in('F','M'));

-- TB_encounter_subject
ALTER TABLE TB_encounter_subject ADD CONSTRAINT FK_encounter_subject_subject FOREIGN KEY (ID_subject) REFERENCES TB_subject(ID_subject);
ALTER TABLE TB_encounter_subject ADD CONSTRAINT FK_encounter_subject_encounter FOREIGN KEY (ID_encounter) REFERENCES TB_encounter(ID_encounter);

-- TB_project_subject
ALTER TABLE TB_project_subject ADD CONSTRAINT FK_project_subject_subject FOREIGN KEY (ID_subject) REFERENCES TB_subject(ID_subject);
ALTER TABLE TB_project_subject ADD CONSTRAINT FK_project_subject_project FOREIGN KEY (ID_project) REFERENCES TB_project(ID_project);

-- TB_question_subject
ALTER TABLE TB_question_subject ADD CONSTRAINT FK_question_subject_subject FOREIGN KEY (ID_subject) REFERENCES TB_subject (ID_subject);
ALTER TABLE TB_question_subject ADD CONSTRAINT FK_question_subject_question FOREIGN KEY (ID_question) REFERENCES TB_question (ID_question);

-- TB_captain
ALTER TABLE TB_captain ADD CONSTRAINT FK_captain_member FOREIGN KEY (ID_member) REFERENCES TB_member(ID_member);

--TB_member_role
ALTER TABLE TB_member_role ADD CONSTRAINT FK_member_role_function FOREIGN KEY (ID_role) REFERENCES TB_function(ID_function);
ALTER TABLE TB_member_role ADD CONSTRAINT FK_member_role_member FOREIGN KEY (ID_member) REFERENCES TB_member(ID_member);

--TB_certificate
ALTER TABLE TB_certificate ADD CONSTRAINT FK_certificate_member FOREIGN KEY (ID_member) REFERENCES TB_member(ID_member);

-- TB_city
ALTER TABLE TB_city ADD CONSTRAINT FK_city_state FOREIGN KEY (ID_state) REFERENCES TB_state(ID_state);

-- TB_organizing_comitteee
ALTER TABLE TB_organizing_comitteee ADD CONSTRAINT FK_organizing_comitteee_event FOREIGN KEY (ID_event) REFERENCES  TB_event(ID_event);
ALTER TABLE TB_organizing_comitteee ADD CONSTRAINT FK_organizing_comitteee_member FOREIGN KEY (ID_member) REFERENCES  TB_member(ID_member);

-- TB_club_account
ALTER TABLE TB_club_account ADD CONSTRAINT FK_club_account_member FOREIGN KEY (ID_member) REFERENCES TB_member(ID_member);

-- TB_institution_course
ALTER TABLE TB_institution_course ADD CONSTRAINT FK_institution_course_course FOREIGN KEY (ID_course) REFERENCES  TB_course(ID_course);
ALTER TABLE TB_institution_course ADD CONSTRAINT FK_institution_course_education_institution FOREIGN KEY (ID_institution) REFERENCES  TB_education_institution(ID_education_institution);

-- TB_encounter
ALTER TABLE TB_encounter ADD CONSTRAINT FK_encounter_organizer FOREIGN KEY (ID_organizer) REFERENCES TB_member(ID_member);
ALTER TABLE TB_encounter ADD CONSTRAINT FK_encounter_project FOREIGN KEY (ID_project) REFERENCES TB_project(ID_project);

-- TB_online_encounter 
ALTER TABLE TB_online_encounter ADD CONSTRAINT FK_online_encounter_plataform FOREIGN KEY (ID_platform) REFERENCES TB_platform(ID_platform);
ALTER TABLE TB_online_encounter ADD CONSTRAINT FK_online_encounter_encounter FOREIGN KEY (ID_encounter) REFERENCES TB_encounter(ID_encounter);

-- TB_presential_encounter
ALTER TABLE TB_presential_encounter ADD CONSTRAINT FK_presential_encounter_encounter FOREIGN KEY (ID_encounter) REFERENCES TB_encounter(ID_encounter);
ALTER TABLE TB_presential_encounter ADD CONSTRAINT FK_presential_encounter_place FOREIGN KEY (ID_place) REFERENCES  TB_place(ID_place);

-- TB_team
ALTER TABLE TB_team ADD CONSTRAINT FK_team_captain FOREIGN KEY (ID_captain) REFERENCES  TB_captain(ID_captain);

-- TB_tournament_team
ALTER TABLE TB_tournament_team ADD CONSTRAINT FK_tournament_team_team FOREIGN KEY (ID_team) REFERENCES  TB_team(ID_team);
ALTER TABLE TB_tournament_team ADD CONSTRAINT FK_tournament_team_tournament FOREIGN KEY (ID_tournament) REFERENCES  TB_tournament(ID_tournament);

-- TB_tournament_team_phase
ALTER TABLE TB_tournament_team_phase ADD CONSTRAINT FK_tournament_team_phase_tournament_team FOREIGN KEY (ID_tournament_team) REFERENCES  TB_tournament_team(ID_tournament_team);
ALTER TABLE TB_tournament_team_phase ADD CONSTRAINT FK_tournament_team_phase_phase FOREIGN KEY (ID_phase) REFERENCES  TB_phase(ID_phase);

-- TB_state
ALTER TABLE TB_state ADD CONSTRAINT FK_state_country FOREIGN KEY (ID_country) REFERENCES  TB_country(ID_country);

-- TB_event
ALTER TABLE TB_event ADD CONSTRAINT FK_event_place FOREIGN KEY (ID_place) REFERENCES TB_place(ID_place);

--TB_event_project
ALTER TABLE TB_event_project ADD CONSTRAINT FK_event_project_event FOREIGN KEY (ID_event) REFERENCES TB_event(ID_event);
ALTER TABLE TB_event_project ADD CONSTRAINT FK_event_project_project FOREIGN KEY (ID_project) REFERENCES TB_project(ID_project);

-- TB_phase
ALTER TABLE TB_phase ADD CONSTRAINT FK_phase_tournament FOREIGN KEY (ID_tournament) REFERENCES  TB_tournament (ID_tournament);

-- TB_online_phase
ALTER TABLE TB_online_phase ADD CONSTRAINT FK_online_phase_phase FOREIGN KEY (ID_phase) REFERENCES  TB_phase(ID_phase);
ALTER TABLE TB_online_phase ADD CONSTRAINT FK_online_phase_platform FOREIGN KEY (ID_platform) REFERENCES  TB_platform(ID_platform);

-- TB_presential_phase
ALTER TABLE TB_presential_phase ADD CONSTRAINT FK_presential_phase_phase FOREIGN KEY (ID_phase) REFERENCES  TB_phase(ID_phase);
ALTER TABLE TB_presential_phase ADD CONSTRAINT FK_presential_phase_place FOREIGN KEY (ID_place) REFERENCES  TB_place(ID_place);

-- TB_tournament_team_phase_question
ALTER TABLE TB_tournament_team_phase_question ADD CONSTRAINT FK_tournament_team_phase_question_tournament_team_phase FOREIGN KEY (ID_tournament_team_phase) REFERENCES  TB_tournament_team_phase (ID_tournament_team_phase);
ALTER TABLE TB_tournament_team_phase_question ADD CONSTRAINT FK_tournament_team_phase_question_question FOREIGN KEY (ID_question) REFERENCES  TB_question(ID_question);
ALTER TABLE TB_tournament_team_phase_question ADD CONSTRAINT FK_tournament_team_phase_question_status FOREIGN KEY (ID_status) REFERENCES  TB_status(ID_status);

-- TB_image
ALTER TABLE TB_image ADD CONSTRAINT FK_image_image_category FOREIGN KEY (ID_image_category) REFERENCES TB_image_category(ID_image_category);

-- TB_encounter_image
ALTER TABLE TB_encounter_image ADD CONSTRAINT FK_encounter_image_encounter FOREIGN KEY (ID_encounter) REFERENCES  TB_encounter (ID_encounter);
ALTER TABLE TB_encounter_image ADD CONSTRAINT FK_encounter_image_image FOREIGN KEY (ID_image) REFERENCES  TB_image(ID_image);

-- TB_project_image
ALTER TABLE TB_project_image ADD CONSTRAINT FK_project_image_image FOREIGN KEY (ID_image) REFERENCES  TB_image(ID_image);
ALTER TABLE TB_project_image ADD CONSTRAINT FK_project_image_project FOREIGN KEY (ID_project) REFERENCES  TB_project (ID_project);

-- TB_event_image
ALTER TABLE TB_event_image ADD CONSTRAINT FK_event_image_event FOREIGN KEY (ID_event) REFERENCES  TB_event(ID_event);
ALTER TABLE TB_event_image ADD CONSTRAINT FK_event_image_image FOREIGN KEY (ID_image) REFERENCES  TB_image(ID_image);

-- TB_education_institution
ALTER TABLE TB_education_institution ADD CONSTRAINT FK_education_institution_place FOREIGN KEY (ID_place) REFERENCES  TB_place (ID_place);

-- TB_leader
ALTER TABLE TB_leader ADD CONSTRAINT FK_leader_member FOREIGN KEY (ID_member) REFERENCES  TB_member(ID_member);

-- TB_place
ALTER TABLE TB_place ADD CONSTRAINT FK_place_public_place FOREIGN KEY (ID_public_place) REFERENCES  TB_public_place (ID_public_place);

-- TB_public_place
ALTER TABLE TB_public_place ADD CONSTRAINT FK_public_place_city FOREIGN KEY (ID_city) REFERENCES  TB_city(ID_city);

-- TB_member
ALTER TABLE TB_member ADD CONSTRAINT FK_member_institution_course FOREIGN KEY (ID_institution_course) REFERENCES  TB_institution_course(ID_institution_course);
ALTER TABLE TB_member ADD CONSTRAINT FK_member_image FOREIGN KEY (ID_member_photo) REFERENCES  TB_image(ID_image);
ALTER TABLE TB_member ADD CONSTRAINT FK_member_occupation FOREIGN KEY (ID_occupation) REFERENCES  TB_occupation(ID_occupation);

-- TB_member_team
ALTER TABLE TB_member_team ADD CONSTRAINT FK_member_team_team FOREIGN KEY(ID_team) REFERENCES  TB_team(ID_team);
ALTER TABLE TB_member_team ADD CONSTRAINT FK_member_team_member FOREIGN KEY (ID_member) REFERENCES  TB_member(ID_member);

-- TB_member_project 
ALTER TABLE TB_member_project ADD CONSTRAINT FK_member_project_member FOREIGN KEY (ID_member) REFERENCES  TB_member(ID_member);
ALTER TABLE TB_member_project ADD CONSTRAINT FK_member_project_project FOREIGN KEY (ID_project) REFERENCES  TB_project(ID_project);
ALTER TABLE TB_member_project ADD CONSTRAINT FK_member_project_function FOREIGN KEY (ID_function) REFERENCES  TB_function(ID_function);

--TB_score_transaction
ALTER TABLE TB_score_transaction ADD CONSTRAINT FK_score_transaction_club_account FOREIGN KEY (ID_club_account) REFERENCES  TB_club_account(ID_club_account);
ALTER TABLE TB_score_transaction ADD CONSTRAINT FK_score_transaction_score_transaction_type FOREIGN KEY (ID_score_transaction_type) REFERENCES  TB_score_transaction_type(ID_score_transaction_type);

--TB_score_transaction_role
ALTER TABLE TB_score_transaction_role ADD CONSTRAINT FK_score_transaction_role_member_role FOREIGN KEY (ID_member_role) REFERENCES  TB_member_role(ID_member_role);
ALTER TABLE TB_score_transaction_role ADD CONSTRAINT FK_score_transaction_role_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES  TB_score_transaction(ID_score_transaction);

--TB_score_transaction_event_attendance
ALTER TABLE TB_score_transaction_event_attendance ADD CONSTRAINT FK_score_transaction_event_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES  TB_score_transaction(ID_score_transaction);
ALTER TABLE TB_score_transaction_event_attendance ADD CONSTRAINT FK_score_transaction_event_attendance FOREIGN KEY (ID_event_attendance) REFERENCES  TB_event_attendance(ID_event_attendance);

-- TB_score_transaction_project
ALTER TABLE TB_score_transaction_project ADD CONSTRAINT FK_score_transaction_project_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES TB_score_transaction(ID_score_transaction);
ALTER TABLE TB_score_transaction_project ADD CONSTRAINT FK_score_transaction_project_project FOREIGN KEY (ID_project) REFERENCES TB_project(ID_project);

-- TB_score_transaction_question
ALTER TABLE TB_score_transaction_question ADD CONSTRAINT FK_score_transaction_question_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES TB_score_transaction(ID_score_transaction);
ALTER TABLE TB_score_transaction_question ADD CONSTRAINT FK_score_transaction_question_question FOREIGN KEY (ID_question) REFERENCES TB_question(ID_question);

-- TB_score_transaction_tournament_team_phase
ALTER TABLE TB_score_transaction_tournament_team_phase ADD CONSTRAINT FK_score_transaction_tournament_team_phase_tournament_team_phase FOREIGN KEY (ID_tournament_team_phase) REFERENCES TB_tournament_team_phase(ID_tournament_team_phase);
ALTER TABLE TB_score_transaction_tournament_team_phase ADD CONSTRAINT FK_score_transaction_tournament_team_phase_score_transaction FOREIGN KEY (ID_score_transaction) REFERENCES TB_score_transaction(ID_score_transaction);

-- TB_event_attendance
ALTER TABLE TB_event_attendance ADD CONSTRAINT FK_event_attendance_event FOREIGN KEY (ID_event) REFERENCES TB_event(ID_event);
ALTER TABLE TB_event_attendance ADD CONSTRAINT FK_event_attendance_member FOREIGN KEY (ID_member) REFERENCES TB_member(ID_member);

-- TB_encounter_attendance
ALTER TABLE TB_encounter_attendance ADD CONSTRAINT FK_encounter_attendance_encounter FOREIGN KEY (ID_encounter) REFERENCES  TB_encounter(ID_encounter);
ALTER TABLE TB_encounter_attendance ADD CONSTRAINT FK_encounter_attendance_member FOREIGN KEY (ID_member) REFERENCES  TB_member(ID_member);

-- TB_project
ALTER TABLE TB_project ADD CONSTRAINT FK_project_leader FOREIGN KEY (ID_leader) REFERENCES TB_leader(ID_leader);
ALTER TABLE TB_project ADD CONSTRAINT FK_project_project_type FOREIGN KEY (ID_project_type) REFERENCES TB_project_type(ID_project_type);
ALTER TABLE TB_project ADD CONSTRAINT FK_project_face_image FOREIGN KEY (ID_face_image) REFERENCES TB_image(ID_image);

-- TB_question
ALTER TABLE TB_question ADD CONSTRAINT FK_question_difficulty_degree FOREIGN KEY (ID_difficulty_degree) REFERENCES TB_difficulty_degree(ID_difficulty_degree);
ALTER TABLE TB_question ADD CONSTRAINT FK_question_question_origin FOREIGN KEY (ID_question_origin) REFERENCES TB_question_origin(ID_question_origin);

-- TB_tournament
ALTER TABLE TB_tournament ADD CONSTRAINT FK_tournament_organizer FOREIGN KEY (ID_organizer) REFERENCES  TB_organizer(ID_organizer);