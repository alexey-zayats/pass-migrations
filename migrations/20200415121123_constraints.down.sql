
-- транспортные пропуска

-- passes
ALTER TABLE passes DROP FOREIGN KEY fk_passes_created;
ALTER TABLE passes DROP KEY idx_passes_district;
ALTER TABLE passes DROP KEY idx_passes_lastname;
ALTER TABLE passes DROP KEY idx_passes_created;
ALTER TABLE passes DROP KEY idx_passes_bid;
ALTER TABLE passes MODIFY COLUMN id INT;
ALTER TABLE passes DROP PRIMARY KEY;

-- bids
ALTER TABLE bids DROP FOREIGN KEY fk_bids_company;
ALTER TABLE bids DROP KEY idx_bids_workflow_status;
ALTER TABLE bids DROP KEY idx_bids_company;
ALTER TABLE bids DROP KEY idx_bids_user;
ALTER TABLE bids DROP KEY idx_bids_move;
ALTER TABLE bids DROP KEY idx_bids_alighned;
ALTER TABLE bids DROP KEY idx_bids_print;
ALTER TABLE bids DROP KEY idx_bids_district;
ALTER TABLE bids MODIFY COLUMN id INT;
ALTER TABLE bids DROP PRIMARY KEY;


-- issued
ALTER TABLE issued DROP FOREIGN KEY issued_created_fk;
ALTER TABLE issued DROP KEY issued_inn_idx;
ALTER TABLE issued DROP KEY issued_ogrn_idx;
ALTER TABLE issued DROP KEY issued_pass_number_idx;
ALTER TABLE issued DROP KEY issued_car_number_idx;
ALTER TABLE issued DROP KEY issued_registry_number_idx;
ALTER TABLE issued MODIFY COLUMN id INT;
ALTER TABLE issued DROP PRIMARY KEY;



-- пропуска для сотрудников


-- passes_people
ALTER TABLE passes_people DROP FOREIGN KEY fk_passes_people_bid;
ALTER TABLE passes_people DROP FOREIGN KEY fk_passes_people_issued;
ALTER TABLE passes_people DROP KEY idx_passes_people_status;
ALTER TABLE passes_people DROP KEY fk_passes_people_bid;
ALTER TABLE passes_people DROP KEY fk_passes_people_issued;
ALTER TABLE passes_people MODIFY COLUMN id INT;
ALTER TABLE passes_people DROP PRIMARY KEY;

-- bids_people
ALTER TABLE bids_people DROP FOREIGN KEY fk_bids_people_company;
ALTER TABLE bids_people DROP KEY idx_bids_people_company;
ALTER TABLE bids_people DROP KEY idx_bids_people_workflow_status;
ALTER TABLE bids_people DROP KEY idx_bids_people_user;
ALTER TABLE bids_people DROP KEY idx_bids_people_move;
ALTER TABLE bids_people DROP KEY idx_bids_people_alighned;
ALTER TABLE bids_people DROP KEY idx_bids_people_print;
ALTER TABLE bids_people DROP KEY idx_bids_people_dist;
ALTER TABLE bids_people MODIFY COLUMN id INT;
ALTER TABLE bids_people DROP PRIMARY KEY;


-- issued_people
ALTER TABLE issued_people DROP FOREIGN KEY fk_issued_people_company;
ALTER TABLE issued_people DROP KEY idx_issued_people_company;
ALTER TABLE issued_people DROP KEY idx_issued_people_number;
ALTER TABLE issued_people DROP KEY idx_issued_people_arm_number;
ALTER TABLE issued_people MODIFY COLUMN id INT;
ALTER TABLE issued_people DROP PRIMARY KEY;


-- companies_people
ALTER TABLE companies_people DROP KEY idx_companies_people_company;
ALTER TABLE companies_people DROP KEY idx_companies_people_status;
ALTER TABLE companies_people DROP KEY idx_companies_people_name;
ALTER TABLE companies_people MODIFY COLUMN id INT;
ALTER TABLE companies_people DROP PRIMARY KEY;

ALTER TABLE routing DROP FOREIGN KEY fk_source_id;
ALTER TABLE routing DROP FOREIGN KEY fk_district_id;
ALTER TABLE routing DROP FOREIGN KEY fk_clean_id;
ALTER TABLE routing DROP FOREIGN KEY fk_dirty_id;
ALTER TABLE routing DROP KEY idx_sources_districts;
ALTER TABLE routing MODIFY COLUMN id INT;
ALTER TABLE routing DROP PRIMARY KEY;

ALTER TABLE sources DROP KEY sources_name_uniq;
ALTER TABLE sources MODIFY COLUMN id INT;
ALTER TABLE sources DROP PRIMARY KEY;

-- districts
ALTER TABLE districts MODIFY COLUMN id INT;
ALTER TABLE districts DROP PRIMARY KEY;

-- branches
ALTER TABLE branches MODIFY COLUMN id INT;
ALTER TABLE branches DROP PRIMARY KEY;

-- users
ALTER TABLE users DROP KEY email;
ALTER TABLE users DROP KEY password_reset_token;
ALTER TABLE users MODIFY COLUMN id INT;
ALTER TABLE users DROP PRIMARY KEY;


-- files
ALTER TABLE files DROP KEY idx_files_status;
ALTER TABLE files MODIFY COLUMN id INT;
ALTER TABLE files DROP PRIMARY KEY;

