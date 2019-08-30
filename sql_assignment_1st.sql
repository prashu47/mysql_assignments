assignment-1

select schools.id,count(first_name) as students_count from students left join schools on schools.id=students.school_id where schools.is_deleted=0 group by schools.id;

output-

+-----+----------------+
| id  | students_count |
+-----+----------------+
|   1 |             17 |
|   2 |            286 |
|   3 |            378 |
|   4 |            378 |
|   5 |            196 |
|   6 |            235 |
|   8 |             17 |
|   9 |              4 |
|  10 |            189 |
|  11 |              4 |
|  12 |             47 |
|  19 |             30 |
|  22 |             37 |
|  24 |             27 |
|  25 |             52 |
|  26 |              4 |
|  27 |             10 |
|  32 |            134 |
|  34 |             81 |
|  40 |             19 |
|  49 |             12 |
|  50 |             24 |
|  52 |              1 |
|  53 |              2 |
|  55 |              1 |
|  59 |              2 |
|  62 |             47 |
|  65 |              7 |
|  66 |              1 |
|  68 |              1 |
|  69 |              3 |
|  71 |              5 |
|  74 |              1 |
|  75 |            127 |
|  79 |              3 |
|  80 |              1 |
|  81 |              2 |
|  82 |              2 |
|  83 |           2594 |
|  84 |              1 |
|  85 |              1 |
|  86 |              1 |
|  88 |             19 |
|  89 |              7 |
|  94 |              1 |
|  97 |              1 |
| 105 |            114 |
| 108 |             24 |
| 109 |              4 |
| 117 |              2 |
| 120 |              1 |
| 121 |             29 |
| 126 |              1 |
| 127 |             37 |
| 128 |             14 |
| 130 |              3 |
| 132 |              6 |
| 133 |              1 |
| 137 |              2 |
| 138 |             22 |
| 139 |              2 |
| 141 |             10 |
| 158 |              1 |
| 161 |             12 |
| 165 |              8 |
| 167 |             38 |
| 170 |            124 |
| 172 |              1 |
| 173 |           1420 |
| 174 |            123 |
| 175 |            123 |
| 181 |              5 |
| 185 |              2 |
| 190 |              1 |
| 191 |            281 |
| 192 |            142 |
| 193 |             40 |
| 195 |             12 |
| 196 |             15 |
| 201 |             21 |
| 202 |              4 |
| 203 |              2 |
| 204 |              5 |
| 206 |              6 |
+-----+----------------+
84 rows in set (0.00 sec)

assignment-2

select students.first_name,group_concat(ffc.name) as pending_fees from finance_fees ff left join finance_fee_collections ffc on ff.fee_collection_id=ffc.id  left join students on students.id=ff.student_id where is_paid=0 and ff.school_id=50 group by student_id;

output-

