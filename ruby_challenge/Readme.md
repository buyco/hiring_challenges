# Context
We are a shipping container booking company, our customers send us containers of different weight/type (example: REEFER20, DRY40). We need to save the containers received via the api as well as any changes to them. When the status of the containers changes to `:ready` it indicates that the container can be loaded on the vessel. Then, asynchronously, we calculate the total weight on the vessel being loaded and check if the loading limit has not been reached, if not, then the container can be loaded and its status changes to `:stuffed` In this case, we send an email to the customer, to inform him that his container has been loaded. If there are no more vessels available at the departure of the day, then we inform the customer that his container will be loaded the next day.

# What is provided in the project
- Rails api-only pre-configured (auth, spec...)
- User and Vessel models

![database](resources/database.png)

# Objective
Create an api to handle containers, as well as tasks related to loading and user notification.

Containers must have a unique identification number and a weight that cannot be greater than the limit of its category.

[Here is the list of possible containers](https://www.dsv.com/fr-fr/nos-solutions/modes-de-transport/fret-maritime/dimensions-de-conteneurs-maritimes):
- REEFER20 (27 400 kg)
- REEFER40 (27 700 kg)
- DRY20 (25 000 kg)
- DRY40 (27 600 kg)
- OPENTOP20 (28 130 kg)
- OPENTOP40 (26 630 kg)


Here is the list of possible states : `pending ready stuffed`