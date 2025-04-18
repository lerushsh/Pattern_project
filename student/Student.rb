require_relative 'Super_student'
class Student < Super_student

  attr_reader :id, :last_name, :first_name, :patronymic, :telegram, :email, :git, :phone 

  # Конструктор класса
  def initialize(id:, last_name:, first_name:, patronymic:, phone: nil, email: nil, git: nil, telegram: nil)
    super(id: id.to_s.strip, git: git)

    # Задаем ФИО (обязательные параметры)
    self.last_name = last_name # Фамилия 
    self.first_name = first_name # Имя
    self.patronymic = patronymic # Отчетсво 
    
    # Необязательные параметры:
    set_contacts(new_phone: phone, new_telegram: telegram, new_email: email)
  end

  #конструктор через строку вида: "Имя: Значение, Фамилия: Значение"
  def self.create_from_string(string)
    attributes = {}

    string.split(', ').each do |pair|
      key, value = pair.split(': ')
      attributes[key.downcase] = value
    end

    new(
      id: attributes['id'],
      last_name: attributes['фамилия'],
      first_name: attributes['имя'],
      patronymic: attributes['отчество'],
      phone: attributes['телефон'],
      telegram: attributes['телеграм'],
      email: attributes['почта'],
      git: attributes['гит']
    )
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

  # проверка на наличие гита и контакта
  def validate? ()
    has_contact?() && has_git?()
  end

  def has_contact? ()
    !(self.phone == nil && self.telegram == nil && self.email == nil)
  end

  def to_s()
    "ID: #{@id}, ФИО: #{@last_name} #{@first_name} #{@patronymic},\n #{git_info},\n Тел: #{@phone ? @phone : 'нет'},\n Телеграм: #{@telegram ? @telegram : 'нет'},\n Почта: #{@email ? @email : 'нет'} \n"
  end

  def getInfo()
    "#{fio_info}, #{git_info}, #{contact_info}"
  end

  def fio_info()
    "#{@last_name} #{@first_name[0]}.#{@patronymic[0]}."
  end

  def contact_info()
    if self.phone
      "Телефон: #{@phone}"
    elsif self.telegram
      "Телеграм: #{@telegram}"
    elsif self.email
      "Email: #{@email}"
    else
      "Нет контакта"
    end
  end

end
