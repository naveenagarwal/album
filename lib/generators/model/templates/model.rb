class <%= class_name %> < ActiveRecord::Base
  #######################
  # constants
  #######################

  #######################
  # attribute accessors
  #######################

  #######################
  # attribute accessibles
  #######################
  attr_accessible <%= attributes.map { |a| ":#{a.name}" }.join(", ") %>

  #######################
  # Associations
  #######################

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
