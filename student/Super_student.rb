class Super_student

  attr_reader :id, :git

  def initialize(id:, git: nil)
    self.id = id
    self.git = git
  end

  # Проверка на корректность
  def self.valid_git?(git)
    git.match?(/\Ahttps:\/\/github\.com\/[a-zA-Z0-9_-]+(?:\/[a-zA-Z0-9_-]+(?:\.git)?)?\z/)
  end 

  def self.valid_id?(id)
    id.match?(/^\d+$/)
  end 

  def git=(new_git)
    if new_git.nil? || self.class.valid_git?(new_git)
      @git = new_git
    else
      raise ArgumentError, "Некорректный формат git"
    end
  end

  def id=(new_id)
    if new_id.nil? || self.class.valid_id?(new_id)
      @id = new_id
    else
      raise ArgumentError, "Некорректный формат id"
    end
  end

  def has_git? ()
    !(self.git == nil)
  end

  def git_info()
    has_git? ? "Git: #{git}" : "Git: нет"
  end

end