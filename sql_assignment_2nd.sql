
assignment-1. show all subject names to be studied by students of all active batches, show student full name and batch full name
	[tables: students, subjects, elective_groups, students_subjects, batches, courses]



select distinct concat(students.first_name,' ',students.last_name) as student_full_name,.batches.name as batch_full_name,subjects.name as subject_name from students left join batches on students.batch_id = batches.id left join subjects on students.batch_id=subjects.batch_id left join elective_groups on students.batch_id = elective_groups.batch_id left join students_subjects on students.batch_id=students_subjects.batch_id left join courses on students.school_id= courses.school_id where batches.is_active=1 and students.school_id=83 group by batches.name;

output-

+-------------------+-----------------+--------------+
| student_full_name | batch_full_name | subject_name |
+-------------------+-----------------+--------------+
| Vincent Whitney   | 2016A           | Social       |
| Briar Farley      | 2016B           | Urdu         |
| Kasimir Estrada   | 2017A           | Social       |
| Astra Burnett     | 2017B           | Social       |
| Ulla Duncan       | 2018A           | subject      |
| Brynne Gaines     | 2018B           | NULL         |
| Shaine Rivers     | 2018C           | NULL         |
| Zena Mcpherson    | 2018D           | NULL         |
| Cairo Lucas       | 2018E           | NULL         |
| Quinn Madden      | 2018F           | NULL         |
| Ashik Kumr        | 2018G           | NULL         |
| Kyle Robbins      | 2018H           | NULL         |
| Xanthus Hayes     | 2019A           | Social       |
| Nasim Bruce       | 2019B           | Social       |
| Walter Horne      | 2019C           | Social       |
| Octavius Chang    | 2019D           | NULL         |
| Christian Flores  | 2019F           | Social       |
| Beverly Mathews   | 2019G           | NULL         |
| jump student      | jump2           | NULL         |
| Hyatt Hendricks   | Tax-2018C       | NULL         |
| stud1             | testtransfee    | NULL         |
| Navin             | Transport       | NULL         |
+-------------------+-----------------+--------------+
22 rows in set (1.00 sec)


assignment-2.  show count of subject leaves for students 
	[tables: students, subject_leaves]

select students.first_name,count(subject_leaves.id) as count_of_subject_leave from subject_leaves left join students on subject_leaves.student_id=students.id where students.school_id=83 group by students.id;

output-

+------------+------------------------+
| first_name | count_of_subject_leave |
+------------+------------------------+
| Charlotte  |                      1 |
| Kasimir    |                      2 |
| Carly      |                      3 |
| Marshall   |                      1 |
| Steven     |                      1 |
| Brynne     |                      1 |
| Aubrey     |                      2 |
| Hope       |                      1 |
| Jamal      |                      1 |
| Suki       |                      1 |
+------------+------------------------+

10 rows in set (0.02 sec)



assignment-3. show name of day of absence for student, name of teacher who marked absent
    [tables: students, subject_leaves, employees, subject_leaves_teachers]




select distinct employees.first_name as teacher_name ,subject_leaves.month_date as Name_of_day_of_absence  from subject_leaves left join students on subject_leaves.student_id=students.id left join employees on employees.id=subject_leaves.employee_id left join subject_leaves_teachers on subject_leaves.id=subject_leave_id group by employees.first_name;

output-
+---------------------+------------------------+
| teacher_name        | Name_of_day_of_absence |
+---------------------+------------------------+
| NULL                | 2018-01-09             |
| Ahmed               | 2015-02-09             |
| Ajith               | 2015-02-16             |
| Anwar               | 2015-04-27             |
| Dileep              | 2014-12-18             |
| Dillepp             | 2015-02-10             |
| Employee1           | 2015-02-04             |
| Employee2           | 2015-02-03             |
| Employee3           | 2015-02-02             |
| Employee4           | 2015-02-02             |
| Jithin              | 2015-02-12             |
| Maths               | 2014-12-02             |
| Ricky               | 2015-02-24             |
| Salam               | 2014-12-18             |
| Sangeeth            | 2015-03-17             |
| Shylaja             | 2015-02-11             |
| Veena               | 2015-02-06             |
| Walter              | 2014-11-20             |
| アドミン 性別       | 2014-12-08             |
+---------------------+------------------------+
19 rows in set (0.05 sec)



assignment-4. write search query for all students whose name has string 'aman' and has some upaid fees (with or without fine)
	[tables: students, finance_fees, finance_fee_collections, fines, fine_rules]


select distinct (case when finance_fees.is_fine_paid=1 or finance_fees.is_fine_paid=0 then students.first_name end) as student_name from students left join finance_fees on students.school_id = finance_fees.school_id left join finance_fee_collections on students.school_id = finance_fee_collections.school_id left join fines on students.school_id=fines.school_id left join fine_rules on students.school_id=fine_rules.school_id where students.first_name like  '%aman%' and students.has_paid_fees=0;

output-

+----------------------+
| student_name         |
+----------------------+
| NULL                 |
| Amanda               |
| VENKATA RAMANA MENDA |
+----------------------+
3 rows in set (0.00 sec)




