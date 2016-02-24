class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :availabilities, dependent: :destroy
  has_many :faculty_teachers, dependent: :destroy
  has_many :faculties, through: :faculty_teachers
  has_many :course_teachers, dependent: :destroy
  has_many :courses, through: :course_teachers

  after_create :update_properties

  enum category: [:principal, :associated, :exclusive_dedication, :auxiliary]
  enum class_hours: {eight: 8, twenty: 20, fourty: 40}

  validate :validate_username
  validates :username, presence: true
  
  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
  	# Agregar OR lower(email) = :value en el caso de que el login sea tanto con username como con email (por si las pepes)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end


	def validate_username
	  if Teacher.where(email: username).exists?
	    errors.add(:username, :invalid)
	  end
	end

  def name
  	"#{first_name} #{last_name}"
  end

  def update_properties
    self.update(class_hours: Teacher.class_hours.keys.sample)
    case Teacher.class_hours[self.class_hours]
    when 8
      self.update(past_hours: 8)
    when 20
      self.update(past_hours: rand(14..20))
    when 40 
      self.update(past_hours: rand(14..20))
    end
    self.update(category: rand(0..3))
    FacultyTeacher.create(faculty_id: 1, teacher_id: self.id)
  end

  def hour_selected? col, row
    av = self.availabilities.find_by(day: col.to_i, start_time: (row.to_i + 8), end_time:(row.to_i + 9))
    av.blank? ? false : true
  end

end
