require_relative 'course'

class Student

  attr_reader :first_name, :last_name, :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def enroll(course)
    unless already_enrolled?(course)
      raise "Conflict on time and day" if has_time_conflict?(course)
      @courses << course
      course.students << self
    end
  end

  def course_load
    loads = Hash.new(0)
    @courses.each do |course|
      loads[course.department] += course.credits
    end
    loads
  end

  private

  def already_enrolled?(course)
    @courses.include?(course) || course.students.include?(self)
  end

  def has_time_conflict?(course)
    @courses.any? do |course_enrolled|
      course.conflicts_with?(course_enrolled)
    end
  end

end
