# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/stuffing
class StuffingPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/stuffing/stuffed_today
  def stuffed_today
    StuffingMailer.stuffed_today
  end

  # Preview this email at http://localhost:3000/rails/mailers/stuffing/will_be_stuffed_tomorrow
  def will_be_stuffed_tomorrow
    StuffingMailer.will_be_stuffed_tomorrow
  end
end
