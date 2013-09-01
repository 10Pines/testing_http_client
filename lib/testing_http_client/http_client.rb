require 'testing_http_client/http_response'

module Testing

  class HttpClient

    def self.no_simulated_response_error_message_for an_url
      "Hey, you forgot to simulate a response for #{an_url}"
    end


    def initialize
      @simulated_responses = {}
    end

    def get_response an_url
      validate_response_simulated_for an_url

      @simulated_responses[an_url].call
    end

    def validate_response_simulated_for an_url
      return if @simulated_responses.has_key?(an_url)

      fail self.class.no_simulated_response_error_message_for an_url
    end


    def simulate_error_raised_for an_url, an_error
      self.simulate_response_for(an_url) { fail an_error }
    end

    def simulate_successful_response_for an_url, a_response_body
      self.simulate_response_for(an_url) { successful_http_response a_response_body }
    end

    def simulate_failed_response_for an_url, a_response_body
      self.simulate_response_for(an_url) { failed_http_response a_response_body }
    end

    def simulate_response_for an_url, &response_block
      @simulated_responses[an_url] = response_block
    end


    def successful_http_response a_response_body
      build_http_response a_response_body, '200'
    end

    def failed_http_response(a_response_body)
      build_http_response a_response_body, '500'
    end

    def build_http_response a_response_body, an_http_status_code
      HttpResponse.new a_response_body, an_http_status_code
    end

  end

end