# Insight

Rails engine to access support requests and knowledge base articles stored in FatFree CRM. 

## Installation

Firstly install the insight plugin within you FatFree CRM installation.

Then add insight to your applications dependencies. Currently the generators only support Rails 2.
    
For those using bundler

    gem "insight_rails", :require => "insight"
    
Otherwise add to your environment.rb

    gem.config "insight_rails", :lib => "insight"
  
Make sure your development/production database exists and that you have a user model, then run the generator:
  
    script/generate insight
    
Now run the generated migration to add the crm_id field to your users table. 

An initializer is added, and in this file you need to update the details of your product api_key (from FatFree), FatFree's api url and your recaptcha keys.

Finally a rake file is added to lib/tasks. This will help migrate an existing users you have in your application to contacts within FatFree. Depending on the fields your user model has you may need to edit this to suit.

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

The app had a default stylesheet included. This is formatted using Sass so ensure your app has Sass installed.
    
## Copyright

Copyright (c) 2010 Kieran Johnson. See LICENSE for details.