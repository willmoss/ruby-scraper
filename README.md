RUBY SCREEN SCRAPER
=============

This is a screen scaping software that we use with a number of our clients, to scrape data from an external website.

We will be modifying it and updating the code alongside our existing client projects. It's here on github for the benefit of the community.

Features
-------

* Define your own plugins to scrape websites of your choice
* High level of flexibility and customization
* Integrates fully with any existing Rails environment; minimal amount of customization required
* Code can be easily customized to use alternative scraping libraries, such as Watir-Webdriver

Usage
-----

To get using this, just `git clone` to your local machine, then edit the main configuration file `rubyscrape.rb` to point to your plugins directory.

After that, you'll need to start writing your own scraper plugins. It depends on what website or resource you're looking to scrape, but we have included a sample plugin 'Plugin_thomson.rb' to get you started.

This plugin scrapes the live FX rates from Thomson FX, and can be used as an example for your apps.

Deploying
-----

Add as many plugins as you like and they will be executed automatically.

To integrate with your rails environment, copy to your 'lib' directory.

Then, you can include in any of your existing models/controllers.

Alternatively, you can execute using a custom cron job using the gem 'whenever'.

You're done!

Contributing
------------

Want to contribute? Great! 

Just fork our code, make your changes, then let us know and we will incorporate.

1. Fork it.
2. Create a branch (`git checkout -b my_branch`)
3. Commit your changes (`git commit -am "Added Snarkdown"`)
4. Push to the branch (`git push origin my_branch`)
5. Open a [Pull Request][1]
6. Enjoy a refreshing Diet Coke and wait

We encourage you to get in touch and tell us what you think of our code.

We are constantly updating and improving our code. We hope it can be for the benefit of the entire community.

If you want to chat to us, connect to our website: [bxmediaus.com][bxmediaus]

[bxmediaus]: https://bxmediaus.com
