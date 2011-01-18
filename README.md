# Insight

Rails engine to access support requests and knowledge base articles stored in FatFree CRM. 

## Installation

Add insight to your applications dependencies.

For Rails 2

    gem.config "insight_rails", :lib => "insight"
    
For those using bundler

    gem "insight_rails", :require => "insight"
  
Make sure your development database exists and run the generator:
  
    script/generate insight
    
Firstly, run the migration to add the crm_id field to your users table. 

Then update the insight initializer with details of your api_key, fatfree's url and your recaptcha keys.

## Usage

You will now have a knowledge base of articles from your fat free installation available at:

/knowledge

You will also have a support page available at:

/help

Discussions can be viewed at:

/help/browse

This will pull through the issue_categories you setup in Fat Free.
    
## Copyright

Copyright (c) 2010 Kieran Johnson. See LICENSE for details.