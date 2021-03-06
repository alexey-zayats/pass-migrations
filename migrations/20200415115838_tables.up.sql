
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
    log longtext DEFAULT NULL,
    source varchar(15) DEFAULT NULL,
    created_at datetime NOT NULL
) ENGINE=InnoDB COMMENT 'Файлы импортов';


-- транспортные пропуска

-- Реестр выданных пропусков для ТС
CREATE TABLE issued (
    id int NOT NULL COMMENT 'ID выданного пропуска',
    created_at datetime NOT NULL COMMENT 'Дата создания',
    created_by int NOT NULL COMMENT 'Пользователь создания',
    company_inn varchar(12) default null,
    company_ogrn varchar(15) default null,
    company_name text default null,
    company_fio text default null,
    company_car varchar(50) not null,
    legal_basement text default null,
    pass_number varchar(255) not null COMMENT 'Номер пропуска',
    pass_type int not null COMMENT 'Вид пропуска', -- Краснодар: 1 (желтый); Краснодарский край: 2 (красный)
    district varchar(255) not null COMMENT 'Наименование МО',
    issued_at datetime DEFAULT NULL COMMENT 'Дата выдачи',
    registry_number varchar(100) DEFAULT NULL COMMENT 'Номер в реестре округа',
    shipping int not null COMMENT 'Способ направления заявителю', -- 1 - электронно, 2 - нарочно
    file_id int default null
) ENGINE=InnoDB COMMENT 'Выданные пропуска';


-- Компании по пропускам для транспорта
CREATE TABLE companies (
    id int NOT NULL,
    ogrn varchar(50) NOT NULL COMMENT 'ОГРН',
    inn varchar(50) NOT NULL COMMENT 'ИНН',
    name varchar(512) NOT NULL COMMENT 'Название компании',
    branch_id int NOT NULL,
    status int NOT NULL DEFAULT '0'
) ENGINE=InnoDB COMMENT 'Компании по пропускам для транспорта';

-- заявки на пропуск для ТС
CREATE TABLE bids (
    id int NOT NULL COMMENT 'Идентификатор',
    file_id int DEFAULT NULL COMMENT 'ID файла завки',
    company_id int DEFAULT NULL,
    branch_id int DEFAULT NULL,
    company_branch text COMMENT 'Вид деятельности',
    company_name text NOT NULL COMMENT 'Название',
    company_address text DEFAULT NULL COMMENT 'Адрес',
    company_ceo_phone text DEFAULT NULL COMMENT 'Телефон директора',
    company_ceo_email text DEFAULT NULL COMMENT 'E-mail директора',
    company_ceo_name text NOT NULL COMMENT 'ФИО директора',
    agree smallint NOT NULL COMMENT 'Согласие обработки',
    confirm smallint NOT NULL COMMENT 'Подтверждение данных',
    workflow_status int DEFAULT NULL,
    code text,
    district_id int NOT NULL COMMENT 'Муниципальный округ',
    pass_type smallint NOT NULL COMMENT 'Тип пропуска',
    created_at datetime NOT NULL COMMENT 'Дата создания',
    created_by int NOT NULL COMMENT 'Пользователь создания',
    user_id int DEFAULT NULL COMMENT 'Оператор',
    source text,
    moved_to int DEFAULT NULL,
    alighned_id int DEFAULT NULL,
    print_id int DEFAULT NULL,
    city varchar(255) DEFAULT NULL,
    who_address varchar(512) DEFAULT NULL,
    phone_where varchar(255) DEFAULT NULL,
    fio_where varchar(255) DEFAULT NULL,
    city_where varchar(255) DEFAULT NULL,
    address_where varchar(512) DEFAULT NULL,
    `from` varchar(50) DEFAULT NULL,
    `to` varchar(50) DEFAULT NULL,
    reason text,
    link varchar(512) DEFAULT NULL
) ENGINE=InnoDB;

