'BEGIN'
    'COMMENT' Hello World program for ALGOL 60;
    'INTEGER' I;
    'FOR' I := 1 'STEP' 1 'UNTIL' 5 'DO'
    'BEGIN'
         OUTSTRING(1, '('Hello, world!')');
         SYSACT(1, 14, 1);
    'END'
'END'
