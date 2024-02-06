magic_school = MagicSchool.create(name: 'Hogwarts')

klass1 = Klass.create(number: '1', letter: 'G', students_count: 0, magic_school: magic_school)
klass2 = Klass.create(number: '1', letter: 'S', students_count: 0, magic_school: magic_school)

Student.create([
  { first_name: 'Harry', last_name: 'James', surname: 'Potter', klass: klass1, magic_school: magic_school },
  { first_name: 'Ronald', last_name: 'Billius', surname: 'Weasley', klass: klass1, magic_school: magic_school },
  { first_name: 'Hermione', last_name: 'Jean', surname: 'Granger', klass: klass1, magic_school: magic_school },
  { first_name: 'Draco', last_name: 'Lucius', surname: 'Malfoy', klass: klass2, magic_school: magic_school }
])

