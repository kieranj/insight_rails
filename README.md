# Insight

Rails engine to access support requests and knowledge base articles stored in FatFree CRM. 

## Installation

Add insight to your applications dependencies. Currently the generators only support Rails 2.
    
For those using bundler

    gem "insight_rails", :require => "insight"
    
Other wise add to your environment.rb

    gem.config "insight_rails", :lib => "insight"
  
Make sure your development database exists and that you have user and account models, then run the generator:
  
    script/generate insight
    
Now run the migration to add the crm_id field to your users table. 

Then update the insight initializer with details of your api_key, fatfree's url and your recaptcha keys.

## Usage

You will now have a knowledge base of articles from your fat free installation available at:

/knowledge

You will also have a support page available at:

/help

Discussions can be viewed at:

/help/browse

This will pull through the issue_categories you setup in Fat Free.

## Style

The app had a default stylesheet included. This is formatted using Sass so ensure your app has Sass installed.
    
## Copyright

Copyright (c) 2010 Kieran Johnson. See LICENSE for details.