
Developer Challenge
###################

Thanks for taking the time to take our developer challenge!

The main goal of the exercise is to have an idea of how you reason and approach problems.

We're also interested in the way that you structure your code.

Provide all source code, including database definitions.

What we value:

**Code Clarity**
  Since code is more often read than written, it should be easy to understand.

  Don't:
    Be unnecessarily terse or "clever", esoteric language constructs have their
    place but in most cases are more of a distraction than anything else.
  Do:
    Name things properly, add comments where needed, structure and organize functions,
    keep line and function complexity low.

**Simplicity**
  The code and the architecture should be as simple as possible to get the job done.

  Don't:
    Add unnecessary layers of abstraction
  Do:
    Make things as simple as possible

**Resilience**
  A service should be able to gracefully handle various common problems such as:

  * Invalid input
  * Network problems
  * Invalid database operations
  * ...

.. note::

  Please read all the way through the document before starting!


Introduction
============

An outside source sends us boxes::

  {
    "id": number,
    "type": (cardboard|wood|metal),
    "locked": boolean,
    "height": number,
    "width": number,
    "depth": number,
    "contents": string,
    "origin": {
      "line1": string,
      "line2": string,
      "city": string,
      "state": string,
      "postal_code": string,
      "country": ISO_3166_alpha3
    }
  }

Multiple boxes may come from the same origin address.

All information is mandatory.


Level 1 (junior)
================

We just need to store the box information.

Create an API to receive all boxes and store them.

You must use the latest version of one of the following programming languages:

* Python
* Ruby
* Go

Storage must be done in a `PostgreSQL` database.

The use of "do everything for you" type frameworks (Django, Rails, etc) is not allowed.

You should strive to have a minimum of dependencies.
This doesn't mean coding anything not in the standard library yourself,
but installing a 600 file library to use 2 functions is frowned upon.
Use your best judgement.

Validation
----------
The solution will be evaluated by sending a bunch of boxes through the API and
making sure they are recorded in the database.


Level 2 (intermediate)
======================

We need to do some processing on the boxes.

Modify the logic so that we store the volume of each metal box (based on what is sent through the API).
The volume must be stored in a separate table from the main data.

Writing the data and processing the data must be done in parallel, or concurrently, or asynchronously.
This using the most recent recommended method for the chosen language.

Validation
----------
The solution will be evaluated by sending a bunch of boxes through the API and making sure:

* every box is recorded in the database
* the volume of every metal box is recorded in the database


Level 3 (senior)
================

We now need to scale our product.

Split the recording and processing functionalities into micro-services.

The API service will record all the incoming boxes in a database.

Another service will calculate the volume and record it in a database.

The two services must not communicate using `ReST` nor `SOAP`.

You may use a 3rd party application for service communication (`RabbitMQ`, `Redis`, etc), **OR** any other protocol (`gRPC`, `Cap'n Proto`, etc).

Validation
----------
Must be functionally identical to level 2.


Ops Bonus (all levels)
======================

Provide a fully working project with a `docker-compose` file that runs everything automatically.
