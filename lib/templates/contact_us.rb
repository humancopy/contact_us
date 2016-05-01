# Use this hook to configure contact mailer.
ContactUs.setup do |config|

  # ==> Mailer Configuration

  # Configure the e-mail address which email notifications should be sent from.  If emails must be sent from a verified email address you may set it here.
  # Example:
  # config.mailer_from = "contact@please-change-me.com"
  config.mailer_from = nil

  # Configure the e-mail address which should receive the contact form email notifications.
  config.mailer_to = "contact@please-change-me.com"

  # Set to true to use a delayed delivery (sidekiq, Resque...).
  # config.delayed_delivery = false

  # ==> Form Configuration

  # Configure the form to ask for the users name.
  config.require_name = false

  # Configure the form to ask for a subject.
  config.require_subject = false

  # Configure the form gem to use.
  # Example:
  # config.form_gem = 'formtastic'
  config.form_gem = nil

  # Mount the routes automatically
  config.mount_point = '/contact-us'

  # Configure the redirect URL after a successful submission
  config.success_redirect = '/'

  # Configure the parent action mailer
  # Example:
  # config.parent_mailer = "ActionMailer::Base"

end