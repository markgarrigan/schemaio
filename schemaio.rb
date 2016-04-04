require "net/https"

class Schemaio
  ENDPOINT = "https://api.schema.io"

  VERB_MAP = {
    get: Net::HTTP::Get,
    post: Net::HTTP::Post,
    put: Net::HTTP::Put,
    delete: Net::HTTP::Delete
  }

  def initialize(id:, key:)
    @id = id
    @key = key
  end

  def get(path, params = {})
    request_json :get, path, params
  end

  def post(path, params = {})
    request_json :post, path, params
  end

  def put(path, params = {})
    request_json :put, path, params
  end

  def delete(path, params = {})
    request_json :delete, path, params
  end

  def login(email:, password:)
    request_json :get, '/accounts/:login', {email: email, password: password}
  end

private

  def uri
    @uri ||= URI.parse(ENDPOINT)
  end

  def http
    @http ||= begin
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http
    end
  end

  def request_json(method, path, params)
    response = request(method, path, params)
    response.body
  end

  def request(method, path, params = {})
    case method
    when :get
      full_path = encode_path_params(path, params)
      request = VERB_MAP[method.to_sym].new(full_path)
    else
      request = VERB_MAP[method.to_sym].new(path)
      request.set_form_data(params)
    end

    request.basic_auth(@id, @key)

    http.request(request)
  end

  def encode_path_params(path, params)
    encoded = URI.encode_www_form(params)
    [path, encoded].join("?")
  end

end
