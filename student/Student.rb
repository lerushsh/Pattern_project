class Student
  @@next_id = 0 # Классовая переменная для хранения следующего ID
  
  attr_accessor :last_name, :first_name, :patronymic, :telegram, :email, :git
  attr_reader :id, :phone # Только геттер для id и phone, чтоб не меняли id, для phone проверка

  # Конструктор класса
  def initialize(last_name, first_name, patronymic, **options)
    # Задаем ID автоматически
    @id = @@next_id + 1
    @@next_id += 1 # Для следующего id добавляем +1

    # Задаем ФИО (обязательные параметры)
    @last_name = last_name # Фамилия 
    @first_name = first_name # Имя
    @patronymic = patronymic # Отчетсво 
    # Необязательные параметры (по дефолту = nil)
    self.phone = options[:phone] if options.key?(:phone) # Вызывает сеттер phone, если был передан phone
    @telegram = options.fetch(:telegram, nil)
    @email = options.fetch(:email, nil)
    @git = options.fetch(:git, nil)
  end

  # Проверка номера телефона
  def self.valid_phone?(phone)
    # Валидация: +7 и 10 цифр
    phone.match?(/^(\+7\d{10})$/)
  end

  # сеттер phone с проверкой
  def phone=(new_phone)
    if new_phone.nil? || self.class.valid_phone?(new_phone)
      @phone = new_phone
    else
      raise ArgumentError, "Некорректный формат номера телефона"
    end
  end

  def to_s()
    "ID: #{@id}, ФИО: #{@last_name} #{@first_name} #{@patronymic},\n Git: #{@git ? @git : 'нет'},\n Тел: #{@phone ? @phone : 'нет'},\n Телеграм: #{@telegram ? @telegram : 'нет'},\n Почта: #{@email ? @email : 'нет'} \n"
  end

end
