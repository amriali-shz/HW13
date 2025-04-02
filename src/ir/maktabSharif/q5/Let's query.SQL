drop table if exists employees, department;

create table employees
(
    employees_id  int primary key,
    first_name    varchar(255),
    last_name     varchar(255),
    department_id int
);

create table department
(
    department_id   int primary key,
    department_name varchar(255)
);

create type priority_level as enum ('High', 'Medium', 'Low');

create table Projects
(
    project_id    serial primary key,
    name          varchar(255)   not null,
    start_date    date           not null,
    end_date      date,
    priority      priority_level not null,
    department_id int,
    foreign key (department_id) references department (department_id)
);

create table Employee_Project
(
    employee_id int,
    project_id  int,
    primary key (employee_id, project_id),
    foreign key (employee_id) references employees (employees_id),
    foreign key (project_id) references Projects (project_id)
);

create type task_status as enum ('Not Started', 'In Progress', 'Completed');

create table tasks
(
    task_id     serial primary key,
    description text        not null,
    start_date  date        not null,
    end_date    date,
    due_date    date,
    project_id  int,
    employee_id int,
    status      task_status not null default 'Not Started',
    foreign key (project_id) references Projects (project_id),
    foreign key (employee_id) references employees (employees_id)
);

insert into employees (employees_id, first_name, last_name, department_id)
values (1, 'amirali', 'shafizad', null),
       (2, 'hadi', 'derakhshande', null),
       (3, 'saaide', 'sth', 2),
       (4, 'sogand', 'sth', 2),
       (5, 'fateme', 'nouri', 2),
       (6, 'farzaneh', 'ebrahimi', 1),
       (7, 'mahsa', 'hounjani', 1),
       (8, 'haniyeh', 'behbahani', 10),
       (9, 'arian', 'farahani', 10),
       (10, 'hossein', 'nade"ali', 4),
       (11, 'saeed', 'ghanbari', 3),
       (12, 'arash', 'nade"ali', 3),
       (13, 'parisa', 'mousavi', 3),
       (14, 'maryam', 'hosseini', 5),
       (15, 'negin', 'kazemi', 5),
       (16, 'mahin', 'bajelan', 5),
       (17, 'mehdi', 'seifi', 5),
       (18, 'maral', 'larijani', 5),
       (19, 'manureh', 'asadi', 5),
       (20, 'mahsa', 'mishanchi', 5),
       (21, 'mansureh', 'hakkak', 5),
       (22, 'maryam', 'piltan', 5),
       (23, 'niloufar', 'aabedini', 5),
       (24, 'hossein', 'karsazi', 5),
       (25, 'tayyebe', 'shahmoradi', 5),
       (26, 'niku', 'zargarani', 5),
       (27, 'samaneh', 'lesani', 5),
       (28, 'ali', 'bagherzanjani', 5),
       (29, 'sara', 'sharifi', 5),
       (30, 'fateme', 'zivari', 5),
       (31, 'sara', 'entezari', 5),
       (32, 'fahime saadat', 'baharanchi', 5),
       (33, 'reza', 'sepehr', 5),
       (34, 'erfan', 'bagherzadeh', 5),
       (35, 'pantea', 'mahdavian', 5),
       (36, 'asal', 'aghahosseini', 5),
       (37, 'elahe', 'molayee', 5),
       (38, 'haniyeh', 'moghaddamkia', 8),
       (39, 'parsila', 'rasouli', 8),
       (40, 'azin', 'nateghian', 8),
       (41, 'asal', 'najian', 8),
       (42, 'fateme', 'sabzalizadeh', 8),
       (43, 'sara', 'mohammadi', 8),
       (44, 'maryam', 'homayoonpour', 8),
       (45, 'helia', 'zarshenas', 8),
       (46, 'farnaz', 'rezayee', 8),
       (47, 'roya', 'raeesi', 8),
       (48, 'zahra', 'goodarzi', 8),
       (49, 'leyla', 'rafiyee', 9),
       (50, 'reyhane', 'mollasalehi', 9),
       (51, 'motahare', 'fasanghari', 9),
       (52, 'zahra', 'alipanahlou', 9),
       (53, 'mahdiyeh', 'yesari', 9),
       (54, 'mahdiyeh', 'moradipour', 7),
       (55, 'maryam', 'felahatpishe', 7),
       (56, 'rahele', 'sadeghi', 7),
       (57, 'mahsa', 'seddighi', 7),
       (58, 'fateme', 'gholipour', 6),
       (59, 'elahe', 'samadi-soufi', 6);

