# frozen_string_literal: true

Rails.logger.info { 'Start seeding!' }

# Users
users = [
  { email: 'test1234@gmail.com', password: 'test1234' }
]
User.create!(users)

# Vessels
vessels = [
  { name: Faker::Company.name, kg_weight_limit: 12_500_000, departure: Date.today.to_time.change(hour: 16) },
  { name: Faker::Company.name, kg_weight_limit: 20_500_000, departure: Date.tomorrow.to_time.change(hour: 16) },
  { name: Faker::Company.name, kg_weight_limit: 38_000_000, departure: Date.tomorrow.to_time.change(hour: 18) }
]
Vessel.create!(vessels)

Rails.logger.info { 'Seeding done!' }
