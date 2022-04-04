class Bootcamp
    attr_reader :name, :slogan, :teachers, :students
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @students = []
        @teachers = []
        @grades = Hash.new {|hash, k| hash[k] = []}
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else
            return false
        end   
    end

    def enrolled?(stud)
        @students.include?(stud)
    end

    def student_to_teacher_ratio
        (@students.length / @teachers.length).to_i
    end

    def add_grade(student, number)
        if @students.include?(student)
            @grades[student] << number
            return true
        else
            return false
        end
    end 

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        if @grades[student].length == 0 || !@students.include?(student)
            return nil
        else
            return (@grades[student].sum  / @grades[student].length)
        end
    end
end
