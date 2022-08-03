namespace :sample do
  desc "test"
  task test:  :environment do
    users = User.all
    users.each do |user|
      timenear_task = user.tasks.where("deadline BETWEEN ? AND ?", Time.zone.today - 3, Time.zone.today)
      timefails_task = user.tasks.where("deadline < ?", Time.zone.today)
      tasks = {timenear_task: timenear_task, timefails_task: timefails_task }
      if timefails_task.length > 0 || timenear_task.length > 0
        ContactMailer.contact_mail(user,tasks).deliver
      end
    end
    
  end
end
