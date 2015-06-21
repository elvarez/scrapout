every 1.day, :at => '1:10 am' do
  rake "schedule:miss_items"
  rake "schedule:remind_items"
  rake "schedule:update_reports"
end


