# == Schema Information
# Schema version: 20101017153103
#
# Table name: users
#
#  id          :integer(4)      not null, primary key
#  screen_name :string(255)
#  email       :string(255)
#  password    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class User < ActiveRecord::Base
  validates_uniqueness_of :screen_name, :email   ### ensure no duplicates
  validates_length_of      :screen_name, :within => 4..20
  validates_length_of      :password, :within => 4..40
  validates_length_of     :email, :maximum => 50
  validates_presence_of   :email

  validates_format_of :screen_name,
                      :with => /^[A-Z0-9_]*$/i,
                      :message => "must contain only letters, numbers or underscores"
  validates_format_of :email,
                      :with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i,
                      :message => "must be valid email address"

  def validate
    errors.add(:email, "email not valid format") unless email.include?("@")
    if screen_name.include?(" ")
      errors.add(:screen_name, "Cannot have spaces in screen name")
    end
  end

end
