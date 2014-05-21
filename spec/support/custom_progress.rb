require 'rspec/core/formatters/progress_formatter'

class CustomProgressFormatter < RSpec::Core::Formatters::ProgressFormatter
  def example_passed(example)
    @output.print "\u{00b7}"
  end

  def example_pending(example)
    @output.print '_'
  end

  def example_failed(example)
    @failed_examples << example
    @output.print failure_color("\u{2717}")
  end
end

class SingleLineProgressFormatter < RSpec::Core::Formatters::ProgressFormatter
  def example_passed(example)
    @output.print success_color("\u{2714}  #{example.full_description}\n")
  end

  def example_pending(example)
    @output.print pending_color("\u{2755}  #{example.full_description}\n")
  end

  def example_failed(example)
    @failed_examples << example
    @output.print failure_color("\u{2717}  #{example.full_description}\n")
  end
end