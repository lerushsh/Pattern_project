unless ARGV.empty?        # Если передан аргумент, здороваемся с пользователем       
  puts "Привет, #{ARGV[0]}"                               
end
ARGV.clear                       

# Ввод и обработка ruby-команды
puts "Введи команду на руби:  "
ruby_command = gets.chomp         

begin                             # Блок обработки ошибок
  result = eval(ruby_command)     
  puts "Результат: #{result}"

rescue Exception => e  # Перехватываем все ошибки
  puts "Ошибка: #{e.class} - #{e.message}" # Выводим ошибку
end

# Ввод и обработка OC команды
puts "Введи команду ОС: " 
os_command = gets.chomp           
result = system(os_command)

if result == true # Вывод успешности выполнения команды
  puts "Успех"
elsif result == false
  puts "Ошибка"
else
  puts "Команда не найдена или не может быть выполнена"           
end
