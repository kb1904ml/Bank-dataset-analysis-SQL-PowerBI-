UPDATE Customers
SET DateOfBirth = 
    CASE
        WHEN TRY_CONVERT(date, DateOfBirth, 101) IS NOT NULL 
            THEN FORMAT(TRY_CONVERT(date, DateOfBirth, 101), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, DateOfBirth, 23) IS NOT NULL    
            THEN FORMAT(TRY_CONVERT(date, DateOfBirth, 23), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, DateOfBirth, 111) IS NOT NULL   
            THEN FORMAT(TRY_CONVERT(date, DateOfBirth, 111), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, DateOfBirth, 105) IS NOT NULL  
            THEN FORMAT(TRY_CONVERT(date, DateOfBirth, 105), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, DateOfBirth, 103) IS NOT NULL
            THEN FORMAT(TRY_CONVERT(date, DateOfBirth, 103), 'MM/dd/yyyy')
        ELSE DateOfBirth
    END;
