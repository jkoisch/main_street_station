require 'rspec/core/formatters/console_codes'

class CustomProgressFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_pending, :example_failed, :start_dump

  def initialize(output)
    @output = output
  end

    # TODO - Convert to RSpec 3
  def example_passed(example)
    @output.print "\u{00b7}"
  end

  def example_pending(example)
    @output.print '_'
  end

  def example_failed(example)
    @output.print failure_color("\u{2717}")
  end

  def start_dump(notification)
    @output.puts
  end
end

class SingleLineProgressFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_pending,
                                   :example_failed, :dump_failures, :dump_summary

  include RSpec::Core::Formatters::ConsoleCodes

  def initialize(output)
    @output = output
  end

  def example_passed(notification)
    @output.print RSpec::Core::Formatters::ConsoleCodes.wrap("\u{2714}  #{notification.example.full_description}\n", :success)
  end

  def example_pending(notification)
    @output.print RSpec::Core::Formatters::ConsoleCodes.wrap("\u{2755}  #{notification.example.full_description}\n", :pending)
  end

  def example_failed(notification)
    @output.print RSpec::Core::Formatters::ConsoleCodes.wrap("\u{2717}  #{notification.example.full_description}\n", :failure)
  end

  def dump_failures(notification)
    return if notification.failure_notifications.empty?
    @output.puts notification.fully_formatted_failed_examples
  end

  # @param summary [SummaryNotification] containing duration, example_count,
  #                                      failure_count and pending_count
  def dump_summary(summary)
    @output.puts summary.fully_formatted
  end

  def start_dump(notification)
    @output.puts
  end
end

class Nc
  RSpec::Core::Formatters.register self, :dump_summary

  def initialize(output)
    @output = output
  end

  def dump_summary(summary)
    body = []
    body << "Finished in #{_format_duration summary.duration}"
    body << _summary_line(summary.example_count, summary.failure_count, summary.pending_count)

    name = File.basename(File.expand_path '.')

    title = if summary.failure_count > 0
              "\u26D4 #{name}: #{summary.failure_count} failed example#{summary.failure_count == 1 ? nil : 's'}"
            else
              "\u2705 #{name}: Success"
            end

    say title, body.join("\n")
  end

  private

  def say(title, body)
    TerminalNotifier.notify body, :title => title
  end

  def _format_duration(duration)
    if respond_to? :format_duration
      format_duration duration
    else
      require 'rspec/core/formatters/helpers'
      RSpec::Core::Formatters::Helpers.format_duration duration
    end
  end

  def _summary_line(example_count, failure_count, pending_count)
    if respond_to? :summary_line
      summary_line(example_count, failure_count, pending_count)
    else
      RSpec::Core::Notifications::SummaryNotification.new(
          nil,
          SizeResponder.new(example_count),
          SizeResponder.new(failure_count),
          SizeResponder.new(pending_count),
          nil
      ).totals_line
    end
  end

  SizeResponder = Struct.new(:size)
end