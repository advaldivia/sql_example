/* Create full data set*/

create view cwur_shanghai
	(institution,
	 year_of_ranking,
     world_rank_cwur,
	 national_rank_cwur,
	 education_quality_cwur,
	 alumni_employment_cwur,
	 faculty_quality_cwur,
	 publications_cwur,
	 influence_cwur,
	 citation_cwur,
	 broad_impact_cwur,
	 patents_cwur,
	 score_cwur,
     world_rank_shanghai,
	 national_rank_shanghai,
	 score_shanghai,
	 alumni_shanghai,
	 award_shanghai,
	 hici_shanghai,
	 ns_shanghai,
	 pub_shanghai,
	 pcp_shanghai
     )
     as 
    
		select C.institution,
            C.year_of_ranking,
			C.world_rank as cworld_rank,
            C.national_rank as cnational_rank,
			C.education_quality as ceducation_quality,
            C.alumni_employment as calumni_employment,
            C.faculty_quality as cfaculty_quality,
            C.publications as cpublications,
            C.influence as cinfluence,
            C.citation as ccitation,
            C.broad_impact as cbroad_impact,
			C.patents as cpatents,
            C.score as cscore,
            S.world_rank as sworld_rank,
            S.national_rank as snational_rank,
            S.score as sscore,
            S.alumni as salumni,
            S.award as saward,
            S.hici as shici,
            S.ns as sns,
            S.pub as spub,
            S.pcp as spcp
		from cwur_ranking as C 
			left join shanghai_ranking as S 
            on C.institution = S.institution and C.year_of_ranking = S.year_of_ranking
	
    
		union 
    
    select S1.institution,
            S1.year_of_ranking,
			C1.world_rank as cworld_rank,
            C1.national_rank as cnational_rank,
			C1.education_quality as ceducation_quality,
            C1.alumni_employment as calumni_employment,
            C1.faculty_quality as cfaculty_quality,
            C1.publications as cpublications,
            C1.influence as cinfluence,
            C1.citation as ccitation,
            C1.broad_impact as cbroad_impact,
			C1.patents as cpatents,
            C1.score as cscore,
            S1.world_rank as sworld_rank,
            S1.national_rank as snational_rank,
            S1.score as sscore,
            S1.alumni as salumni,
            S1.award as saward,
            S1.hici as shici,
            S1.ns as sns,
            S1.pub as spub,
            S1.pcp as spcp
		from cwur_ranking as C1 
			right join shanghai_ranking as S1 
            on C1.institution = S1.institution and C1.year_of_ranking = S1.year_of_ranking
	;
		

/* full view*/

create view full_ranking_data
	(institution,
	 year_of_ranking,
     world_rank_cwur,
	 national_rank_cwur,
	 education_quality_cwur,
	 alumni_employment_cwur,
	 faculty_quality_cwur,
	 publications_cwur,
	 influence_cwur,
	 citation_cwur,
	 broad_impact_cwur,
	 patents_cwur,
	 score_cwur,
     world_rank_shanghai,
	 national_rank_shanghai,
	 score_shanghai,
	 alumni_shanghai,
	 award_shanghai,
	 hici_shanghai,
	 ns_shanghai,
	 pub_shanghai,
	 pcp_shanghai,
     world_rank_times,
	 teaching_times,
	 international_times,
	 research_times,
	 citation_times,
	 income_times,
	 score_times,
	 num_students_times, 
	 student_staff_ratio_times,
	 international_students_times,
	 female_male_ratio_times
     )
     as 
    
		select C.institution,
	 C.year_of_ranking,
     C.world_rank_cwur,
	 C.national_rank_cwur,
	 C.education_quality_cwur,
	 C.alumni_employment_cwur,
	 C.faculty_quality_cwur,
	 C.publications_cwur,
	 C.influence_cwur,
	 C.citation_cwur,
	 C.broad_impact_cwur,
	 C.patents_cwur,
	 C.score_cwur,
     C.world_rank_shanghai,
	 C.national_rank_shanghai,
	 C.score_shanghai,
	 C.alumni_shanghai,
	 C.award_shanghai,
	 C.hici_shanghai,
	 C.ns_shanghai,
	 C.pub_shanghai,
	 C.pcp_shanghai,
     T.world_rank as world_rank_times,
	 T.teaching as teaching_times,
	 T.international as international_times,
	 T.research as research_times,
	 T.citation as citation_times,
	 T.income as income_times,
	 T.score as score_times,
	 T.num_students as num_students_times, 
	 T.student_staff_ratio as student_staff_ratio_times,
	 T.international_students as international_students_times,
	 T.female_male_ratio as female_male_ratio_times
	
    from cwur_shanghai as C 
			left join times_ranking as T
            on C.institution = T.institution and C.year_of_ranking = T.year_of_ranking
	
	union 
    
    select T1.institution,
	 T1.year_of_ranking,
     C1.world_rank_cwur,
	 C1.national_rank_cwur,
	 C1.education_quality_cwur,
	 C1.alumni_employment_cwur,
	 C1.faculty_quality_cwur,
	 C1.publications_cwur,
	 C1.influence_cwur,
	 C1.citation_cwur,
	 C1.broad_impact_cwur,
	 C1.patents_cwur,
	 C1.score_cwur,
     C1.world_rank_shanghai,
	 C1.national_rank_shanghai,
	 C1.score_shanghai,
	 C1.alumni_shanghai,
	 C1.award_shanghai,
	 C1.hici_shanghai,
	 C1.ns_shanghai,
	 C1.pub_shanghai,
	 C1.pcp_shanghai,
     T1.world_rank as world_rank_times,
	 T1.teaching as teaching_times,
	 T1.international as international_times,
	 T1.research as research_times,
	 T1.citation as citation_times,
	 T1.income as income_times,
	 T1.score as score_times,
	 T1.num_students as num_students_times, 
	 T1.student_staff_ratio as student_staff_ratio_times,
	 T1.international_students as international_students_times,
	 T1.female_male_ratio as female_male_ratio_times
		from cwur_shanghai as C1 
			right join times_ranking as T1
            on C1.institution = T1.institution and C1.year_of_ranking = T1.year_of_ranking
	
;


 select *  from full_ranking_data;  
 
 select F.institution,
	 F.year_of_ranking,
     F.world_rank_cwur,
	 F.national_rank_cwur,
	 F.education_quality_cwur,
	 F.alumni_employment_cwur,
	 F.faculty_quality_cwur,
	 F.publications_cwur,
	 F.influence_cwur,
	 F.citation_cwur,
	 F.broad_impact_cwur,
	 F.patents_cwur,
	 F.score_cwur,
     F.world_rank_shanghai,
	 F.national_rank_shanghai,
	 F.score_shanghai,
	 F.alumni_shanghai,
	 F.award_shanghai,
	 F.hici_shanghai,
	 F.ns_shanghai,
	 F.pub_shanghai,
	 F.pcp_shanghai,
     F.world_rank_times,
	 F.teaching_times,
	 F.international_times,
	 F.research_times,
	 F.citation_times,
	 F.income_times,
	 F.score_times,
	 F.num_students_times, 
	 F.student_staff_ratio_times,
	 F.international_students_times,
	 F.female_male_ratio_times,
	 C.country
from full_ranking_data as F left join institution_list as C on F.institution = C.institution;
 
     
    