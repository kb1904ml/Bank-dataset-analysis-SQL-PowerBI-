UPDATE Transactions
SET Transactiondate = 
    CASE
        -- MM/DD/YYYY or MM-DD-YYYY
        WHEN TRY_CONVERT(date, Transactiondate, 101) IS NOT NULL 
            THEN FORMAT(TRY_CONVERT(date, Transactiondate, 101), 'MM/dd/yyyy')
        -- YYYY-MM-DD
        WHEN TRY_CONVERT(date, Transactiondate, 23) IS NOT NULL    
            THEN FORMAT(TRY_CONVERT(date, Transactiondate, 23), 'MM/dd/yyyy')
        -- YYYY/MM/DD
        WHEN TRY_CONVERT(date, Transactiondate, 111) IS NOT NULL   
            THEN FORMAT(TRY_CONVERT(date, Transactiondate, 111), 'MM/dd/yyyy')
        -- DD-MM-YYYY
        WHEN TRY_CONVERT(date, Transactiondate, 105) IS NOT NULL  
            THEN FORMAT(TRY_CONVERT(date, Transactiondate, 105), 'MM/dd/yyyy')
        -- DD/MM/YYYY
        WHEN TRY_CONVERT(date, Transactiondate, 103) IS NOT NULL
            THEN FORMAT(TRY_CONVERT(date, Transactiondate, 103), 'MM/dd/yyyy')
        ELSE Transactiondate
    END;
