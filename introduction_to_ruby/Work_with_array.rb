#поиск минимального элемента массива
def search_min (array)
  min = array[0]
  for item in array do
    min = item if item < min
  end
  min
end

#поиск максимального элемента массива
def search_max (array)
  max = array[0]
  for item in array do
    max = item if item > max
  end
  max
end

#поиск первого вхождения положительного эл-та массива
def search_index_first_positive_num (array)
  for i in 0..array.size-1 do
    if(array[i] > 0) then 
      return i
    end
  end
  return -1
end 

if ARGV.length < 2 then     # проверка на входные аргументы, если их меньше 2, то просим ввести метод и названия файла с клавиатуры
  ARGV.clear
  puts "Введи какой метод хочешь использовать (от 1 до 3): "   
  method = gets.chomp 
  puts "Введи файл: "   
  file_path = gets.chomp 
else
  method = ARGV[0]
  file_path = ARGV[1]
end

begin                       # блок чтения файла
  array = File.readlines(file_path).map(&:to_i)   
  puts (array)                                       
rescue Errno::ENOENT                                                                    
  puts "Ошибка, файл не найден"
  exit                                                                                  
end

case method                                                                             
when '1'                                                       
  puts "Минимальный элемент: #{search_min(array)}"                                               
when '2'
  puts "Максимальный элемент: #{search_max(array)}"
when '3'
  result = search_index_first_positive_num(array)
  if result == -1 then 
    puts "Положительного элемента нет"
  else
    puts "Индекс первого положительного элемента: #{result}"
  end
else                                                                                    
  puts "Ошибка, неизвестный метод"
end
