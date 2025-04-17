require_relative 'Student'
require_relative 'Student_short'

student1 = Student.new(
  id: "1",
  last_name: "Мишенькина", 
  first_name: "Валерия", 
  patronymic: "Андреевна",
  git: "https://github.com/lerushsh"
)

student2 = Student.new(
  id: "2",
  last_name: "Петрова", 
  first_name: "Мария", 
  patronymic: "Сергеевна",
  telegram: "@mary_petrova",
  phone: nil,
  email: "petrova@example.com"
)

student3 = Student.new(
  id: "3",
  last_name: "Сидоров", 
  first_name: "Алексей", 
  patronymic: "Николаевич",
  phone: "+79575384934",
  telegram: "@alex_sidorov",
  git: "https://github.com/sidorov"
)

student_short1 = Student_short.initialize_from_student(student1)
student_short2 = Student_short.initialize_from_string(4, student2.getInfo) 

# Выводим информацию о студентах
puts "Cтуденты:"

puts student1.getInfo
puts student_short1.to_s
puts student_short2.to_s

student4 = Student.create_from_string("ID: 4, Имя: Леша, Фамилия: Сидородов, Отчество: Андреевич, гит: https://github.com/sidorov")
puts student4.to_s
