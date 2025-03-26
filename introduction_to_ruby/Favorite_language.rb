if ARGV.empty?      # Проверка есть ли входные аргументы              
  puts "Привет, введи свое имя: "   
  name = gets.chomp               # Если нет, то ввод имени с клавиатуры
else                              
  name = ARGV[0]                  # Если есть, то имя = первый аргумент
end
ARGV.clear                        # Очищаем ARGV, чтобы gets работал с клавиатурой
puts "Привет, #{name}" 

puts "Какой твой любимый язык?"
lang = gets.chomp  
lang = lang.downcase
case lang
when "ruby"
  puts "Подлиза)"
when "python"
  puts "Ну окей..."
when "c"
  puts "Ого, сколько тебе лет..?"
when "c++"
  puts "Любишь спать с паяльником?)"
when "r"
  puts "Давай дружить?)"
when "c#"
  puts "Ты случайно не работаешь в CarX?"
when "java"
  puts "Круто!"
else
  puts "Ой, я такой пока не знаю"
end

if lang != "ruby"
  puts "Cкоро будет ruby (лучше подчиниться)"
end
