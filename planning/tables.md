
## SQL TABLES


## Type of Animal

|  description    |  type          |
| :---------------| :--------------|
| ID              | Serial4        |
| Name            | varchar(255)   |

## Animals

| description   | type           |
| :-------------| :-------------:|
| ID            | SERIAL4        |
| Name          | varchar(255)   |
| Type_id       |   INT4         |
| Admision_date | date           |
| Age           | INT4           |
| adoptable?    | BOOLEAN        |
| picture       | text           |
| adopted       | BOOLEAN        |

## Owners
|  description    |  type          |
| :---------------| :--------------|
| ID              | Serial4        |
| Name            | varchar(255)   |
| Contact_details | varchar(255)   |

## Adopted animals

|  description    |  type          |
| :---------------| :--------------|
| ID              | SERIAL4        |
| animal_id       | INT4           |
| owner_id        | INT4           |
| Adoption_date   | date           |

## Tables made for the Extensions

## Users

|  description    |  type          |
| :---------------| :--------------|
| ID              | Serial4        |
| Name            | varchar(255)   |
| Contact_details | varchar(255)   |

## Requests

|  description    |  type          |
| :---------------| :--------------|
| ID              | Serial4        |
| user_id         | varchar(255)   |
| animal_id       | varchar(255)   |
| comment         | text           |
