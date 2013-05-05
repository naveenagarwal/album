class Photo < ActiveRecord::Base
  #######################
  # constants
  #######################

  #######################
  # attribute accessors
  #######################

  #######################
  # attribute accessibles
  #######################
  attr_accessible :folder_id, :pic, :tag_names

  #######################
  # Associations
  #######################
  belongs_to :folder,     counter_cache:  true
  has_many   :taggings,   dependent:      :destroy
  has_many   :tags,       through:        :taggings
  
  #######################
  # paperclip attributes
  #######################
  has_attached_file   :pic,
                      styles: { thumb: "100x100>" },
                      default_url: ""

  ##########################
  # accept nested attrubutes
  ##########################

  #######################
  # Validations
  #######################
  validates_attachment_presence     :pic, message: "Can't be blank"
  validates_attachment_content_type :pic,  
                                    content_type: ["image/jpeg", "image/pjpeg", "image/png", "image/x-png", "image/gif", "image/bmp"],
                                    message:      'File type must be in .jpg .gif .png .bmp'
  #######################
  # Call backs
  #######################

  #######################
  # Class Methods
  #######################
  before_post_process :skip_for_non_image

  #######################
  #public methods
  #######################
  def tag_names
    tags.pluck(:name).join(", ")
  end

  def tag_names=(names)
    self.tags = names.split(",").map { |tag| Tag.where(name: tag.squish).first_or_create! }
  end

  ###################################
  # protected methods and call backs
  ###################################
  protected

  #######################
  # Private methods
  #######################
  private

    def skip_for_non_image
      unless pic_content_type =~ /image/
        errors.add(:pic, "^File type must be in .jpg .gif .png .bmp")
        return false
      end
    end

end
