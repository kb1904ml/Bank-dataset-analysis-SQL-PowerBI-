UPDATE Accounts
SET OpenDate = 
    CASE
        WHEN TRY_CONVERT(date, OpenDate, 101) IS NOT NULL 
            THEN FORMAT(TRY_CONVERT(date, OpenDate, 101), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, OpenDate, 23) IS NOT NULL    
            THEN FORMAT(TRY_CONVERT(date, OpenDate, 23), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, OpenDate, 111) IS NOT NULL   
            THEN FORMAT(TRY_CONVERT(date, OpenDate, 111), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, OpenDate, 105) IS NOT NULL  
            THEN FORMAT(TRY_CONVERT(date, OpenDate, 105), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, OpenDate, 103) IS NOT NULL
            THEN FORMAT(TRY_CONVERT(date, OpenDate, 103), 'MM/dd/yyyy') 
        ELSE OpenDate  -- leave as is if unable to parse
    END;

