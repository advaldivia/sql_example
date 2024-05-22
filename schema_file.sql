/* Create schema, database and table creation for each database*/

drop schema if exists school_rankings;
create schema school_rankings;
use school_rankings;

drop table if exists cwur_ranking;
create table cwur_ranking (
            world_rank integer not null,
            institution varchar(200) not null,
            country varchar(20) not null,
            national_rank integer,
			education_quality integer,
            alumni_employment integer,
            faculty_quality integer,
            publications integer,
            influence integer,
            citation integer,
            broad_impact decimal null,
			patents integer,
            score decimal(10,5),
            year_of_ranking integer,
            primary key (institution, year_of_ranking)
);

drop table if exists shanghai_ranking;
create table shanghai_ranking(
			world_rank varchar(10) ,
            institution varchar(100) not null,
            national_rank varchar(10) ,
            score decimal(10,5),
            alumni decimal(10,5),
            award decimal(10,5),
            hici decimal(10,5),
            ns decimal(10,5),
            pub decimal(10,5),
            pcp decimal(10,5),
            year_of_ranking decimal not null,
            primary key (institution, year_of_ranking)
);

drop table if exists times_ranking;
create table times_ranking(
			world_rank varchar(10),
            institution varchar(100) not null,
            country varchar(30),
            teaching decimal(10,5) null,
            international decimal(10,5) null,
            research decimal(10,5) null,
            citation decimal(10,5) null,
            income decimal(10,5) null,
            score decimal(10,5) null,
            num_students integer null, 
            student_staff_ratio integer null,
            international_students decimal(5,2) null,
            female_male_ratio decimal(10,5) null,
            year_of_ranking integer not null,
            primary key (institution,year_of_ranking)
            );

drop table if exists ed_spend;
create table ed_spend(
				country varchar(200) not null,
                institute_type varchar(200) not null,
                expenditure_type varchar(200) not null,
                year1995 decimal(2,1),
                year2000 decimal(2,1),
                year2005 decimal(2,1),
                year2009 decimal(2,1),
                year2010 decimal(2,1),
                year2011 decimal(4,2),
                primary key(country, institute_type, expenditure_type)
                );

drop table if exists ed_attain;
create table ed_attain(
                    country varchar(100) not null,
                    series varchar(500) not null,
                    y85 decimal(20,10) null,
                    y90 decimal(20,10) null,
                    y95 decimal(20,10) null,
                    y00 decimal(20,10) null,
                    y05 decimal(20,10) null,
                    y10 decimal(20,10) null,
                    primary key (country,series)
                    );


drop table if exists institution_list;
create table institution_list(
					institution varchar(100) not null,
                    country varchar(100),
                    primary key (institution)
                    );


show tables;






