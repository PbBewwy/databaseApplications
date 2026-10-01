```mermaid
erDiagram
    MOVIES ||--o{ ROLES : "has many roles"
    PEOPLE ||--o{ ROLES : "plays many roles"
    MOVIES {
        int movie_id PK
        string title
        int release_year
    }
    PEOPLE {
        int person_id PK
        string name
    }
    ROLES {
        int movie_id FK
        int person_id FK
        string role
    }
```