module ContactUs
  class Contact
    include ActiveModel::Conversion
    include ActiveModel::Validations

    attr_accessor :email, :message, :name, :subject

    validates :email,   :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                        :presence => true
    validates :message, :presence => true
    validates :name,    :presence => {:if => Proc.new{ContactUs.require_name}}
    validates :subject, :presence => {:if => Proc.new{ContactUs.require_subject}}

    def initialize(attributes = {})
      attributes.each do |key, value|
        send("#{key}=", value)
      end
    end

    def save
      if valid?
        deliver
        return true
      end
      false
    end

    def persisted?
      false
    end

    protected

    def deliver
      ContactUs.delayed_delivery ? deliver_later : deliver_now
    end

    def deliver_now
      ContactMailer.contact_email(self).deliver_now
    end

    def deliver_later
      ContactMailer.delay(queue: ContactUs.delayed_delivery_queue).contact_email(self)
    end
  end
end
