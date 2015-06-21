class ReportsController < ApplicationController
  def show
    @report = current_user.report

  end
end
