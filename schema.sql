CREATE TYPE inspection_type AS ENUM ('daily', 'periodic', 'unscheduled');

CREATE TYPE inspection_result AS ENUM ('passed', 'failed', 'requires_repair');

CREATE TABLE wagon (
    wagon_id INT PRIMARY KEY,
    manufacture_year VARCHAR NOT NULL,
    color VARCHAR NOT NULL,
    purpose VARCHAR,
    load_capacity DECIMAL(10,2),
    manufacturer VARCHAR
);

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    full_name VARCHAR NOT NULL,
    position VARCHAR NOT NULL,
    qualification VARCHAR,
    hire_date DATE,
    phone_number VARCHAR CHECK (phone_number SIMILAR TO '(\+7|8) \d{3} \d{3}-\d{2}-\d{2}'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE technical_inspection (
    inspection_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    wagon_id INT NOT NULL REFERENCES wagon(wagon_id),
    employee_id INT NOT NULL REFERENCES employee(employee_id),
    inspection_date DATE NOT NULL,
    location VARCHAR,
    inspection_type inspection_type NOT NULL,
    result inspection_result NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE repair (
    repair_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    wagon_id INT NOT NULL REFERENCES wagon(wagon_id),
    employee_id INT NOT NULL REFERENCES employee(employee_id),
    start_date DATE NOT NULL,
    end_date DATE,
    defect_description VARCHAR,
    repair_cost DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE part (
    part_id INT PRIMARY KEY,
    name VARCHAR NOT NULL,
    sku VARCHAR NOT NULL,
    manufacturer VARCHAR,
    unit_price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE warehouse (
    warehouse_id INT PRIMARY KEY,
    part_id INT NOT NULL REFERENCES part(part_id),
    quantity DECIMAL(10,2) NOT NULL,
    unit VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE used_part (
    used_part_id INT PRIMARY KEY,
    repair_id UUID NOT NULL REFERENCES repair(repair_id),
    part_id INT NOT NULL REFERENCES part(part_id),
    quantity_used DECIMAL(10,2) NOT NULL,
    price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
