# CREATE TABLE Photos (
# 	id int,
# 	photo varbinary(max)
# );

# INSERT INTO Photos
# SELECT 1, * FROM openrowset(
# 	BULK 'D:\bai and ai\sql-repository\lesson-2\shazi.jpg', single_blob) as img;

import pyodbc

con_str = 'DRIVER={SQL SERVER};SERVER=ASUS-EXPERTBOOK\SQLEXPRESS;DATABASE=Lesson3;TRUSTED_CONNECTION=TRUE'
con = pyodbc.connect(con_str)

cursor = con.cursor()

cursor.execute(
    '''SELECT * FROM Photos Where id = 2;'''
)

row = cursor.fetchone()
id, img = row

with open('sweetycat.jpg', 'wb') as f:
    f.write(img)