assignment-5.  find all students who are receiving any sort of discounts in their fees
	[tables: students, fee_discounts, finance_fees, finance_fee_collections, collection_discounts]

select distinct first_name from students left join fee_discounts on students.batch_id = fee_discounts.batch_id left join finance_fees on students.id = finance_fees.student_id left join finance_fee_collections on students.batch_id=finance_fee_collections.batch_id left join collection_discounts on students.school_id=collection_discounts.school_id where fee_discounts.is_amount=1 and students.school_id = 83;

output-
+----------------------+
| first_name           |
+----------------------+
| Lenore               |
| Shankars             |
| Panda                |
| Aubrey               |
| Shankar              |
| K. Anu               |
| payal                |
| nisha                |
| Coby                 |
| Matthew              |
| Keaton korpara amasa |
| Deacon               |
| Ivor                 |
| Ferris               |
| Beck                 |
| Craig                |
| Ross                 |
| Cairo                |
| Willa                |
| Zahir                |
| Lillian              |
| Brody                |
| Glenna               |
| Sharath              |
| Dean                 |
| Aphrodite            |
| Adam                 |
| Vincent              |
| Quamar               |
| Ralph                |
| Sagr                 |
| Aimee                |
| Marcia               |
| Scott                |
| Hayden               |
| Jared                |
| Briar                |
| Kylynn               |
| Mona                 |
| Summer               |
| Kathleen             |
| Octavius             |
| Hedda                |
| Price                |
| Gary                 |
| Xander               |
| Jelani               |
| Stacey               |
| Breanna              |
| Aspen                |
| Zelda                |
| Aiko                 |
| Jeanette             |
| SAahid               |
| Chaim                |
| Simon                |
| Chloe                |
| Willow               |
| Sandeep              |
| Iris                 |
| Kasimir              |
| Rahim                |
| Nita                 |
| Dante                |
| Shellie              |
| Charlotte            |
| Maisie               |
| Carly                |
| Winter               |
| Shekar               |
| Graham               |
| Stacy                |
| Kibo                 |
| Rana                 |
| Sreeshanth           |
| Eaton                |
| Hedy                 |
| Steven               |
| Zenaida              |
| Emmanuel             |
| Hoyt                 |
| Grant                |
| Melvin               |
| Rhea                 |
| Moana                |
| Philip               |
| Shea                 |
| Hillary              |
| Isha                 |
| Saneesh              |
| Mahesh               |
| Vishnu               |
| Paul                 |
| Peter                |
| Silas                |
| Rachel               |
| الدفعة               |

| Sandesh              |
| Liberty              |
| Anthony              |
| Yen                  |
| Hasad                |
| Jason                |
| Marshall             |
| Illana               |
| Zeus                 |
| Ulla                 |
| Gray                 |
| Justine              |
| Gretchen             |
| Kuame                |
| Cherokee             |
| new                  |
| Lani                 |
| Nora                 |
| Jescie               |
| Sage                 |
| Cole                 |
| student              |
| Caldwell             |
| Phelan               |
| Daryl                |
| Wade                 |
| Zane                 |
| Clayton              |
| Shaine               |
| Nerea                |
| Hyatt                |
| Rafael               |
| Xenos                |
| Amaya                |
| Martena              |
| Joan                 |
| Phillip              |
| Yardley              |
| Shyam                |
| a                    |
| Xaviera              |
| Tatiana              |
| Basil                |
| Malcolm              |
| Giselle              |
| Saheer               |
| Signe                |
| Forrest              |
| Oleg                 |
| Berk                 |
| Quemby               |
| Damon                |
| Orson                |
| Alexa                |
| Jade                 |
| Lane                 |
| Wesley               |
| Warren               |
| Bianca               |
| Arden                |
| Zephania             |
| Leila                |
| Axel                 |
| Madeline             |
| Austin               |
| Cain                 |
| Acton                |
| Bernard              |
| Lyle                 |
| Blossom              |
| Orli                 |
| Jessamine            |
| Hayley               |
| Kyle                 |
| Avram                |
| Christine            |
| Octavia              |
| Colby                |
| Zoe                  |
| Phoebe               |
| Yetta                |
| Dakota               |
| Megan                |
| Sydnee               |
| Germaine             |
| Riley                |
| Camille              |
| Mariko               |
| Richard              |
| Morgan               |
| Geoffrey             |
| Tyrone               |
| Astra                |
| Flynn                |
| Hiram                |
| Adara                |
| Robert               |
| Plato                |
| Xanthus              |
| Sara                 |
| Suki                 |
| Nasim                |
| Rooney               |
| Wayne                |
| Mark                 |
| Hope                 |
| Jamal                |
| Reuben               |
| Oliver               |
| Mufutau              |
| Walter               |
| Tanek                |
| Iliana               |
| Jenna                |
| Brandon              |
| Lalith               |
| Alexis               |
| Beatrice             |
| Emerson              |
| Galena               |
| Tashya               |
| Sagar                |
| Bryar                |
| Hammett              |
| Moses                |
| Ginger               |
| Yoshio               |
+----------------------+
224 rows in set (0.09 sec)



