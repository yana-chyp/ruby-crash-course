require 'date'

class Student 
  attr_accessor :surname
  attr_accessor :name
  attr_accessor :date_of_birth
  @@students = []

  def initialize(surname, name, date_of_birth)
    @surname = surname
    @name = name
    begin
      self.class.valid_date_of_birth!(date_of_birth)
      @date_of_birth = date_of_birth
    rescue ArgumentError => e
      puts e
      @date_of_birth = Date.new(2004, 11, 18)
    end
    unless self.class.present?(self) then @@students << self end
    
  end

  def self.valid_date_of_birth!(date_of_birth)
    if date_of_birth > Date.today
      raise ArgumentError, 'Date of birth cannot be in the future'
    end
  end

  def equal?(student)
    return @surname == student.surname && @name == student.name && @date_of_birth == student.date_of_birth
  end

  def self.present?(student)
    @@students.each {|other_student| 
      if other_student.equal?(student) then return true end}
      return false
  end

  def calculate_age()
    
    if Date.today > Date.new(Date.today.year, @date_of_birth.month, @date_of_birth.day)
      return Date.today.year - @date_of_birth.year
    else 
      return Date.today.year - @date_of_birth.year-1
    end
  end

  def self.add_student(student)
    unless Student.present?(student) then @@students << student end
  end

  def self.remove_student(student)
    if Student.present?(student) then @@students.delete(student) end
  end

  def self.get_students_by_age(age)
    @@students.select {|student| student.calculate_age == age}
  end

  def self.get_students_by_name(name)
    @@students.select {|student| student.name == name}
  end

end

