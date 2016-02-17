class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :availabilities
  has_many :faculty_teachers

  validate :validate_username
  
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

end
