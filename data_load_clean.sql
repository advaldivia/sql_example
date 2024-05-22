use school_rankings;

/* load data into tables*/

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cwurData.csv"
into table cwur_ranking
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(world_rank,institution,country,national_rank,education_quality,alumni_employment,faculty_quality,publications,influence,citation,@vbroad_impact,patents,score,year_of_ranking)
set broad_impact = nullif(@vbroad_impact, '');


/* this file has been adjusted manually for repeat entries.  Seems clear that some school names should be changed*/
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/shanghaiData_rev.txt"
into table shanghai_ranking
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(world_rank,institution,national_rank,@vscore,@valumni,@vaward,@vhici,@vns,@vpub,@vpcp,year_of_ranking)
set score = nullif(@vscore,''),
	alumni = nullif(@valumni,''),
    award = nullif(@vaward,''),
    hici = nullif(@vhici,''),
    ns = nullif(@vns,''),
	pub = nullif(@vpub,''),
    pcp = nullif(@vpcp,'');

/*temp table to manipulate data first*/

drop table if exists times_ranking_temp;
create table times_ranking_temp(
			world_rank varchar(10),
            institution varchar(100) not null,
            country varchar(30),
            teaching decimal(10,5),
            international decimal(10,5),
            research decimal(10,5),
            citation decimal(10,5),
            income decimal(10,5),
            score decimal(10,5),
            num_students varchar(20), 
            student_staff_ratio decimal(10,5),
            international_students varchar(20),
            female_male_ratio varchar(10),
            year_of_ranking int not null,
            primary key (institution,year_of_ranking)
            );
            
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/timesData.csv"
into table times_ranking_temp
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(world_rank, institution, country, teaching, @vinternational, research, citation, @vincome, @vscore, @vnum_students, @vstudent_staff_ratio,@vinternational_students,@vfemale_male_ratio,year_of_ranking)
set income = nullif(@vincome,'-'),
	international = nullif(@vinternational, '-'),
    score = nullif(@vscore, '-'),
    international_students = nullif(@vinternational_students,''),
    student_staff_ratio = nullif(@vstudent_staff_ratio,''),
    female_male_ratio = nullif(nullif(@vfemale_male_ratio,''),'-'),
    num_students = nullif(@vnum_students,'')
    ;

insert into times_ranking
(world_rank,institution,country,teaching,international,research,citation,income,score,num_students,student_staff_ratio,international_students,female_male_ratio,year_of_ranking)
select 	world_rank, 
		institution, 
        country, 
        teaching, 
        international, 
        research, 
        citation, 
        income, 
        score, 
		cast(replace(num_students,',','') as decimal) as number_students,
        student_staff_ratio, 
		cast(replace(international_students,'%','') as decimal(5,2)) as international_students,
        cast(substring_index(female_male_ratio,':',1) as decimal(20,10))/nullif(cast(substring_index(female_male_ratio,' : ',-1)as decimal(10,5)),0) as fm_ratio,
		year_of_ranking
from times_ranking_temp
;
drop table times_ranking_temp;

/* this file has been touched up manually, removed columns with no data*/                
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/eduexp.csv"
into table ed_spend
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(country,institute_type, expenditure_type, @year1995, @year2000 , @year2005, @year2009, @year2010, @year2011) 
set year1995 = nullif(@year1995,''),
	year2000 = nullif(@year2000,''),
    year2005 = nullif(@year2005,''),
    year2009 = nullif(@year2009,''),
    year2010 = nullif(@year2010,''),
    year2011 = nullif(@year2011,0)
;


/* removed end matter*/
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/educational_attainment_supplementary_data_rev.csv"
into table ed_attain
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(country, series, @y85,@y90,@y95,@y00,@y05,@y10)
set y85 = nullif(@y85,''),
	y90 = nullif(@y90,''),
    y95 = nullif(@y95,''),
    y00 = nullif(@y00,''),
    y05 = nullif(@y05,''),
    y10 = nullif(@y10,0);


load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/school_and_country_table.csv"
into table institution_list
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(institution, country)
;

/* very sparse data for some series in ed_attain*/

