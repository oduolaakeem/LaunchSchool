class School
  def initialize
    @students = {}
  end
  
  def add(student_name, grade)
    if grade_exist?(grade)
      @students[grade] << student_name
    else
      @students[grade] = [student_name]
    end
    sort_students
  end
  
  def grade(number)
    grade_exist?(number) ? @students[number] : []
  end
  
  def to_h
    @students
  end
  
  private
  
  def grade_exist?(number)
    @students.keys.include?(number)
  end
  
  def sort_students
    sorted_students = {}
    @students.keys.sort.each do |grade|
      sorted_students[grade] = @students[grade].sort
    end
    @students = sorted_students
  end
end