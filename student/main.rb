require_relative 'Student'

student1 = Student.new("Мишенькина", "Валерия", "Андреевна")
student1.phone = "+79575384934"
student1.git = "https://github.com/lerushsh"

student2 = Student.new("Петрова", "Мария", "Сергеевна")
student2.telegram = "@mary_petrova"
student2.email = "petrova@example.com"

student3 = Student.new("Сидоров", "Алексей", "Николаевич")
student3.phone = "+79998765432"
student3.telegram = "@alex_sidorov"
student3.git = "https://github.com/sidorov"

# Выводим информацию о студентах
puts "Cтуденты:"
puts student1.get_info
puts student2.get_info
puts student3.get_info

