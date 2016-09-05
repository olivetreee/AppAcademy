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
    @courses.each do |course_enrolled|
      break unless course_enrolled.respond_to?(:days) #Some double test cases don't have #days
      course_enrolled.days.each do |day|
        return true if course.days.include?(day) && course_enrolled.time_block == course.time_block
      end
    end
    false
  end

end
