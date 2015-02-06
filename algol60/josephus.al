'BEGIN'
    'COMMENT' Finds the remainder of X and Y for positive values;
    'INTEGER' 'PROCEDURE' MODULUS(X, Y);
    'VALUE' X, Y;
    'INTEGER' X, Y;
    'BEGIN'
        MODULUS := X - (Y * (X '/' Y));
    'END'

    'COMMENT' Find surviving prisoner from circle of N;
    'COMMENT' after killing each Kth prisoner;
    'INTEGER' 'PROCEDURE' JOSEPHUS(N, K);
    'VALUE' N, K;
    'INTEGER' N, K;
    'BEGIN'
        'INTEGER' INDEX, PRISONER;
         PRISONER := 0;
        'FOR' INDEX := 1 'STEP' 1 'UNTIL' N 'DO'
        'BEGIN'
            JOSEPHUS := PRISONER := MODULUS(PRISONER + K, INDEX);
        'END'
    'END'

    'COMMENT' Main program;
    OUTINTEGER(1, JOSEPHUS(41, 3));
'END'
