require_relative 'Super_student'
class Student_short < Super_student

  attr_reader :fio, :contact 

  # Конструктор класса из объекта Student
  def self.initialize_from_student(student)
    new(
      id: student.id,
      fio: "#{student.last_name} #{student.first_name[0]}.#{student.patronymic[0]}.",
      git: student.git,
      contact: student.contact_info == 'Нет контакта' ? nil : student.contact_info
    )
  end

  def self.initialize_from_string(id, info_string)
    fio, git_part, contact = info_string.split(', ')
  
    new(
      id: id,
      fio: fio,
      git: (git_part.sub('Git: ', '') unless git_part.sub('Git: ', '') == 'нет'), 
      contact: (contact unless contact == 'Нет контакта')
    )
  end

  def to_s()
    "ID: #{@id}, ФИО: #{@fio}, Git: #{@git ? @git : 'нет'}, Контакт: #{@contact ? @contact : 'нет'} \n"
  end

  private_class_method :new

  def initialize(id:, fio:, git:, contact:)
    super(id: id.to_s.strip, git: git)
    @fio = fio
    @contact = contact
  end

end