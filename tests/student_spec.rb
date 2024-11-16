
require "minitest/autorun"
require "minitest/spec"
require_relative 'test_helper'
require_relative "../app/student"


# describe Student do 
    describe "#initialize" do
        let(:student) {Student.new("Chyp", "Yana", Date.new(2004, 11, 18))}
        it "sets name and surname correctly" do
            expect(student.surname).must_equal "Chyp"
            expect(student.name).must_equal "Yana"
        end
        # GC.start

    end

    describe "#valid_date_of_birth!" do
        it "raises error if date in the future or today" do
            expect(Student.valid_date_of_birth!(Date.new(2025, 1, 1))).to raise_error 
            expect(Student.valid_date_of_birth!(Date.today)).to raise_error
        end
    end

    describe "@@students" do
        before do
            #error-prone because the instances still exist
            Student.class_variable_get('@@students').clear
        end
        it "must be empty" do
            expect(Student.class_variable_get('@@students')).must_be_empty
        end

        let(:student) {Student.new("Chyp", "Yana", Date.new(2004, 11, 18))}

        it "must contain student" do
            expect(Student.class_variable_get('@@students')).must_include student
        end

        it "must contain student exactly once" do
            expect(Student.class_variable_get('@@students').count(student)).must_equal 1
        end
        let(:student2) {Student.new("Chyp", "Yana", Date.new(2004, 11, 18))}
        it "must not contain equal by value" do
            expect(Student.class_variable_get('@@students').count(student2)).must_equal 1
        end

        after do
            Student.class_variable_get('@@students').clear
        end
    end

    describe "#equal?" do
        let(:st1) {Student.new("Chyp", "Yana", Date.new(2004, 11, 18))}
        let(:st2) {Student.new("Chyp", "Yana", Date.new(2004, 11, 18))}
        let(:st3) {Student.new("Chyp", "Yana", Date.new(2004, 11, 19))}
        it "must be equal" do
            expect(st1.equal?(st2)).must_equal true
        end
        it "must not be equal" do
            expect(st1.equal?(st3)).must_equal false
        end
    end

    describe " @@students.present?" do
        let(:student) {Student.new("Chyp", "Yana", Date.new(2004, 11, 18))}
        it "must be true" do
            expect(Student.present?(student)).must_equal true
        end
        it "must be false" do
            # p Student.class_variable_get('@@students')
            Student.class_variable_get('@@students').clear
            # p Student.class_variable_get('@@students')
            expect(Student.present?(student)).must_equal false
        end
    end

    describe "#calculate_age" do
        describe "date of birth yesterday" do
            let(:student) {Student.new("Chyp", "Yana", Date.new(Date.today.year, Date.today.month, Date.today.day-1))}
            it "#calculate_age" do
                # p student
                expect(student.calculate_age).must_equal 0
            end
        end 
    end

    describe "#self.add_student" do
        before do
            Student.class_variable_get('@@students').clear

        end
        it "must be clear" do
            expect(Student.class_variable_get('@@students')).must_be_empty
        end
        let(:student) {Student.new("Chyp", "Yana", Date.new(2004, 11, 18))}
        it "must contain student" do
            Student.add_student(student)
            expect(Student.class_variable_get('@@students')).must_include student
        end

    end

    describe "#self.remove_student" do
        before do
            Student.class_variable_get('@@students').clear
        end
        it "must be empty" do
            expect(Student.class_variable_get('@@students')).must_be_empty
        end
        let(:student) {Student.new("Chyp", "Yana", Date.new(2004, 11, 18))}
        it "must contain student" do
            expect(Student.class_variable_get('@@students')).must_include student
        end
        it "must not include student" do
            Student.remove_student(student)
            expect(Student.class_variable_get('@@students')).wont_include(student)
        end

    end

    describe "#self.get_students_by_age" do
        before do
            Student.class_variable_get('@@students').clear
        end
        let(:st1) {Student.new("Chyp", "Yana", Date.new(2004, 11, 18))}
        let(:st2) {Student.new("Ivanenko", "Ostap", Date.new(2005, 2, 2))}
        let(:st3) {Student.new("Mykytyn", "Orest", Date.new(2003, 11, 22))}
        
        it "must contain st1 and st2" do
            st1
            st2
            st3
            stByAge19 = Student.get_students_by_age(19)
            expect(stByAge19).must_include st1
            expect(stByAge19).must_include st2
        end
        it "must not include st3" do
            st1
            st2
            st3
            stByAge19 = Student.get_students_by_age(19)

            expect(stByAge19).wont_include st3
        end
    end

    describe "#self.get_students_by_name" do
        before do
            Student.class_variable_get('@@students').clear
        end
        let(:st1) {Student.new("Chyp", "Yana", Date.new(2004, 11, 18))}
        let(:st2) {Student.new("Ivanenko", "Ostap", Date.new(2005, 2, 2))}
        let(:st3) {Student.new("Mykytyn", "Yana", Date.new(2003, 11, 22))}
        
        it "must contain st1 and st2" do
            st1
            st2
            st3
            stByAge19 = Student.get_students_by_name("Yana")
            expect(stByAge19).must_include st1
            expect(stByAge19).must_include st3
        end
        it "must not include st3" do
            st1
            st2
            st3
            stByAge19 = Student.get_students_by_name("Yana")

            expect(stByAge19).wont_include st2
        end
    end
 
# end

