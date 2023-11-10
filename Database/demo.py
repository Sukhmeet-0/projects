import psycopg2

def create():
    conn=psycopg2.connect(dbname="postgres",user="postgres",password="root",host="localhost",port="5432")

    cur=conn.cursor()
    print("Connection successfull.")
    cur.execute('''create table student(ID SERIAL, NAME TEXT, AGE TEXT, ADDRESS TEXT);''')
    print('table created')

    conn.commit()
    conn.close()

def insert_data():
    conn=psycopg2.connect(dbname="postgres",user="postgres",password="root",host="localhost",port="5432")

    cur=conn.cursor()
    print("Connection successfull.")
    name=input("Enter name: ")
    address=input("Enter address: ")
    age=input("Enter age: ") 
    query=('''insert into student(NAME,AGE,ADDRESS) values(%s,%s,%s);''')
    cur.execute(query,(name,age,address))
    conn.commit()
    conn.close()
insert_data()