require_relative 'Student'

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

# Выводим информацию о студентах
puts "Cтуденты:"
puts student1.getInfo
puts student2.getInfo
puts student3.getInfo

puts student1.validate?
puts student2.validate?
puts student3.validate?

student4 = Student.create_from_string("Имя: Леша, Фамилия: Сидородов, Отчество: Андреевич, гит: https://github.com/sidorov")
puts student4.to_s
