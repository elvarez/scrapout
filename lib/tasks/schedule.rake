namespace :schedule do

  task miss_items: :environment do
    Item.where("deadline <= ? AND done = ?", Time.now, false).update_all(missed: true)
  end

  task remind_items: :environment do
    items = Item.where("remind = ? AND deadline <= ?", true, (Date.tomorrow))
    items.each do |it|
      if RemindMailer.reminder_mail(it.user, it.description).deliver
        it.update_column(:remind, false)
      end
    end
  end

  task update_reports: :environment do
    report = CalcStats.new
    report.update_active_days
    report.update_idle_days
    report.productivity_ratio
  end

end
