module ContactUs
  class ContactsController < ApplicationController

    def create
      @contact = Contact.new(params[:contact])

      if @contact.save
        redirect_to(ContactUs.success_redirect || '/', :notice => t('contact_us.notices.success'))
      else
        flash[:error] = t('contact_us.notices.error')
        render_new_page
      end
    end

    def new
      @contact = Contact.new
      render_new_page
    end

    protected

      def render_new_page
        case ContactUs.form_gem
        when 'formtastic'  then render 'new_formtastic'
        when 'simple_form' then render 'new_simple_form'
        else
          render 'new'
        end
      end
  end
end