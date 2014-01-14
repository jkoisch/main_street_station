class Logger::SimpleFormatter
  def call(severity, time, progname, msg)
    "[#{severity}][#{time}] #{msg}\n"
  end
end