
## SQL TABLES
#Animals table

|          Animals               |
| :---          |                |
| ID            | SERIAL4        |
| Name          | varchar(255)   |
| Type          | varchar(255)   |
| Admision_date | date           |
| Age           | INT4           |
| adoptable?    | BOOLEAN        |
| picture       | text           |
| adopted       | BOOLEAN        |

#Owners
|           Owners                 |
| :---            |                |
| ID              | git status     |
| Name            | varchar(255)   |
| Contact_details | varchar(255)   |

#Adopted animals
|           Adopted_animals        |
| :---            |                |
| ID              | git status     |
| animal_id       | INT4           |
| owner_id        | INT4           |
| Adoption_date   | date           |
