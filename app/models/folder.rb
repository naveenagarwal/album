class Folder < ActiveRecord::Base
  #######################
  # constants
  #######################

  #######################
  # attribute accessors
  #######################

  #######################
  # attribute accessibles
  #######################
  attr_accessible :user, :user_id, :name, :photos_attributes

  #######################
  # Associations
  #######################
  belongs_to  :user
  has_many    :photos, dependent: :destroy
  ##########################
  # accept nested attrubutes
  ##########################
  accepts_nested_attributes_for :photos, reject_if: lambda { |obj| obj[:pic].blank? }

  #######################
  # Validations
  #######################
  validates :name,  presence:     { message: "Can't be blank" }
  validates :name,  uniqueness:   { scope: :user_id }
  validates :user,  presence:     { message: "Can't be blank" }

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
