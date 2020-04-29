-- districts
ALTER TABLE districts ADD PRIMARY KEY (id);
ALTER TABLE districts MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE districts AUTO_INCREMENT=11;

-- branches
ALTER TABLE branches ADD PRIMARY KEY (id);
ALTER TABLE branches MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE branches AUTO_INCREMENT=49;


-- users
ALTER TABLE users ADD PRIMARY KEY (id);
ALTER TABLE users MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE users AUTO_INCREMENT=11;
ALTER TABLE users ADD UNIQUE KEY email (email);
ALTER TABLE users ADD UNIQUE KEY password_reset_token (password_reset_token);

-- files
ALTER TABLE files ADD PRIMARY KEY (id);
ALTER TABLE files MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE files ADD KEY idx_files_status (status);


-- транспортные пропуска
-- companies
ALTER TABLE companies ADD PRIMARY KEY (id);
ALTER TABLE companies MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE companies ADD UNIQUE KEY idx_companies_company (inn,ogrn);
ALTER TABLE companies ADD KEY idx_companies_status (status);
ALTER TABLE companies ADD KEY idx_companies__name (name(50));
ALTER TABLE companies AUTO_INCREMENT=2;

-- bids
ALTER TABLE bids ADD PRIMARY KEY (id);
ALTER TABLE bids MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE bids ADD KEY idx_bids_workflow_status (workflow_status);
ALTER TABLE bids ADD KEY idx_bids_company (company_id);
ALTER TABLE bids ADD KEY idx_bids_user (user_id);
ALTER TABLE bids ADD KEY idx_bids_move (moved_to);
ALTER TABLE bids ADD KEY idx_bids_alighned (alighned_id);
ALTER TABLE bids ADD KEY idx_bids_print (print_id);
ALTER TABLE bids ADD KEY idx_bids_district (district_id);
ALTER TABLE bids ADD CONSTRAINT fk_bids_company FOREIGN KEY (company_id) REFERENCES companies (id);


-- issued
ALTER TABLE issued ADD PRIMARY KEY (id);
ALTER TABLE issued MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE issued ADD KEY issued_inn_idx (company_inn);
ALTER TABLE issued ADD KEY issued_ogrn_idx (company_ogrn);
ALTER TABLE issued ADD KEY issued_pass_number_idx (pass_number);
ALTER TABLE issued ADD KEY issued_car_number_idx (company_car);
ALTER TABLE issued ADD KEY issued_registry_number_idx (registry_number);
ALTER TABLE issued ADD CONSTRAINT issued_created_fk FOREIGN KEY (created_by) REFERENCES users (id);

-- passes
ALTER TABLE passes ADD PRIMARY KEY (id);
ALTER TABLE passes MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE passes ADD KEY idx_passes_lastname (lastname);
ALTER TABLE passes ADD KEY idx_passes_created (created_by);
ALTER TABLE passes ADD KEY idx_passes_district (district_id);
ALTER TABLE passes ADD KEY idx_passes_bid (bid_id);
ALTER TABLE passes ADD CONSTRAINT fk_passes_created FOREIGN KEY (created_by) REFERENCES users (id);

-- пропуска для сотрудников

-- companies_people
ALTER TABLE companies_people ADD PRIMARY KEY (id);
ALTER TABLE companies_people MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE companies_people ADD UNIQUE KEY idx_companies_people_company (inn,ogrn);
ALTER TABLE companies_people ADD KEY idx_companies_people_status (status);
ALTER TABLE companies_people ADD KEY idx_companies_people_name (name(50));
ALTER TABLE companies_people AUTO_INCREMENT=2;

-- bids_people
ALTER TABLE bids_people ADD PRIMARY KEY (id);
ALTER TABLE bids_people MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE bids_people ADD KEY idx_bids_people_company (company_id);
ALTER TABLE bids_people ADD KEY idx_bids_people_workflow_status (workflow_status);
ALTER TABLE bids_people ADD KEY idx_bids_people_user (user_id);
ALTER TABLE bids_people ADD KEY idx_bids_people_move (moved_to);
ALTER TABLE bids_people ADD KEY idx_bids_people_alighned (alighned_id);
ALTER TABLE bids_people ADD KEY idx_bids_people_print (print_id);
ALTER TABLE bids_people ADD KEY idx_bids_people_dist (district_id);
ALTER TABLE bids_people ADD CONSTRAINT fk_bids_people_company FOREIGN KEY (company_id) REFERENCES companies_people (id);

-- issued_people
ALTER TABLE issued_people ADD PRIMARY KEY (id);
ALTER TABLE issued_people MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE issued_people ADD KEY idx_issued_people_number (pass_number);
ALTER TABLE issued_people ADD KEY idx_issued_people_arm_number (arm_number);
ALTER TABLE issued_people ADD KEY idx_issued_people_company (company_id);
ALTER TABLE issued_people ADD CONSTRAINT fk_issued_people_company FOREIGN KEY (company_id) REFERENCES companies_people (id);

-- passes_people
ALTER TABLE passes_people ADD PRIMARY KEY (id);
ALTER TABLE passes_people MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE passes_people ADD KEY idx_passes_people_status (status);
ALTER TABLE passes_people ADD KEY fk_passes_people_bid (bid_id);
ALTER TABLE passes_people ADD KEY fk_passes_people_issued (issued_id);
ALTER TABLE passes_people ADD CONSTRAINT fk_passes_people_bid FOREIGN KEY (bid_id) REFERENCES bids_people (id);
ALTER TABLE passes_people ADD CONSTRAINT fk_passes_people_issued FOREIGN KEY (issued_id) REFERENCES issued_people (id);

ALTER TABLE sources ADD PRIMARY KEY (id);
ALTER TABLE sources MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE sources ADD UNIQUE KEY sources_name_uniq (name);

ALTER TABLE routing ADD PRIMARY KEY (id);
ALTER TABLE routing MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE routing AUTO_INCREMENT=5;
ALTER TABLE routing ADD CONSTRAINT fk_source_id FOREIGN KEY (source_id) REFERENCES sources (id);
ALTER TABLE routing ADD CONSTRAINT fk_district_id FOREIGN KEY (district_id) REFERENCES districts (id);
ALTER TABLE routing ADD CONSTRAINT fk_clean_id FOREIGN KEY (clean_id) REFERENCES users (id);
ALTER TABLE routing ADD CONSTRAINT fk_dirty_id FOREIGN KEY (dirty_id) REFERENCES users (id);
ALTER TABLE routing ADD KEY idx_sources_districts (source_id, district_id);