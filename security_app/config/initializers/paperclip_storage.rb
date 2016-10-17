PaperclipStorage = YAML.load_file(
  File.expand_path('../../paperclip_storage.yml', __FILE__)
)[Rails.env]
