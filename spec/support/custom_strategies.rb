class JsonStrategy
  attr_reader :strategy

  def initialize
    @strategy = FactoryGirl.strategy_by_name(:create).new
  end

  delegate :association, to: :strategy

  def result(evaluation)
    @strategy.result(evaluation).to_json
  end
end