module ApplicationLoader
  extend self

  def load_app!
    init_config
    require_app
    init_settings
  end

  private

  def init_settings
    require_file 'config/initializers/config'
    require_dir 'config/initializers'
  end

  def init_config
    require_file 'config/application'
  end

  def require_app
    require_dir 'app'
  end

  def require_file(path)
    require File.join(root, path)
  end

  def require_dir(path)
    path = File.join(root, path)
    Dir["#{path}/**/*.rb"].each { |file| require file }
  end

  def root
    File.expand_path('..', __dir__)
  end
end
