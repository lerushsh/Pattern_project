class Student
  @@next_id = 0 # Классовая переменная для хранения следующего ID
  
  attr_accessor :last_name, :first_name, :patronymic, :phone, :telegram, :email, :git
  attr_reader :id # Только геттер для id, чтоб не меняли id

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
    @phone = options.fetch(:phone, nil)
    @telegram = options.fetch(:telegram, nil)
    @email = options.fetch(:email, nil)
    @git = options.fetch(:git, nil)
  end

  def to_s()
    "ID: #{@id}, ФИО: #{@last_name} #{@first_name} #{@patronymic},\n Git: #{@git ? @git : 'нет'},\n Тел: #{@phone ? @phone : 'нет'},\n Телеграм: #{@telegram ? @telegram : 'нет'},\n Почта: #{@email ? @email : 'нет'} \n"
  end

end
