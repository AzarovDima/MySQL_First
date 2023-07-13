import pymysql
from config import host, user, password, db_name

try:
    connection = pymysql.connect(
        host=host,  # host ="localhost"
        port=3306,
        user=user,  # user="root"
        password=password,
        database=db_name,
        cursorclass=pymysql.cursors.DictCursor,
    )
    print("Connected")

    try:
        cursor = connection.cursor()

        # drop
        drop_query = """DROP TABLE IF EXISTS test;"""
        cursor.execute(drop_query)

        # create
        create_query = """ CREATE TABLE IF NOT EXISTS test
                        (
                            id INT PRIMARY KEY AUTO_INCREMENT,
                            firstname VARCHAR(45)
                        ); """

        cursor.execute(create_query)
        print("Table created successfully")

        # insert
        insert_query = "INSERT test(firstname)" "VALUES ('Anton'),('Alex'), ('Misha'); "
        cursor.execute(insert_query)
        connection.commit()  # insert, update, delete

        # update
        update_query = """UPDATE test SET firstname = 'TEST' WHERE id = 1;"""
        cursor.execute(update_query)
        connection.commit()  # insert, update, delete
        print("UPDATE successfully")

        # delete
        cursor.execute("DELETE FROM test WHERE id = 3;")
        connection.commit()  # insert, update, delete

        # read = select
        select_query = "SELECT * FROM test;"
        cursor.execute(select_query)
        rows = cursor.fetchall()
        for row in rows:
            print(row["id"])
            print(row["firstname"])
            print(row)
        print(rows)

    finally:
        connection.close()


except Exception as ex:
    print(ex)
    print("Refused")
