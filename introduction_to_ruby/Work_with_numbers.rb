
# Проверка, является ли число простым
def prime?(num)
  return false if num <= 1  # Сразу возвращаем false, если число <= 1 
  (2..Math.sqrt(num).to_i).each do |i| # Перебор возможных делителей числа от 2 до корня числа 
    return false if num % i == 0  # Если нашел хоть один делитель, возвращаем false
  end
  true
end

# Сумма простых делителей числа
def sum_prime_divisors(number)
  sum = 0
  (1..number).each do |i|
    if number % i == 0 && prime?(i)  # Если делитель и он простой
      sum += i
    end
  end
  sum
end

# Количество нечетных цифр числа, больших 3:
def count_odd_digits_gt_3(number)
  count = 0

  while number > 0    # перебор цифр числа
    digit = number % 10
    count += 1 if digit.odd? && digit > 3 #проверка цифры на условия
    number /= 10
  end
  count
end

# Сумма цифр числа:
def sum_of_digits(number)
  sum = 0
  while number > 0
    sum += number % 10  
    number /= 10        
  end
  sum
end

# Произведение таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа:
def prod_of_spec_divisors(number)
  main_sum = sum_of_digits(number)
  prod = 1
  (1..number).each do |i|
    prod *= i if number % i == 0 && sum_of_digits(i) < main_sum
  end
  prod
end

puts "Введите число: "
number = gets.to_i                             
puts "Сумма простых делителей числа: #{sum_prime_divisors(number)}"
puts "Количество нечетных цифр числа, больших 3: #{count_odd_digits_gt_3(number)}"
puts "Произведение таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа: #{prod_of_spec_divisors(number)}"
