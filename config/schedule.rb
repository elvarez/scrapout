every 1.day, :at => '11:50 am' do
  rake "schedule:delete_items"
end
