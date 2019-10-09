class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def self.inherited(subclass)
    subclass.prepend_view_path(Rails.root.join("app", "views", "mailers"))
  end
end
