INSERT INTO wagon VALUES
(1, 2015, 'Red', 'Cargo', 60.5, 'UralVagonZavod'),
(2, 2018, 'Blue', 'Passenger', 45.0, 'TverCarriageWorks'),
(3, 2020, 'Green', 'Cargo', 70.0, 'UralVagonZavod'),
(4, 2012, 'Yellow', 'Maintenance', 30.0, 'AltayMachines'),
(5, 2017, 'Gray', 'Cargo', 65.5, 'UralVagonZavod'),
(6, 2019, 'Black', 'Passenger', 40.0, 'TverCarriageWorks'),
(7, 2014, 'White', 'Cargo', 55.0, 'VagonMash'),
(8, 2016, 'Blue', 'Cargo', 63.0, 'UralVagonZavod'),
(9, 2021, 'Red', 'Passenger', 48.0, 'TverCarriageWorks'),
(10, 2022, 'Gray', 'Service', 25.0, 'AltayMachines');

INSERT INTO employee VALUES
(101, 'Ivan Petrov', 'Inspector', 'Engineer', '2020-03-15', '+7 999 123-45-67'),
(102, 'Anna Sidorova', 'Mechanic', 'Technician', '2019-07-01', '8 901 555-66-77'),
(103, 'Sergey Morozov', 'Technician', 'Junior', '2022-01-10', '+7 903 222-11-22'),
(104, 'Elena Volkova', 'Inspector', 'Senior Engineer', '2015-09-20', '8 999 444-55-66'),
(105, 'Dmitry Kuznetsov', 'Mechanic', 'Technician', '2018-12-01', '+7 911 888-33-22'),
(106, 'Olga Pavlova', 'Warehouse Manager', 'Logistics', '2016-06-18', '+7 920 456-78-90'),
(107, 'Maxim Lebedev', 'Inspector', 'Engineer', '2017-11-03', '8 902 123-45-67'),
(108, 'Natalia Smirnova', 'Technician', 'Engineer', '2021-04-12', '+7 921 333-22-11');

INSERT INTO technical_inspection (wagon_id, employee_id, inspection_date, location, inspection_type, result) VALUES
(1, 101, '2024-05-01', 'Depot A', 'daily', 'passed'),
(2, 104, '2024-05-02', 'Depot B', 'periodic', 'requires_repair'),
(3, 107, '2024-05-03', 'Depot C', 'unscheduled', 'passed'),
(4, 101, '2024-05-04', 'Depot A', 'daily', 'passed'),
(5, 104, '2024-05-05', 'Depot B', 'periodic', 'failed'),
(6, 107, '2024-05-06', 'Depot C', 'daily', 'passed'),
(7, 101, '2024-05-07', 'Depot A', 'unscheduled', 'requires_repair'),
(8, 104, '2024-05-08', 'Depot B', 'periodic', 'passed');

INSERT INTO repair (wagon_id, employee_id, start_date, end_date, defect_description, repair_cost) VALUES
(2, 102, '2024-05-03', '2024-05-07', 'Brake malfunction', 12500.00),
(5, 102, '2024-05-08', NULL, 'Axle misalignment', 15400.00),
(4, 105, '2024-05-09', '2024-05-10', 'Electrical issue', 6700.00),
(6, 105, '2024-05-11', NULL, 'Suspension fault', 9200.00),
(3, 102, '2024-05-12', '2024-05-14', 'Hydraulic leak', 14500.00),
(7, 105, '2024-05-15', NULL, 'Paint damage', 3000.00);

INSERT INTO part VALUES
(1, 'Brake Pad', 'BP-123', 'PartsCo', 1500.00),
(2, 'Wheel Bearing', 'WB-456', 'BearingsInc', 2300.00),
(3, 'Hydraulic Pump', 'HP-789', 'HydroWorks', 4800.00),
(4, 'Axle Set', 'AX-321', 'UralParts', 6200.00),
(5, 'Suspension Kit', 'SK-654', 'SuspTech', 5700.00),
(6, 'Wiring Set', 'WS-987', 'ElecFix', 2100.00),
(7, 'Door Seal', 'DS-555', 'SealMaster', 700.00),
(8, 'Paint Kit', 'PK-777', 'ColorFast', 900.00);

INSERT INTO warehouse VALUES
(1, 1, 100, 'pcs'),
(2, 2, 50, 'pcs'),
(3, 3, 30, 'pcs'),
(4, 4, 20, 'sets'),
(5, 5, 25, 'kits'),
(6, 6, 40, 'sets'),
(7, 7, 150, 'pcs'),
(8, 8, 200, 'cans');

INSERT INTO used_part (used_part_id, repair_id, part_id, quantity_used, price) VALUES
(1, (SELECT repair_id FROM repair OFFSET 0 LIMIT 1), 1, 4, 6000.00),
(2, (SELECT repair_id FROM repair OFFSET 1 LIMIT 1), 4, 1, 6200.00),
(3, (SELECT repair_id FROM repair OFFSET 2 LIMIT 1), 6, 1, 2100.00),
(4, (SELECT repair_id FROM repair OFFSET 3 LIMIT 1), 5, 1, 5700.00),
(5, (SELECT repair_id FROM repair OFFSET 4 LIMIT 1), 3, 2, 9600.00),
(6, (SELECT repair_id FROM repair OFFSET 5 LIMIT 1), 8, 1, 900.00);