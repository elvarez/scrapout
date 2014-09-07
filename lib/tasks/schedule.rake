namespace :schedule do

task miss_items: :environment do
  Item.where("deadline <= ? AND done = ?", Time.now, false).update_all(missed: true)
end

end