import random
rolls = [
    '51052985',
    '51054491',
    '51053017',
    '51052423',
    '51051159',
    '51058167',
    '51055679',
    '51055573',
    '51055787',
    '51051803',
    '51056805',
    '51050567',
    '51054776',
    '51051394',
    '51059691',
    '51057039',
    '51053522',
    '51059658',
    '51051337',
    '51059178',
    '51054427',
    '51050243',
    '51054930',
    '51050736',
    '51052529',
    '51050488',
    '51053419',
    '51051744',
    '51050192',
    '51052466'
]

depts = [
    'MEC',
    'PHY',
    'IT',
    'ETC',
    'ETC',
    'CSE',
    'ETC',
    'ELE',
    'PHY',
    'ELE',
    'ETC',
    'ELE',
    'ETC',
    'ETC',
    'ETC',
    'CHE',
    'ELE',
    'ELE',
    'ETC',
    'PHY',
    'CHE',
    'CHE',
    'CHE',
    'ELE',
    'MEC',
    'CHE',
    'CSE',
    'ETC',
    'CHE',
    'MEC'
]

all_dept = set(depts)


def generateSQLCommand(roll, crs_cd, marks):
    print('INSERT INTO crs_regd VALUES (\'{}\', \'{}\', {});'.format(
        roll, crs_cd, marks))


for index, roll in enumerate(rolls):
    # generate 4 courses
    for i in range(4):
        # generate a random dept
        dept = depts[index]
        generateSQLCommand(roll, str(dept)+"_"+str(i+1),
                           random.randint(70, 100))

    # two other courses
    for i in range(2):
        # generate a random dept
        while 1:
            dept = random.choice(list(all_dept.difference({dept})))
            if dept != depts[index]:
                break
        generateSQLCommand(roll, str(dept)+"_"+str(i+1),
                           random.randint(70, 100))
