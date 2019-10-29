class ApplicationMailer < ActionMailer::Base
  default from: 'info@thehavennation.org'
  layout 'mailer'

  def self.inherited(subclass)
    subclass.prepend_view_path(Rails.root.join("app", "views", "mailers"))
  end
end
