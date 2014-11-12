class RemindMailer < ActionMailer::Base
  default from: "dohistory@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.remind_mailer.reminder_mail.subject
  #
  def reminder_mail(user, description)
    @user = user
    @description = description

    mail to: user.email, subject: "REMINDER: Task for today"
    
  end
end
