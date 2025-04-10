class Student
  @@next_id = 0 # Классовая переменная для хранения следующего ID
  
  attr_reader :id, :last_name, :first_name, :patronymic, :telegram, :email, :git, :phone 

  # Конструктор класса
  def initialize(last_name:, first_name:, patronymic:, phone: nil, email: nil, git: nil, telegram: nil)
    # Задаем ID автоматически
    @id = @@next_id + 1
    @@next_id += 1 # Для следующего id добавляем +1

    # Задаем ФИО (обязательные параметры)
    self.last_name = last_name # Фамилия 
    self.first_name = first_name # Имя
    self.patronymic = patronymic # Отчетсво 
    
    # Необязательные параметры:
    self.git = git
    set_contacts(new_phone: phone, new_telegram: telegram, new_email: email)
  end

  # Проверки на корректность
  def self.valid_phone?(phone)
    phone.match?(/\A(\+\d{1,3}\s?)?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}\z/)
  end

  def self.valid_fio?(name)
    name.match?(/^[a-zA-Zа-яА-Я\s]+$/)
  end

  def self.valid_email?(email)
    email.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
  end

  def self.valid_telegram?(telegram)
    telegram.match?(/\A@[a-zA-Z0-9_]+\z/)
  end

  def self.valid_git?(git)
    git.match?(/\Ahttps:\/\/github\.com\/[a-zA-Z0-9_-]+(?:\/[a-zA-Z0-9_-]+(?:\.git)?)?\z/)
  end 

  # сеттеры с проверкой на корректность

  def set_contacts(new_phone: nil, new_telegram: nil, new_email: nil)
    
    if new_phone.nil? || self.class.valid_phone?(new_phone)
      @phone = new_phone
    else
      raise ArgumentError, "Некорректный формат номера телефона"
    end

    if new_email.nil? || self.class.valid_email?(new_email)
      @email = new_email
    else
      raise ArgumentError, "Некорректный формат email"
    end

    if new_telegram.nil? || self.class.valid_telegram?(new_telegram)
      @telegram = new_telegram
    else
      raise ArgumentError, "Некорректный формат telegram"
    end

  end

  def first_name=(new_name)
    if self.class.valid_fio?(new_name)
      @first_name = new_name
    else
      raise ArgumentError, "Некорректный формат имени"
    end
  end

  def last_name=(new_name)
    if self.class.valid_fio?(new_name)
      @last_name = new_name
    else
      raise ArgumentError, "Некорректный формат фамилии"
    end
  end

  def patronymic=(new_patronymic)
    if self.class.valid_fio?(new_patronymic)
      @patronymic = new_patronymic
    else
      raise ArgumentError, "Некорректный формат отчества"
    end
  end

  def git=(new_git)
    if new_git.nil? || self.class.valid_git?(new_git)
      @git = new_git
    else
      raise ArgumentError, "Некорректный формат git"
    end
  end

  # проверка на наличие гита и контакта
  def validate? ()
    has_contact?() && has_git?()
  end

  def has_git? ()
    !(self.git == nil)
  end

  def has_contact? ()
    !(self.phone == nil && self.telegram == nil && self.email == nil)
  end

  def to_s()
    "ID: #{@id}, ФИО: #{@last_name} #{@first_name} #{@patronymic},\n Git: #{@git ? @git : 'нет'},\n Тел: #{@phone ? @phone : 'нет'},\n Телеграм: #{@telegram ? @telegram : 'нет'},\n Почта: #{@email ? @email : 'нет'} \n"
  end

end
