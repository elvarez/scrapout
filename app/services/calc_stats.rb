class CalcStats
  def update_active_days
    User.all.each do |user|
      streak = 0
      date = Date.today - 1.day
      items = user.items.where(done: true).sort_by(&:updated_at)
      items.each do |item|
        if item.updated_at == date
          streak += 1
          date -= 1.day
        end
      end
      user.report.update_column(:active_days, streak)
    end

  end
  
  def update_idle_days
    User.all.each do |user|
      idle_time = (Date.today - user.items.where(done: true).sort_by(&:updated_at).last.updated_at.to_date).to_i
      
      user.report.update_column(:idle_days, idle_time)
    end  
  end

  def productivity_ratio
    User.all.each do |user|
      week_items = user.items.where('deadline < ? AND deadline > ?', Date.today, (Date.today - 7.days))
      done = week_items.select { |item| item.done }.count
      created = week_items.count
      if created == 0
        ratio = 0
      else
        ratio = done / created
      end
      user.report.update_column(:prod_ratio, ratio)
    end
  end
end
