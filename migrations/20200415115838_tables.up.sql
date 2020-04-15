-- Округа
CREATE TABLE districts (
    id int(11) NOT NULL COMMENT 'ID',
    name varchar(200) NOT NULL COMMENT 'Название'
) ENGINE=InnoDB COMMENT='Округа';

-- Виды деятельности
CREATE TABLE branches (
    id int NOT NULL,
    name varchar(1024) NOT NULL COMMENT 'Вид деятельности',
    type varchar(30) NOT NULL COMMENT 'Тип'
) ENGINE=InnoDB COMMENT='Виды деятельности';

-- Пользователи АРМ
CREATE TABLE users (
    id int(11) NOT NULL COMMENT 'ID',
    email varchar(100) NOT NULL COMMENT 'E-mail',
    password_hash varchar(255) NOT NULL COMMENT 'Пароль',
    password_reset_token varchar(50) DEFAULT NULL COMMENT 'Токен восстановления пароля',
    district int(11) DEFAULT NULL COMMENT 'Район/округ',
    created_at datetime NOT NULL COMMENT 'Дата создания',
    updated_at datetime NOT NULL COMMENT 'Дата обновления',
    lastname varchar(50) DEFAULT NULL,
    firstname varchar(50) DEFAULT NULL,
    patrname varchar(50) DEFAULT NULL,
    post varchar(50) DEFAULT NULL
) ENGINE=InnoDB;

-- Файлы импортов
CREATE TABLE files (
    id int NOT NULL,
    filepath varchar(512) NOT NULL,
    status smallint DEFAULT NULL,
    log text DEFAULT NULL,
    source text DEFAULT NULL,
    created_at datetime NOT NULL
) ENGINE=InnoDB COMMENT 'Файлы импортов';


-- транспортные пропуска

-- Реестр выданных пропусков для ТС
CREATE TABLE issued (
    id int NOT NULL COMMENT 'ID выданного пропуска',
    created_at datetime NOT NULL COMMENT 'Дата создания',
    created_by int NOT NULL COMMENT 'Пользователь создания',
    company_inn varchar(255) default null,
    company_ogrn varchar(255) default null,
    company_name text default null,
    company_fio text default null,
    company_car varchar(50) not null,
    legal_basement text default null,
    pass_number varchar(255) not null COMMENT 'Номер пропуска',
    district varchar(255) not null COMMENT 'Наименование МО',
    pass_type int not null COMMENT 'Вид пропуска', -- Краснодар: 1 (желтый); Краснодарский край: 2 (красный)
    issued_at datetime DEFAULT NULL COMMENT 'Дата выдачи',
    registry_number varchar(100) DEFAULT NULL COMMENT 'Номер в реестре округа',
    shipping int not null COMMENT 'Способ направления заявителю', -- 1 - электронно, 2 - нарочно
    file_id int default null
) ENGINE=InnoDB COMMENT 'Выданные пропуска';

-- заявки на пропуск для ТС
CREATE TABLE bids (
    id int NOT NULL COMMENT 'Идентификатор',
    file_id int DEFAULT NULL COMMENT 'ID файла завки',
    workflow_status int DEFAULT NULL,
    code text,
    district int NOT NULL COMMENT 'Муниципальный округ',
    type smallint NOT NULL COMMENT 'Тип пропуска',
    created_at datetime NOT NULL COMMENT 'Дата создания',
    created_by int NOT NULL COMMENT 'Пользователь создания',
    user_id int DEFAULT NULL COMMENT 'Оператор',
    source text,
    moved_to int DEFAULT NULL,
    company_id int DEFAULT NULL,
    alighned_id int DEFAULT NULL,
    print_id int DEFAULT NULL,
    branch_id int DEFAULT NULL
) ENGINE=InnoDB;

CREATE TABLE passes (
    id int NOT NULL COMMENT 'ID',
    company_branch text COMMENT 'Вид деятельности',
    company_okved varchar(255) DEFAULT NULL COMMENT 'Код ОКВЭД',
    company_inn varchar(100) NOT NULL COMMENT 'ИНН',
    company_name text NOT NULL COMMENT 'Название',
    company_address text DEFAULT NULL COMMENT 'Адрес',
    company_ceo_phone text DEFAULT NULL COMMENT 'Телефон директора',
    company_ceo_email text NOT NULL COMMENT 'E-mail директора',
    company_lastname varchar(100) NOT NULL COMMENT 'Фамилия директора',
    company_firstname varchar(100) NOT NULL COMMENT 'Имя директора',
    company_patrname varchar(100) NOT NULL COMMENT 'Отчество директора',
    employee_lastname varchar(100) NOT NULL COMMENT 'Фамилия гражданина',
    employee_firstname varchar(100) NOT NULL COMMENT 'Имя гражданина',
    employee_patrname varchar(100) NOT NULL COMMENT 'Отчество гражданина',
    employee_car varchar(20) DEFAULT NULL COMMENT 'Номер автомобиля',
    employee_agree smallint NOT NULL COMMENT 'Согласие обработки',
    employee_confirm smallint NOT NULL COMMENT 'Подтверждение данных',
    source smallint NOT NULL COMMENT 'Источник загрузки',
    district int NOT NULL COMMENT 'Муниципальный округ',
    type smallint NOT NULL COMMENT 'Тип пропуска',
    number varchar(50) DEFAULT NULL COMMENT 'Номер пропуска',
    alighner_post varchar(50) DEFAULT NULL COMMENT 'Должность согласователя',
    alighner_name varchar(100) DEFAULT NULL COMMENT 'ФИО согласователя',
    send_type int DEFAULT NULL COMMENT 'Способ направления',
    status smallint NOT NULL COMMENT 'Статус',
    file_id int DEFAULT NULL COMMENT 'Файл загрузки',
    log text COMMENT 'Журнал обработки',
    created_at datetime NOT NULL COMMENT 'Дата создания',
    created_by int NOT NULL COMMENT 'Пользователь создания',
    bid_id int DEFAULT NULL,
    issued_id int DEFAULT NULL,
    company_ogrn varchar(100) NOT NULL COMMENT 'ОГРН'
) ENGINE=InnoDB COMMENT='Пропуски';



