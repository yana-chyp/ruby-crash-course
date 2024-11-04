require_relative "student"
require 'date'

st1 = Student.new("Chyp", "Yana", Date.new(2004, 11, 18))
st2 = Student.new("Mykytyn", "Orest", Date.new(2003, 11, 22))
st3 = Student.new("Ivanenko", "Ostap", Date.new(2005, 2, 2))
st4 = Student.new("Vernyhora", "Yana", Date.new(2004, 11,27))
# p st1.equal?(st2)
# st1.add_student(st2)
# print Student.class_variable_get('@@students')
# st2.add_student(st1)
# st2.add_student(st3)
# st2.add_student(st4)
print Student.class_variable_get('@@students')
# st2.remove_student(st1)
# print Student.class_variable_get('@@students')

# p st1.get_students_by_age(19)
# p st1.get_students_by_name("Yana")