+------------+-----------------------------------------------------------------------------------------------------------+
| first_name | pending_fees                                                                                              |
+------------+-----------------------------------------------------------------------------------------------------------+
| Jake       | FinanceReminders F1 FC1,July Malai,test iter 2,Air,May 25 Fee,Fee Collection Z,Jun2 FC,FeeReminder F2 FC1 |
| Tracey     | May 25 Fee,Air,Fee Collection Z,FeeReminder F2 FC1,Ae Jun2,test iter 2                                    |
| NULL       | FinanceReminders F1 FC1,FinanceReminders F1 FC2                                                           |
| Walden     | July Malai,test iter 2,Fee Collection Z,Jun2 FC,Air,FinanceReminders F1 FC1,May 25 Fee,FeeReminder F2 FC1 |
| Nancy      | Air,test iter 2,Ae Jun2,May 25 Fee,Fee Collection Z,FinanceReminders F1 FC1,FeeReminder F2 FC1            |
| Tamina     | Jun2 FC,May 25 Fee,Air,Fee Collection Z                                                                   |
| Faber      | July Malai,Fee Collection Z,Air,FinanceReminders F1 FC1,May 25 Fee,FinanceReminders F1 FC2                |
| Dean       | FeeReminder F2 FC1,Air,Fee Collection Z,May 25 Fee,FinanceReminders F1 FC1,test iter 2,Ae Jun2            |
| Sam        | Ae Jun2,May 25 Fee,FinanceReminders F1 FC1,Air,FeeReminder F2 FC1,Fee Collection Z,test iter 2            |
| NULL       | FinanceReminders F1 FC1,Fee Collection Z,May 25 Fee,Ae Jun2,FinanceReminders F1 FC2,Air                   |
| Jithin     | May 25 Fee,test iter 2,Ae Jun2,Fee Collection Z,Air,FinanceReminders F1 FC1                               |
| Rohth      | May 25 Fee,Ae Jun2,Air,test iter 2,FinanceReminders F1 FC1,FeeReminder F2 FC1,Fee Collection Z            |
| Sobin      | test iter 2,Air,Fee Collection Z,Ae Jun2,May 25 Fee,FeeReminder F2 FC1,FinanceReminders F1 FC1            |
| Swagnik    | FinanceReminders F1 FC1,Ae Jun2,test iter 2,Air,FeeReminder F2 FC1,Fee Collection Z,May 25 Fee            |
| Anjana     | FinanceReminders F1 FC1,May 25 Fee,Fee Collection Z,Ae Jun2,Air,FinanceReminders F1 FC2                   |
| Ismu       | Ae Jun2,FinanceReminders F1 FC2,FinanceReminders F1 FC1,Air,Fee Collection Z,May 25 Fee                   |
| Shyam      | Jun2 FC,FinanceReminders F1 FC1,May 25 Fee,FinanceReminders F1 FC2,Fee Collection Z,Air                   |
| Priyanka   | FinanceReminders F1 FC2,Air,Fee Collection Z,Ae Jun2,FinanceReminders F1 FC1,May 25 Fee                   |
| Shridhar   | July Malai,FinanceReminders F1 FC2,FinanceReminders F1 FC1,May 25 Fee,Fee Collection Z,Air                |
| Oliver     | Jun2 FC,Air,Fee Collection Z,May 25 Fee,July Malai,FinanceReminders F1 FC1,FeeReminder F2 FC1,test iter 2 |
| Sandeep    | Fee Collection Z,May 25 Fee,FinanceReminders F1 FC2,Jun2 FC,FinanceReminders F1 FC1,Air                   |
| Parajith   | May 25 Fee,Ae Jun2,Air,FinanceReminders F1 FC2,Fee Collection Z,FinanceReminders F1 FC1                   |
| Shiv       | test iter 2,Ae Jun2,FinanceReminders F1 FC1,May 25 Fee,Air,FeeReminder F2 FC1,Fee Collection Z            |
| Russell    | May 25 Fee,FinanceReminders F1 FC1,Fee Collection Z,Air,FinanceReminders F1 FC2,July Malai                |
+------------+-----------------------------------------------------------------------------------------------------------+

assignment-3

select students.first_name,count(students.first_name) as total_number_of_absentees  from students,attendances at left join students st on at.student_id=st.id left join schools sc on at.school_id=sc.id where month_date between cast('2017-03-13' as date) and cast('2019-03-27' as date) and sc.id=3 group by first_name order by count(st.first_name) desc;

output-

+----------------------------------------------------+---------------------------+
| first_name                                         | total_number_of_absentees |
+----------------------------------------------------+---------------------------+
| Riya                                               |                         1 |
| Test                                               |                         1 |
| rinkiya                                            |                         1 |
| Manu                                               |                         1 |
| Ajith                                              |                         1 |
| Arun                                               |                         1 |
| Anil                                               |                         1 |
| Anoop                                              |                         1 |
| Sagar                                              |                         1 |
| rinkiya123                                         |                         1 |
| Steve                                              |                         1 |
| Shiv                                               |                         1 |
| Gary                                               |                         1 |
| Shyam                                              |                         1 |
| Vijith                                             |                         1 |
| John                                               |                         1 |
| Sandeep                                            |                         1 |
| David                                              |                         1 |
| Suresh                                             |                         1 |
| Hari                                               |                         1 |
| Parvathy                                           |                         1 |
| Kiran                                              |                         1 |
| Prayag                                             |                         1 |
| te                                                 |                         1 |


4826 rows in set (1.58 sec)

assignment-4

select students.first_name,sum(exam_scores.marks) as total_marks from exam_scores left join students on students.id=exam_scores.student_id left join exams on exams.id=exam_scores.exam_id left join exam_groups on exams.exam_group_id=exam_groups.id where exam_groups.id=99 group by students.first_name order by sum(exam_scores.marks) desc;

output-

+------------+-------------+
| first_name | total_marks |
+------------+-------------+
| Surajit    |      374.00 |
| Gary       |      320.00 |
| Sandeep    |      314.00 |
| Aprajita   |      267.00 |
| Neelima    |      228.00 |
| Ajith      |      195.00 |
+------------+-------------+
6 rows in set (0.00 sec)

assignment-5

select courses.course_name,group_concat(distinct subjects.name) as SUBJECT_NAME from batches left join schools on batches.school_id=schools.id left join courses on batches.course_id=courses.id left join subjects on subjects.batch_id=batches.id where schools.id=108 group by batches.id;


output-

+------------------+------------------+
| course_name      | SUBJECT_NAME     |
+------------------+------------------+
| X                | NULL             |
| Biotechnology    | NULL             |
| Homeopathy       | as,Chemistry     |
| Biotechnology    | NULL             |
| Speech Pathology | Social,Chemistry |
+------------------+------------------+
5 rows in set (0.00 sec)
















