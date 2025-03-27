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

puts(search_min([5,7,6,9]))
puts(search_max([5,7,6,9]))
puts(search_index_first_positive_num([-5,7,6,-9]))
