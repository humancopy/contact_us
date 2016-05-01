module ContactUs
  module ContactsHelper
    def method_missing(method, *args, &block)
      method.to_s =~ /_(path|url)$/ && main_app.respond_to?(method) ? main_app.send(method, *args) : super
    end
  end
end
