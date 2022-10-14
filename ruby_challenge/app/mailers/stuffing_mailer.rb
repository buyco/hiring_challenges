# frozen_string_literal: true

class StuffingMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.stuffing_mailer.stuffed_today.subject
  #
  def stuffed_today(container)
    mail to: container.user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.stuffing_mailer.will_be_stuffed_tomorrow.subject
  #
  def will_be_stuffed_tomorrow(container)
    mail to: container.user.email
  end
end