-- пропуска для сотрудников

-- Компании по пропускам для сотрудников
CREATE TABLE companies_people (
    id int NOT NULL,
    ogrn bigint unsigned NOT NULL COMMENT 'ОГРН',
    inn bigint unsigned NOT NULL COMMENT 'ИНН',
    name varchar(512) NOT NULL COMMENT 'Название компании',
    branch_id int NOT NULL,
    status int NOT NULL DEFAULT '0'
) ENGINE=InnoDB COMMENT 'Компании по пропускам для сотрудников';

-- заявки на пропуска ТС
CREATE TABLE bids_people (
    id int NOT NULL,
    file_id int DEFAULT NULL,
    company_id int NOT NULL COMMENT 'Компания',
    branch_id int DEFAULT NULL COMMENT 'Вид деятельности',
    company_branch text COMMENT 'Вид деятельности',
    company_okved varchar(255) DEFAULT NULL COMMENT 'Код ОКВЭД',
    company_name varchar(512) NOT NULL COMMENT 'Название',
    company_address varchar(512) DEFAULT NULL COMMENT 'Адрес',
    company_ceo_phone varchar(20) DEFAULT NULL COMMENT 'Телефон директора',
    company_ceo_email varchar(50) DEFAULT NULL COMMENT 'E-mail директора',
    company_ceo_name varchar(100) DEFAULT NULL COMMENT 'ФИО директора',
    workflow_status int DEFAULT NULL,
    district int NOT NULL COMMENT 'Муниципальный округ',
    type smallint NOT NULL COMMENT 'Тип пропуска',
    source text DEFAULT NULL,
    user_id int DEFAULT NULL,
    moved_to int DEFAULT NULL,
    alighned_id int DEFAULT NULL,
    print_id int DEFAULT NULL,
    created_at datetime NOT NULL COMMENT 'Дата создания',
    created_by int NOT NULL COMMENT 'Пользователь создания'
) ENGINE=InnoDB;

-- заявки на пропуск для сотрудников
CREATE TABLE passes_people (
    id int NOT NULL COMMENT 'ID',
    bid_id int NOT NULL,
    issued_id int DEFAULT NULL COMMENT 'Реестр',
    agree smallint NOT NULL COMMENT 'Согласие обработки',
    confirm smallint NOT NULL COMMENT 'Подтверждение данных',
    source smallint NOT NULL COMMENT 'Источник загрузки',
    district int NOT NULL COMMENT 'Муниципальный округ',
    type smallint NOT NULL COMMENT 'Тип пропуска',
    number varchar(50) DEFAULT NULL COMMENT 'Номер пропуска',
    send_type int DEFAULT NULL COMMENT 'Способ направления',
    status smallint NOT NULL COMMENT 'Статус',
    lastname varchar(100) NOT NULL COMMENT 'Фамилия гражданина',
    firstname varchar(100) NOT NULL COMMENT 'Имя гражданина',
    patrname varchar(100) NOT NULL COMMENT 'Отчество гражданина'
) ENGINE=InnoDB;

-- заявки на пропуска сотрудников
CREATE TABLE issued_people (
    id int NOT NULL COMMENT 'ID',
    district int NOT NULL COMMENT 'Муниципальный округ',
    company_id int NOT NULL COMMENT 'Компания',
    lastname varchar(100) NOT NULL COMMENT 'Фамилия гражданина',
    firstname varchar(100) NOT NULL COMMENT 'Имя гражданина',
    patrname varchar(100) NOT NULL COMMENT 'Отчество гражданина',
    legal_basement text,
    pass_number varchar(255) DEFAULT NULL,
    created_at datetime NOT NULL COMMENT 'Дата создания',
    created_by int NOT NULL COMMENT 'Пользователь создания',
    issued_at datetime DEFAULT NULL,
    registry_number varchar(255) DEFAULT NULL,
    shiping smallint DEFAULT NULL,
    arm_number varchar(100) DEFAULT NULL,
    arm_number_by int DEFAULT NULL,
    arm_number_at datetime DEFAULT NULL
) ENGINE=InnoDB;

