import csv
from faker import Faker
import random


def export_to_csv(data, filename):
    with open(filename, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile, delimiter=',')
        for row in data:
            writer.writerow(row)


# export an array of string to sql file
def export(data, filename):
    with open(filename, 'w') as f:
        for row in data:
            f.write(row+"\n")


def getDeptCode():
    dept = ['CHE', 'CSE', 'ELE', 'ETC', 'IT', 'MEC', 'PHY']
    return dept[random.randint(0, len(dept) - 1)]


def getHostel():
    return random.randint(1, 9)


# CHANGE THE DATA HEADERS HERE
data = [['rollno', 'name', 'bdate', 'deptcode', 'hostel', 'parent_inc']]
# CHANGE THE COUNT HERE
count = 30

fake = Faker('en_IN')


for _ in range(count):
    # CHANGE THE FIELDS HERE
    data.append([fake.bothify(text='5105####'),
                 fake.first_name(), fake.date_of_birth(minimum_age=20, maximum_age=21), getDeptCode(), getHostel(), random.randint(100, 999)*(10**4)])

export_to_csv(data, 'data.csv')

# Conver into sql commands
TABLE = "students"
sql_commands = []

for row in data[1:]:
    serialize = ','.join([f"\'%s\'" % (str(x)) for x in row])
    sql_commands.append(
        f"INSERT INTO {TABLE} VALUES({serialize});")

export(sql_commands, 'data.sql')
