class Student
  @@next_id = 0 # Классовая переменная для хранения следующего ID
  
  # Конструктор класса
  def initialize(last_name, first_name, patronymic)
    # Задаем ID автоматически
    @id = @@next_id + 1
    @@next_id += 1 # Для следующего id добавляем +1

    # Задаем ФИО (обязательные параметры)
    @last_name = last_name # Фамилия 
    @first_name = first_name # Имя
    @patronymic = patronymic # Отчетсво 
    # Необязательные параметры = nil
    @phone = nil
    @telegram = nil
    @email = nil
    @git = nil
  end

  # Геттеры
  def id
    @id
  end

  def last_name
    @last_name
  end

  def first_name
    @first_name
  end

  def patronymic
    @patronymic
  end

  def phone
    @phone
  end

  def telegram
    @telegram
  end

  def email
    @email
  end

  def git
    @git
  end

  # Сеттеры
  def id=(id)
    @id = id
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def first_name=(first_name)
    @first_name = first_name
  end

  def patronymic=(patronymic)
    @patronymic = patronymic
  end

  def phone=(phone)
    @phone = phone
  end

  def telegram=(telegram)
    @telegram = telegram
  end

  def email=(email)
    @email = email
  end

  def git=(git)
    @git = git
  end

  def get_info()
    "ID: #{@id}, ФИО: #{@last_name} #{@first_name} #{@patronymic},\n Git: #{@git ? @git : 'нет'},\n Тел: #{@phone ? @phone : 'нет'},\n Телеграм: #{@telegram ? @telegram : 'нет'},\n Почта: #{@email ? @email : 'нет'} \n"

  end

end
