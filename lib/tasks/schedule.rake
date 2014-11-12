namespace :schedule do

  task miss_items: :environment do
    Item.where("deadline <= ? AND done = ?", Time.now, false).update_all(missed: true)
  end

  task remind_items: :environment do
    Item.where("remind = ? AND deadline <= ?", true, (Date.tomorrow)).find_each do |it|
      RemindMailer.reminder_mail(it.user, it.description).deliver
      it.update(remind: false)
    end
  end

end
