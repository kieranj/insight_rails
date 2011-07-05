# Insight

Rails engine to access support requests and knowledge base articles stored in FatFree CRM. 

**Please Note - Since version 0.3.0 support for Rails 2.x has been dropped.**

## Installation

Firstly install the [insight](https://github.com/kieranj/insight "Insight") plugin within you FatFree CRM installation.

Then add insight_rails to your applications Gemfile.

    gem "insight_rails", :require => "insight"
    
Make sure your development/production database exists and that you have a user model, then run the generator:
  
    rails g insight:install
    
Now run the generated migration to add the crm_id field to your users table. 

An initializer is added, and in this file you need to update the details of your product api_key (from FatFree), FatFree's api url and your recaptcha keys.

A rake file is included to help migrate an existing users you have in your application to contacts within FatFree. Depending on the fields your user model has you may need to edit this to suit.

To run the rake task

    rake insight:generate_crm_contacts

## Usage

You will now have a knowledge base of articles from your FatFree installation available at:

/knowledge

You will also have a support page available at:

/help

Discussions can be viewed at:

/help/browse

This will pull through the issue_categories you setup in FatFree.

## Style

The app had a default layout and stylesheet included. This is formatted using Sass and is copied to your applications app/assets/stylesheets folder.
    
## Copyright

Copyright (c) 2010 Kieran Johnson. See LICENSE for details.