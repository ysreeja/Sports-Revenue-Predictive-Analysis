use project;

create table team (
team_id varchar(30)  NOT NULL PRIMARY KEY,
name varchar(30) ,
manager varchar(30),
sponsor varchar(30)
);

create table tournament (
Year int NOT NULL PRIMARY KEY,
Budget	int,
Winner_Amount int,	
Inaugral_City varchar (50),
Winner varchar(50)
);

create table players(
player_id varchar(30) NOT NULL PRIMARY KEY,
name varchar(30) NOT NULL,
age int,
years_of_experience int,
buy_price int
);

create table tt(
t_Year int NOT NULL,
t_Team_ID varchar(30) NOT NULL,
Standings int NOT NULL
);

create table Online_Viewers(
Ref_num varchar(30) NOT NULL PRIMARY KEY,
watch_time int NOT NULL,
region_code Varchar(30) NOT NULL,
age int NOT NULL
);

create table tickets(
ticket_num varchar(30) NOT NULL PRIMARY KEY,
price int NOT NULL,
seat_num varchar(30) NOT NULL,
year int NOT NULL);

create table Stadium_viewers(
ref_num varchar(30) NOT NULL PRIMARY KEY,
merch_id varchar(30)
);


create table tp(
player_id varchar(30)NOT NULL PRIMARY KEY,
team_id varchar(30) NOT NULL 
);

create table merchandise_company(
company_id varchar(30) NOT NULL PRIMARY KEY,
company_name varchar(30) NOT NULL,
email varchar(35) NOT NULL,
address varchar (45)
);

create table ott_company(
company_name varchar(30) NOT NULL,
company_id Varchar(30) NOT NULL,
subscription_id Varchar(30) NOT NULL PRIMARY KEY,
sub_amount int NOT NULL
);

create table kabaddi_board(
board_ref_num varchar(30) NOT NULL PRIMARY KEY,
board_director varchar(30) NOT NULL,
num_of_members int NOT NULL,
year int NOT NULL
);

create table team_owner(
owner_name varchar(30) NOT NULL PRIMARY KEY,
team_id varchar(30) NOT NULL,
nationality varchar(30) NOT NULL,
purse_Amount int NOT NULL,
merchandise_Company_id varchar(30) NOT NULL 
);

create table tickets_ref(
ticket_num varchar(30) NOT NULL PRIMARY KEY,
ref_num varchar(30) NOT NULL
);
