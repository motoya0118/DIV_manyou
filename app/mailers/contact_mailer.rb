class ContactMailer < ApplicationMailer
  def contact_mail(contact, tasks)
    @contact = contact
    @tasks = tasks
    mail to: @contact.email, subject: "期限間近のタスクについて"
  end
end
