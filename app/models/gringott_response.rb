class GringottResponse
  attr_accessor :successful, :body, :message
  def initialize(is_good=true, body={})
    @successful = is_good
    @body = body
  end

  def success?
    self.successful
  end
end