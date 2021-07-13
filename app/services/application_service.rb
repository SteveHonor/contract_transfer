module Services
  module ApplicationService
    def initialize *args
      response = Faraday.post("#{uri}/api/auth/login") do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = {
          document_number: '11111111101',
          password: 'cnsa@020459'
        }.to_json
      end
      
      @token = JSON.parse(
        response.body
      )["data"]["access_token"] || nil
    end

    private

    def post(endpoint: nil, params: {})
      response = Faraday.post("#{uri}/#{endpoint}") do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['Authorization'] = "Bearer #{@token}"
        req.body = params.to_json
      end

      JSON.parse(
        response.body
      )["data"]
    end

    def uri
      "https://api-princing-mapfre-b2fexhrvyq-rj.a.run.app"
    end
  end  
end
