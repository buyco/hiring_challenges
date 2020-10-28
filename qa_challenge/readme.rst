QA Challenge
############

Thanks for taking the time to take our QA challenge!

The main goal of the exercise is to have an idea of how you reason and approach problems.

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

We need an API to receive all boxes and store them.

In addition, each box of ``type`` being ``metal`` has its volume calculated.


Validation
----------
The solution will be evaluated by sending a bunch of boxes through the API and making sure:

* every box is recorded in the database
* the volume of every metal box is recorded in the database


QA Challenge
============

Analyse the two provided implementations of the API.

Automated Tests
---------------

Ensure that all functional requirements are met by connecting to the API and database as needed.

These tests must be **automated**, please provide a script we can run.

You can use any programming language, and/or any open-source tool for this script.

Report
------

Furthermore, we are also interested in how well each implementation handles common problems such as:

* Invalid input
* Network problems
* Attacks
* ...

For these we are looking for a report, not an automated test.

Simply list any potential problems you have found for each implementation.
Reports must be in plain text file (``.txt``, ``.md``, ``.rst``, ...)

This can be achieved by any means, such as:

* testing on the API with ``Postman``, ``Swagger UI``, or other tools for API/ReST development
* examining the source code
* using automated testing tools such as ``OWASP Benchmark``
* ...

Please describe briefly, in English, the steps you took to analyse the code.
