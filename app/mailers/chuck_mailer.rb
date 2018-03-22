class ChuckMailer < ApplicationMailer
	default from: 'manutazo4@gmail.com'
 
  def newsletter(email, data)
    @email = email
    @data = data
    mail(to: email, subject: 'Welcome to My Awesome Site')
  end
end
