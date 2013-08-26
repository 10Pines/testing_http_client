class HttpResponse

  attr_reader :body, :code

  def initialize a_body, an_status_code
    @body = a_body
    @code = an_status_code
  end

end