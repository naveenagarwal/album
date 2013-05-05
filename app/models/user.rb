class User < ActiveRecord::Base
  #########################
  # Devise authentication
  #########################
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable

  #######################
  # constants
  #######################

  #########################
  # Attributes accessor
  #########################

  #########################
  # Attributes accessibles
  #########################
  attr_accessible :email, :password, :password_confirmation, :remember_me

  #########################
  # Associations
  #########################
  has_many :folders

  ##########################
  # accept nested attrubutes
  ##########################

  #######################
  # Validations
  #######################

  #######################
  # Call backs
  #######################

  #######################
  # Class Methods
  #######################

  #######################
  #public methods
  #######################

  ###################################
  # protected methods and call backs
  ###################################
  protected

  #######################
  # Private methods
  #######################
  private

end
