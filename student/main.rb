require_relative 'Student'
require_relative 'Student_short'

student1 = Student.new(
  last_name: "Мишенькина", 
  first_name: "Валерия", 
  patronymic: "Андреевна",
  git: "https://github.com/lerushsh"
)

student2 = Student.new(
  last_name: "Петрова", 
  first_name: "Мария", 
  patronymic: "Сергеевна",
  telegram: "@mary_petrova",
  phone: nil,
  email: "petrova@example.com"
)

student3 = Student.new(
  last_name: "Сидоров", 
  first_name: "Алексей", 
  patronymic: "Николаевич",
  phone: "+79575384934",
  telegram: "@alex_sidorov",
  git: "https://github.com/sidorov"
)
student_short1 = Student_short.initialize_from_student(student1) 
student_short2 = Student_short.initialize_from_student(student2) 
student_short3 = Student_short.initialize_from_student(student3)

student_short4 = Student_short.initialize_from_string(4, student1.getInfo) 
student_short5 = Student_short.initialize_from_string(5, student2.getInfo) 
student_short6 = Student_short.initialize_from_string(6, student3.getInfo) 

# Выводим информацию о студентах
puts "Cтуденты:"
puts student_short1.to_s
puts student_short2.to_s
puts student_short3.to_s
puts student_short4.to_s
puts student_short5.to_s
puts student_short6.to_s

student4 = Student.create_from_string("Имя: Леша, Фамилия: Сидородов, Отчество: Андреевич, гит: https://github.com/sidorov")
puts student4.to_s
