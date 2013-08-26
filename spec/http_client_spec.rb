require 'spec_helper'

describe Testing::HttpClient do

  let(:http_client) { Testing::HttpClient.new }
  let(:url) { 'http://foo.com' }

  describe 'when there is no simulated response for an url' do

    it 'raises an error informing that no response was found for the url' do
      expect { http_client.get url }.to raise_error(RuntimeError, Testing::HttpClient.no_simulated_response_error_message_for(url))
    end

  end

  describe :simulate_error_raised_for do

    it 'raises a RuntimeError with the provided error message' do
      error_message = "Houston, we'd had a problem"

      http_client.simulate_error_raised_for url, error_message

      expect { http_client.get url }.to raise_error(RuntimeError, error_message)
    end

    it 'raises the object provided to simulate the response' do
      error = StandardError.new "Houston, we'd had a problem"

      http_client.simulate_error_raised_for url, error

      expect { http_client.get url }.to raise_error(error)
    end

  end

  describe :simulate_successful_response_for do

    it 'returns a successful http response with the provided body' do
      http_client.simulate_successful_response_for url, 'hello'

      response = http_client.get url

      response.code.should == '200'
      response.body.should == 'hello'
    end

  end

  describe :simulate_failed_response_for do

    it 'returns a failed http response with the provided body' do
      http_client.simulate_failed_response_for url, 'hello'

      response = http_client.get url

      response.code.should == '500'
      response.body.should == 'hello'
    end

  end

end