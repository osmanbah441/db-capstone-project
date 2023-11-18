DELIMITER //

CREATE PROCEDURE CheckBooking (IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE booking_status VARCHAR(100);

    -- Check if the table is already booked for the given date
    SELECT CASE 
        WHEN EXISTS (
            SELECT 1
            FROM Bookings
            WHERE date = booking_date
            AND tableNumber = table_number
        )
        THEN CONCAT('Table ', table_number, ' is already booked.')
        ELSE CONCAT('Table ', table_number, ' is available.')
    END INTO booking_status;

    -- Display the status of the table for the given date
    SELECT booking_status AS Table_Status;
END //

DELIMITER ;

CALL CheckBooking('2022-10-10', 5);

DELIMITER //

CREATE PROCEDURE AddValidBooking (IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE table_booked INT DEFAULT 0;

    START TRANSACTION;

    -- Check if the table is already booked for the given date
    SELECT COUNT(*) INTO table_booked
    FROM bookings
    WHERE date = booking_date
    AND tableNumber = table_number;

    IF table_booked > 0 THEN
        -- Table is already booked, rollback the transaction
        ROLLBACK;
        SELECT 'Table is already booked. Booking declined.' AS Message;
    ELSE
        -- Insert a new booking record using the input parameters
        INSERT INTO Bookings (date, table_number)
        VALUES (booking_date, table_number);

        -- Commit the transaction if the booking is successful
        COMMIT;
        SELECT 'Booking added successfully.' AS Message;
    END IF;
END //

DELIMITER ;




CALL AddValidBooking('2024-10-10', 5);

