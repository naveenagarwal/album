class Tagging < ActiveRecord::Base
  #######################
  # constants
  #######################

  #######################
  # attribute accessors
  #######################

  #######################
  # attribute accessibles
  #######################
  attr_accessible :tag, :photos

  #######################
  # Associations
  #######################
  belongs_to :tag
  belongs_to :photo

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
