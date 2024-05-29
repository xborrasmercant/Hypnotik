

CREATE TABLE roles (
    name VARCHAR2(255) PRIMARY KEY,
    description VARCHAR2(255) NULL
)


CREATE TABLE users (
    id VARCHAR2(255) PRIMARY KEY,
    nick VARCHAR2(255) not null,
    email VARCHAR2(255) not null,
    pwd VARCHAR2(255) not null,
    doc TIMESTAMP NULL, -- date of creation
    dou TIMESTAMP NULL, -- date of update
    role_id VARCHAR2(255),
    CONSTRAINT FK_user_role FOREIGN KEY (role_id) REFERENCES roles (name)
)

CREATE TABLE dream_logs (
    id VARCHAR2(255) PRIMARY KEY,
    description TEXT null,
    dod TIMESTAMP NULL, -- date of dreaming
    doc TIMESTAMP NULL, -- date of creation
    dou TIMESTAMP NULL, -- date of update
    user_id VARCHAR2(255) not NULL,
    CONSTRAINT FK_dreamer FOREIGN KEY (user_id) REFERENCES users (id)
)

CREATE TABLE dream_tags (
    name VARCHAR2(255) PRIMARY KEY,
    description VARCHAR2(255) NULL
)


CREATE TABLE assigned_tags (
    id_dream VARCHAR2(255) NOT NULL,
    id_tag VARCHAR2(255) NOT NULL,
    CONSTRAINT PK_dream_tag PRIMARY KEY (id_dream, id_tag) ,
    CONSTRAINT FK_assigned_dream FOREIGN KEY (id_dream) REFERENCES dream_logs (id),
    CONSTRAINT FK_assigned_tag FOREIGN KEY (id_tag) REFERENCES dream_tags (name)
)


