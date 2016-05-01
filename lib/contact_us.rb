require 'contact_us/engine'

module ContactUs
  # Address ContactUs email notifications are sent from.
  mattr_accessor :mailer_from

  # Address to send ContactUs email notifications to.
  mattr_accessor :mailer_to

  # Enable or Disable delayed delivery.
  mattr_accessor :delayed_delivery

  # The name of the queue for delayed delivery.
  mattr_accessor :delayed_delivery_queue

  # Enable or Disable name field.
  mattr_accessor :require_name

  # Enable or Disable subject field.
  mattr_accessor :require_subject

  # Formtastic or SimpleForm
  mattr_accessor :form_gem

  # Mount the routes automatically
  mattr_accessor :mount_point

  # URL after a successful submission
  mattr_accessor :success_redirect

  # Configure parent mailer
  mattr_accessor :parent_mailer
  @@parent_mailer = "ActionMailer::Base"

  # Default way to setup ContactUs. Run rake contact_us:install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end
end