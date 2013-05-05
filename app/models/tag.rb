class Tag < ActiveRecord::Base
  #######################
  # constants
  #######################

  #######################
  # attribute accessors
  #######################

  #######################
  # attribute accessibles
  #######################
  attr_accessible :name

  #######################
  # Associations
  #######################
  has_many :taggings
  has_many :photos, through: :taggings

  ##########################
  # accept nested attrubutes
  ##########################

  #######################
  # Validations
  #######################
  validates :name, presence: { message: "Can't be blank" }

  before_validation :squish_fields

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

    def squish_fields
      self.name.squish! if name.present?
    end

end
