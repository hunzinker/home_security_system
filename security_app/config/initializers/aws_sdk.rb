creds = YAML.load_file(
  File.expand_path('../../paperclip_storage.yml', __FILE__)
)["common_s3_information"]

ENV["AWS_ACCESS_KEY_ID"] = creds[:access_key_id]
ENV["AWS_SECRET_ACCESS_KEY"] = creds[:secret_access_key]
