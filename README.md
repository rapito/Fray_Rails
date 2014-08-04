#Fray Ramón Pané Academic System

The code can be found here:

https://github.com/rapito/Fray_Rails

Description
--------------

The Fray Academic System is designed to manage the basic entities of a school academic system. It was based on Fray Ramón Pané's School need to implement a new system. The basic functionalities allows the users to personalize at some point the Lectures and groups within the scope of their need.

Also, the application is a final project for INTEC's Ruby on Rails class
(MAY-JUL 2013) by Josue Abreu. http://joshonrails.com/

What's new?
--------------

- Showing of Top 10 Students whe managing Groups and Lectures
- Added MetaScore to the Grade system
- Student Assignments were changed now to groups.
- Added Pagination on most listings.
- Added validations for most models
- Rake task db:migration:faker to fill most models and reset the database.
- Partial Spanish/English Locale configuration
- Document Modification: Formulas
- Support for .json models reports retrieval
- Devise Authentication
- Addded custom grade scoring system

On the Roadmap

- Use cancan for Authorization
- Managing roles in app
- Completing Spanish and English locales
- Adding view for student's overall perfomance
- Reports for Students overall perfomance
- Add functionality to add user pictures
- Roles management for users


Note: Fray Academic System was developed using Rubymine as IDE on windows with a modded mysql2 gem to support the development environment.

If you are planning to use a different database please be aware there is no troubleshoting support.

Dependencies
--------------

- ruby 3.0.2
- spreadsheet 0.8.6 https://github.com/zdavatz/spreadsheet
- jbuilder
- rails-i8n
- will_paginate ~> 3.0
- jquery-rails
- faker (optional)

Installation
--------------

Having your database up and running, bundle install on the application root folder.
Rake db:migrate:faker to execute the migration and fill up the tables for testing.
rails server and you know the drill.

Authors
--------------

Original Code:
--------------

Fray Academic System: Copyright (c) 2013 by Robert Peralta (rapito@gmail.com)


Dependencies:
--------------

- Spreadsheet::Excel: Copyright (c) 2005 by Daniel J. Berger (djberg96@gmail.com)

- Faker: Pete Yandell (pete@notahat.com)

- Will Paginate: Copyright (c) 2009 Mislav Marohnic

- jbuilder: Copyright (c) 2011 David Heinemeier Hansson, 37signals

- rails-i8n: Copyright (c) 2008-2012 Sven Fuchs and contributors (see https://github.com/svenfuchs/rails-i18n/contributors)

License
--------------

Please see the LICENSE[https://github.com/rapito/Fray_Rails/LICENSE.txt] file.
