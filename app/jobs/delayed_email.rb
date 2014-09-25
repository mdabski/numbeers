class DelayedEmail
  include SuckerPunch::Job

  def perform(mailer, options = {})
    raise NoMailerMethodGivenError if options[:method].nil?

    mailer.send(options[:method], *options[:args]).deliver
  end
end

class NoMailerMethodGivenError < StandardError
end