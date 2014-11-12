require "rails_helper"

RSpec.describe RemindMailer, :type => :mailer do
  describe "reminder_mail" do
    let(:mail) { RemindMailer.reminder_mail }

    it "renders the headers" do
      expect(mail.subject).to eq("Reminder mail")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