assignments-6. find all students who has atleast once made fee payment using online mode
	[tables: students, finance_transactions]

select distinct students.first_name as student_name,payment_mode from finance_transactions left join students on students.id=finance_transactions.payee_id where payment_mode='online Payment'and payee_type='Student' and finance_transactions.school_id=83;

output- 

26 rows in set (0.00 sec)



assignment-8. find all employees who are teacher and has never applied for a leave
	[tables: employees, batch_tutors, employee_attendances]

select employees.first_name as employee_name ,employees.job_title from employees left join batch_tutors on employees.id=batch_tutors.employee_id left join employee_attendances eatt on employees.id = eatt.employee_id where job_title='Teacher' and eatt.employee_id IS NULL;

output-
+---------------+-----------+
| employee_name | job_title |
+---------------+-----------+
| Diya          | Teacher   |
+---------------+-----------+
1 row in set (0.10 sec)



assignment-9. show student name, total amount to pay and total fine amount (as of today) for all students who has not completely paid
	[tables: students, finance_fees, finance_fee_collections, fines, fine_rules]


select distinct students.first_name as student_name,sum(finance_fees.balance) as total_amount_to_pay,datediff(curdate(),finance_fee_collections.due_date) as number_of_days,sum(fine_rules.fine_amount*datediff(curdate(),finance_fee_collections.due_date)) as total_fine_amount from finance_fee_collections left join finance_fees on finance_fee_collections.id = finance_fees.fee_collection_id left join students on students.school_id = finance_fee_collections.school_id left join fines on fines.id=finance_fee_collections.fine_id left join fine_rules on fine_rules.fine_id=finance_fee_collections.fine_id where students.school_id=1 and students.has_paid_fees=0 group by students.first_name;



+--------------+---------------------+----------------+-------------------+
| student_name | total_amount_to_pay | number_of_days | total_fine_amount |
+--------------+---------------------+----------------+-------------------+
| Allen        |         535399.2000 |           1709 |        16544.0000 |
| Aman         |         535399.2000 |           1709 |        16544.0000 |
| amana        |         535399.2000 |           1709 |        16544.0000 |
| Angel        |         535399.2000 |           1709 |        16544.0000 |
| Anjana       |         535399.2000 |           1709 |        16544.0000 |
| Kiran        |         535399.2000 |           1709 |        16544.0000 |
| Navin        |         535399.2000 |           1709 |        16544.0000 |
| Nidhin       |         535399.2000 |           1709 |        16544.0000 |
| Parvathy     |        1070798.4000 |           1709 |        33088.0000 |
| Prithvi      |         535399.2000 |           1709 |        16544.0000 |
| Priyanka     |         535399.2000 |           1709 |        16544.0000 |
| Raju         |         535399.2000 |           1709 |        16544.0000 |
| Shijith      |         535399.2000 |           1709 |        16544.0000 |
| Sobin        |         535399.2000 |           1709 |        16544.0000 |
| Sooraj       |        1070798.4000 |           1709 |        33088.0000 |
+--------------+---------------------+----------------+-------------------+
15 rows in set (0.01 sec)



assignment-10.  fetch all fees (collection) name, actual fees amount, discount amount, fines applicable for a selected student 
	[tables: finance_fees, finance_fee_collections, fee_discounts, collection_discounts, collection_particulars, finance_fee_particulars, fines, fine_rules]


select distinct finance_fee_collections.name as fee_name,finance_fees.balance as actual_fees_amount,fee_discounts.discount as discount_amount ,fine_rules.fine_amount from finance_fee_collections left join finance_fees on finance_fees.fee_collection_id = finance_fee_collections.id left join fee_discounts on fee_discounts.finance_fee_category_id=finance_fee_collections.fee_category_id left join collection_discounts on collection_discounts.finance_fee_collection_id=finance_fee_collections.id left join collection_particulars on collection_particulars.finance_fee_collection_id=finance_fee_collections.id left join fines on fines.id=finance_fee_collections.fine_id left join fine_rules on fine_rules.fine_id=finance_fee_collections.fine_id left join finance_fee_particulars on finance_fee_particulars.finance_fee_category_id=finance_fee_collections.fee_category_id where finance_fee_collections.school_id=83 and finance_fees.student_id=10228 group by finance_fee_collections.name;


output-

+------------------------+--------------------+-----------------+-------------+
| fee_name               | actual_fees_amount | discount_amount | fine_amount |
+------------------------+--------------------+-----------------+-------------+
| April collection321    |          3800.0000 |        100.0000 |      1.0000 |
| April month collection |             0.0000 |        100.0000 |      5.0000 |
| ARA Collection13       |          4100.0000 |        150.0000 |        NULL |
| Ara(March) collection1 |          4100.0000 |        150.0000 |      1.0000 |
+------------------------+--------------------+-----------------+-------------+
4 rows in set (0.08 sec)























