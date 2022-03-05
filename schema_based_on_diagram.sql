-- CREATED A NEW TABLE 'patients'
CREATE TABLE patients(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR (250),
    date_of_birth DATE
);

-- CREATED A NEW TABLE 'invoice'
CREATE TABLE invoices(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT,
    CONSTRAINT fk_medical_history
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories (id),
);

-- CREATED A NEW TABLE 'medical_histories'
CREATE TABLE medical_histories(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admitted_at timestamp,
    patient_id int,
    status VARCHAR(255),
    CONSTRAINT fk_patient
    FOREIGN KEY (patient_id)
    REFERENCES patients (id)
);

-- CREATED A NEW TABLE 'invoices_items'
CREATE TABLE invoices_items(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatment_id int,
    CONSTRAINT fk_invoice
    FOREIGN KEY (invoice_id)
    REFERENCES invoices (id),
    CONSTRAINT fk_treatment,
    FOREIGN KEY (treatment_id)
    REFERENCES treatments (id),
);

-- CREATED A NEW TABLE 'treatments'
CREATE TABLE treatments(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type VARCHAR(255),
    name VARCHAR(255),
); 

-- CREATED A NEW TABLE 'medical_histories_treatments'
CREATE TABLE medical_histories_treatments(
    medical_histories_id int,
    treatments_id int,
    FOREIGN KEY (medical_histories_id)
    REFERENCES medical_histories (id),
    FOREIGN KEY (treatments_id)
    REFERENCES treatments (id),
);

-- CREATED A NEW TABLE INDEXES
CREATE INDEX medical_histories_patient_index
    ON medical_histories (patient_id);
CREATE INDEX invoice_medical_history_index
    ON invoices (medical_history_id);
CREATE INDEX invoice_items_invoice_index
    ON invoices_items (invoice_id);
CREATE INDEX invoice_items_treatment_index
    ON invoices_items (treatment_id);
CREATE INDEX medical_histories_treatments_medical_history_index
    ON medical_histories_treatments (medical_histories_id);
CREATE INDEX medical_histories_treatments_treatments_index
    ON medical_histories_treatments (treatments_id);