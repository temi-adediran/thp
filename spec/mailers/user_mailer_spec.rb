require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "password_reset" do
    let!(:user) { create(:user) }
    let(:mail) { UserMailer.password_reset(user) }

    before do
      user.send_password_token!
    end

    it "renders the headers" do
      expect(mail.subject).to eq("Password Reset")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["info@thehavennation.org"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("To reset your password,")
    end
  end

end
