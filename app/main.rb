require_relative "student"
require 'date'

st1 = Student.new("Chyp", "Yana", Date.new(2004, 11, 18))
st2 = Student.new("Mykytyn", "Orest", Date.new(2003, 11, 22))
st3 = Student.new("Ivanenko", "Ostap", Date.new(2005, 2, 2))
st4 = Student.new("Vernyhora", "Yana", Date.new(2004, 11,27))
# print Student.class_variable_get('@@students')

# p st1.equal?(st2)
Student.add_student(st2)
p Student.valid_date_of_birth!(Date.new(2004, 11, 18))
# print Student.class_variable_get('@@students')


# print Student.class_variable_get('@@students')
# Student.add_student(st1)
# Student.add_student(st3)
# Student.add_student(st4)
# print Student.class_variable_get('@@students')
# st2.remove_student(st1)
# print Student.class_variable_get('@@students')

p Student.get_students_by_age(19)
# p Student.get_students_by_name("Yana")
