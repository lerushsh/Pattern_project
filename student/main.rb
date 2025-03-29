require_relative 'Student'

student1 = Student.new(
  last_name: "Мишенькина", 
  first_name: "Валерия", 
  patronymic: "Андреевна",
  phone: "+79575384934",
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

# Выводим информацию о студентах
puts "Cтуденты:"
puts student1.to_s
puts student2.to_s
puts student3.to_s