insert into department (department_id, department_name)
values (1, 'technical officer'),
       (2, 'Reception'),
       (3, 'Management'),
       (4, 'finance'),
       (5, 'clinical psychology'),
       (6, 'psychiatry'),
       (7, 'clinical psychology - family therapy'),
       (8, 'clinical psychology - children'),
       (9, 'clinical psychology - teenagers'),
       (10, 'education');

insert into Projects (name, start_date, end_date, priority, department_id)
values ('Mental Health Awareness', '2024-01-10', '2024-06-15', 'High', 5),
       ('Child Psychology Research', '2024-03-01', null, 'Medium', 8),
       ('AI in Psychiatry', '2024-02-15', '2024-12-31', 'High', 6),
       ('Financial Risk Analysis', '2024-04-01', null, 'Low', 4),
       ('Teen Counseling Program', '2024-05-20', '2025-02-10', 'Medium', 9);


insert into Employee_Project (employee_id, project_id)
values (14, 1), -- Maryam Hosseini is working on 'Mental Health Awareness'
       (15, 1), -- Negin Kazemi is working on 'Mental Health Awareness'
       (38, 2), -- Haniyeh Moghaddamkia is working on 'Child Psychology Research'
       (39, 2), -- Parsila Rasouli is working on 'Child Psychology Research'
       (58, 3), -- Fateme Gholipour is working on 'AI in Psychiatry'
       (59, 3), -- Elahe Samadi-Soufi is working on 'AI in Psychiatry'
       (10, 4), -- Hossein Nade'ali is working on 'Financial Risk Analysis'
       (49, 5), -- Leyla Rafiyee is working on 'Teen Counseling Program'
       (50, 5);
-- Reyhane Mollasalehi is working on 'Teen Counseling Program'

insert into tasks (description, start_date, end_date, due_date, project_id, employee_id, status)
values
    ('Task 1 for Mental Health Awareness', '2024-01-15', '2024-02-15', '2024-02-20', 1, 14, 'Completed'),
    ('Task 2 for Mental Health Awareness', '2024-02-01', null, '2024-03-01', 1, 15, 'In Progress'),

    ('Task 1 for Child Psychology Research', '2024-03-10', null, '2024-04-15', 2, 38, 'Not Started'),
    ('Task 2 for Child Psychology Research', '2024-03-15', '2024-03-30', '2024-04-01', 2, 39, 'Completed'),

    ('Task 1 for AI in Psychiatry', '2024-02-20', '2024-03-10', '2024-03-15', 3, 58, 'Completed'),
    ('Task 2 for AI in Psychiatry', '2024-03-01', null, '2024-04-01', 3, 59, 'In Progress'),

    ('Task 1 for Financial Risk Analysis', '2024-04-10', null, '2024-05-01', 4, 10, 'Not Started'),

    ('Task 1 for Teen Counseling Program', '2024-05-25', '2024-06-15', '2024-06-20', 5, 49, 'Completed'),
    ('Task 2 for Teen Counseling Program', '2024-06-01', null, '2024-06-30', 5, 50, 'In Progress');


--query n.1 of HW11
select employees_id,
       first_name,
       last_name,
       case
           when department_name is null
               then 'No Department'
           else department_name
           end
from employees
         full join department d on employees.department_id = d.department_id
order by employees_id;

--query n.1 of HW12
select name, Projects.start_date, Projects.end_date, Projects.priority
from Projects
where department_id = 9;

--query n.2 of HW12
select e.first_name, e.last_name, d.department_name, p.name as project_name
from employees e
         join Employee_Project ep on e.employees_id = ep.employee_id
         join Projects P on ep.project_id = P.project_id
         join department d on e.department_id = d.department_id;

--query n.3 of HW12
select d.department_name,
       count(distinct ep.employee_id)                         As busy_employees,
       count(e.employees_id) - count(distinct ep.employee_id) as free_employees
from department d
         left join employees e on d.department_id = e.department_id
         left join Employee_Project ep on e.employees_id = ep.employee_id
group by d.department_name;

--query n.1 of HW13
select p.project_id,
       p.name as project_name,
       count(t.task_id) as total_tasks,
       count(t.task_id) filter (where t.status = 'Completed') as completed_tasks,
        (count(t.task_id) filter (where t.status = 'Completed') * 1.0 / count(t.task_id)) as progress
from Projects p
         join tasks t on p.project_id = t.project_id
group by p.project_id, p.name
order by p.project_id;


--query n.2 of HW13
select p.project_id,
       p.name as project_name,
       e.first_name,
       e.last_name,
       count(t.task_id) as overdue_tasks
from Projects p
         join tasks t on p.project_id = t.project_id
         join employees e on t.employee_id = e.employees_id
where t.due_date < current_date
  and t.status != 'Completed'
group by p.project_id, p.name, e.employees_id, e.first_name, e.last_name
order by p.project_id, overdue_tasks asc;

