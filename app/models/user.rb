class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :attendee
  has_one :instructor
  attr_accessor :attendee_id, :instructor_id
  alias_attribute :user_id, :attendee_id


  def fullname
    "#{first_name} #{last_name}"
  end

end