CREATE TABLE passes (
    id int NOT NULL COMMENT 'ID',
    bid_id int NOT NULL,
    issued_id int DEFAULT NULL,
    lastname varchar(100) NOT NULL COMMENT 'Фамилия гражданина',
    firstname varchar(100) NOT NULL COMMENT 'Имя гражданина',
    patrname varchar(100) NOT NULL COMMENT 'Отчество гражданина',
    car varchar(20) DEFAULT NULL COMMENT 'Номер автомобиля',
    source smallint NOT NULL COMMENT 'Источник загрузки',
    district_id int NOT NULL COMMENT 'Муниципальный округ',
    pass_type smallint NOT NULL COMMENT 'Тип пропуска',
    pass_number varchar(50) DEFAULT NULL COMMENT 'Номер пропуска',
    alighner_post varchar(50) DEFAULT NULL COMMENT 'Должность согласователя',
    alighner_name varchar(100) DEFAULT NULL COMMENT 'ФИО согласователя',
    shipping int DEFAULT NULL COMMENT 'Способ направления',
    status smallint NOT NULL COMMENT 'Статус',
    file_id int DEFAULT NULL COMMENT 'Файл загрузки',
    created_at datetime NOT NULL COMMENT 'Дата создания',
    created_by int NOT NULL COMMENT 'Пользователь создания'
) ENGINE=InnoDB COMMENT='Пропуски';


-- пропуска для сотрудников

-- Компании по пропускам для сотрудников
CREATE TABLE companies_people (
    id int NOT NULL,
    ogrn varchar(50) NOT NULL COMMENT 'ОГРН',
    inn varchar(50) NOT NULL COMMENT 'ИНН',
    name varchar(512) NOT NULL COMMENT 'Название компании',
    branch_id int NOT NULL,
    status int NOT NULL DEFAULT '0'
) ENGINE=InnoDB COMMENT 'Компании по пропускам для сотрудников';

-- заявки на пропуска сотрудников
CREATE TABLE bids_people (
    id int NOT NULL,
    file_id int DEFAULT NULL,
    company_id int NOT NULL COMMENT 'Компания',
    branch_id int DEFAULT NULL COMMENT 'Вид деятельности',
    company_branch text COMMENT 'Вид деятельности',
    company_name text NOT NULL COMMENT 'Название',
    company_address text DEFAULT NULL COMMENT 'Адрес',
    company_ceo_phone text DEFAULT NULL COMMENT 'Телефон директора',
    company_ceo_email text DEFAULT NULL COMMENT 'E-mail директора',
    company_ceo_name text DEFAULT NULL COMMENT 'ФИО директора',
    agree smallint NOT NULL COMMENT 'Согласие обработки',
    confirm smallint NOT NULL COMMENT 'Подтверждение данных',
    workflow_status int DEFAULT NULL,
    district_id int NOT NULL COMMENT 'Муниципальный округ',
    pass_type smallint NOT NULL COMMENT 'Тип пропуска',
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
    source smallint NOT NULL COMMENT 'Источник загрузки',
    district_id int NOT NULL COMMENT 'Муниципальный округ',
    pass_type smallint NOT NULL COMMENT 'Тип пропуска',
    pass_number varchar(50) DEFAULT NULL COMMENT 'Номер пропуска',
    shipping int DEFAULT NULL COMMENT 'Способ направления',
    status smallint NOT NULL COMMENT 'Статус',
    lastname varchar(100) NOT NULL COMMENT 'Фамилия гражданина',
    firstname varchar(100) NOT NULL COMMENT 'Имя гражданина',
    patrname varchar(100) NOT NULL COMMENT 'Отчество гражданина'
) ENGINE=InnoDB;

-- заявки на пропуска сотрудников
CREATE TABLE issued_people (
    id int NOT NULL COMMENT 'ID',
    district varchar(255) not null COMMENT 'Наименование МО',
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


-- данные для роутинга заявок
CREATE TABLE sources (
    id int(11) NOT NULL COMMENT 'ID',
    name varchar(100) NOT NULL COMMENT 'Имя',
    title varchar(255)  NOT NULL COMMENT 'Название'
) ENGINE=InnoDB COMMENT='Источники данных';

--
CREATE TABLE routing (
    id int NOT NULL COMMENT 'ID',
    source_id int not null COMMENT 'ID источника данных',
    district_id int not null COMMENT 'ID округа',
    clean_id int not null COMMENT 'ID диспечера "чистых" данных',
    dirty_id int not null COMMENT 'ID диспечера "грязных" данных'
) ENGINE=InnoDB COMMENT='Диспетчеры данных';