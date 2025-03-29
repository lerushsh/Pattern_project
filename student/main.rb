require_relative 'Student'

student1 = Student.new(
  "Мишенькина", 
  "Валерия", 
  "Андреевна",
  phone: "+79575384934",
  git: "https://github.com/lerushsh"
)

student2 = Student.new(
  "Петрова", 
  "Мария", 
  "Сергеевна",
  telegram: "@mary_petrova",
  phone: nil,
  email: "petrova@example.com"
)

student3 = Student.new(
  "Сидоров", 
  "Алексей", 
  "Николаевич",
  phone: "Телефон",
  telegram: "@alex_sidorov",
  git: "https://github.com/sidorov"
)

# Выводим информацию о студентах
puts "Cтуденты:"
puts student1.to_s
puts student2.to_s
puts student3.to_s

