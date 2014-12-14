Application Structure
====================

Event
-----
```
has_many Volunteers
has_many Schedules
has_many Jobs

string name
```

| id | name             |
|----|------------------|
| 1  | Sunday Service   |

Volunteer
---------
```
has_and_belongs_to_many Jobs

has_many Assignments

belongs_to Event

string name
```

| id | name          | event_id |
|----|---------------|----------|
| 1  | David Chapman | 1        |
| 2  | Emma Chapman  | 1        |


Job
---
```
has_and_belongs_to_many Volunteers

belongs_to Event

string name
```

| id | name              | event_id |
|----|-------------------|----------|
| 1  | Worship           | 1        |
| 2  | Jr. Sunday School | 1        |
| 3  | Sound             | 1        |

VolunteerJobs
-------------

| volunteer_id | job_id |
|--------------|--------|
| 1            | 1      |
| 1            | 3      |
| 2            | 2      |

Schedule
--------
```
has_many days
has_many

belongs_to Event

date    start_date
date    end_date
```

| id | start_on   | end_on      | event_id  |
|----|------------|-------------|-----------|
| 1  | January 1  | January 31  | 1         |

Day
---
```
belongs_to Schedule

date date
```

| id | date       |
|----|------------|
| 1  | January 4  |
| 2  | January 11 |
| 3  | January 18 |
| 4  | January 25 |

Assignment
----------
```
belongs_to Volunteer
belongs_to Day
belongs_to Job

integer score
boolean confirmed
boolean absent
```

| id | day_id | job_id | volunteer_id | score | confirmed | absent  |
|----|--------|--------|--------------|-------|-----------|---------|
| 1  | 1      | 1      | 1            | 10    | false     | false   |
| 2  | 1      | 2      | 2            | 10    | false     | false   |
| 3  | 1      | 3      | 1            | 10    | false     | false   |
| 4  | 2      | 1      | 1            | 10    | false     | false   |
| 5  | 2      | 2      | 2            | 10    | false     | false   |
| 6  | 2      | 3      | 1            | 10    | false     | false   |
| 7  | 3      | 1      | 1            | 10    | false     | false   |
| 8  | 3      | 2      | 2            | 10    | false     | false   |
| 9  | 3      | 3      | 1            | 10    | false     | false   |
| 10 | 4      | 1      | 1            | 10    | false     | false   |
| 11 | 4      | 2      | 2            | 10    | false     | false   |
| 12 | 4      | 3      | 1            | 10    | false     | false   |
