class SecurityApi
  def self.action(status)
    method = status.gsub("ed", "").to_sym
    resp   = self.send(method)

    resp.code
  end

  def self.status
    uri = URI("#{host}/status")

    res = connect(uri) { |http| get_request(uri, http) }
    res.body.chomp
  end

  private

  def self.arm
    uri = URI("#{host}/arm")

    connect(uri) { |http| get_request(uri, http) }
  end

  def self.disarm
    uri = URI("#{host}/disarm")

    connect(uri) { |http| get_request(uri, http) }
  end

  def self.connect(uri, &block)
    Net::HTTP.start(
      uri.hostname,
      uri.port,
      use_ssl: true,
      verify_mode: OpenSSL::SSL::VERIFY_NONE,
      &block
    )
  end

  def self.get_request(uri, connection)
    req = Net::HTTP::Get.new(uri)
    req.basic_auth(user, pass)

    connection.request(req)
  end

  def self.user
    'user'
  end

  def self.pass
    'pass'
  end

  def self.host
    'host'
  end
end
