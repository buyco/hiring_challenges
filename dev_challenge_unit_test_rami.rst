
Developer Challenge
###################

Provide all source code, including database definitions.
Logic code will be unit tested. (The functionnal test is not necessary).

The most important is the quality of code and the separation of concerns.

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


Level 1 (junior)
================

We just need to store the box information.

Create an API to receive all boxes and store them.

You must use one of the following programming languages:

* Go
* Ruby
* Node
* Python

Storage must be done in a PostgreSQL database.

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


Validation
----------
The solution will be evaluated by sending a bunch of boxes through the API and making sure:

* every box is recorded in the database
* the volume of every metal box is recorded in the database


Level 3 (senior)
================

We now need to scale our product.

Split the recording and processing functionalities into micro-services.

The API service will record all the incoming boxes in the database.

Another service will calculate the volume and record it in the database.

The two services must _not_ communicate using `REST` nor `SOAP`.

You may use a 3rd party application for service communication, or any other protocol.

Validation
----------
Must be functionally identical to level 2.


Level 4 (bonus)
================

Provide a fully working project with a docker-compose file that runs everything automagically.
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTMyMzg1OTczNV19
-->
