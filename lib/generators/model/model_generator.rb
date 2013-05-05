class ModelGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :attributes, :type => :array, :default => [], :banner => "field[:type][:index] field[:type][:index]"
  hook_for :orm, :required => true

  def create_model_files
    template 'model.rb', File.join('app/models', class_path, "#{file_name.underscore}.rb")
  end

end
