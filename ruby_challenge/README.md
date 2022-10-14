# Context
We are a shipping container booking company, our customers send us containers of different weight/type (example: REEFER20, DRY40). We need to save the containers received via the api as well as any changes to them. When the status of the containers changes to `:ready` it indicates that the container can be loaded on the vessel. Then, asynchronously, we calculate the total weight on the vessel being loaded and check if the loading limit has not been reached, if not, then the container can be loaded and its status changes to `:stuffed` In this case, we send an email to the customer, to inform him that his container has been loaded. If there are no more vessels available at the departure of the day, then we inform the customer that his container will be loaded the next day.

## First step
Create the resource and apis needed to process the containers. You have free rein on the modeling and implementation. All the information you need is listed in this Readme and present in the project. Surprise us!

## Second step (optional)
Process asynchronously, containers that go from `pending` to `ready` state

## Third step (optional)
We have a special validation concerning the container numbers, they must be 10 characters long and must be a succession of uppercase letters and odd numbers

# What is provided in the project
- Rails api-only pre-configured (auth, spec...)
- User and Vessel models

![database](resources/database.png)

## Constants
```ruby
Containers::STATES  # List of possible states
Containers::TYPES   # List of possible types (DRY, REEFER...)
Containers::SIZES   # List of possible sizes (20, 40...)
Containers::WEIGHTS # Mapping between type/size and weigth
```

## Mailers
```ruby
StuffingMailer.stuffed_today(container)             # To notify user for today stuffing
StuffingMailer.will_be_stuffed_tomorrow(container)  # To notify user for tomorrow
```

## Models
```ruby
User
# {
#   "id"=>1,                                                                           
#   "email"=>"test1234@gmail.com",                                                     
#   "encrypted_password"=>"$2a$12$TZPHyGPf/kz2fSwByNE0XufK6p7mH7EYR9LIoqHGvKSiV/GRPjqZu",
#   "reset_password_token"=>nil,                                                       
#   "reset_password_sent_at"=>nil,                                                     
#   "remember_created_at"=>nil,                                                        
#   "created_at"=>Mon, 10 Oct 2022 13:02:19.350018000 UTC +00:00,                      
#   "updated_at"=>Mon, 10 Oct 2022 13:02:19.350018000 UTC +00:00,                      
#   "jti"=>nil
# }

Vessel
# {
#   "id"=>1,                                                            
#   "name"=>"Lynch, Quigley and Heaney",                                
#   "kg_weight_limit"=>12500000,                                        
#   "full"=>false,                                                      
#   "departure"=>Mon, 10 Oct 2022 16:00:00.000000000 UTC +00:00,        
#   "created_at"=>Mon, 10 Oct 2022 13:02:20.383611000 UTC +00:00,       
#   "updated_at"=>Mon, 10 Oct 2022 13:02:20.383611000 UTC +00:00
# }
```

# Setup

```shell
git clone git@github.com:buyco/hiring_challenges.git
cd hiring_challenges/ruby_challenge
make setup_and_start # or docker compose up -d --build && docker compose logs -f --tail=100

# Happy challenge!
```
**Server on**
http://localhost:3000/health