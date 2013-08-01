require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'net/https'
require 'uri'
require 'debugger'

# ruby -r "./test.rb" -e "TestClass.new.test_function 'hi'"

class Scraper
  def initialize
    @plugins = '/Users/willmoss26/Documents/ruby/sigads/sigads/lib/plugins' # change this to your 'plugins' directory
  end
  def run
    
    debugger
    
    # load plugin, upload to database
    Dir.glob(@plugins + '*.rb') do |item|
      
      #begin
      begin
        
        load item
        name = item.sub(".rb" , "")
        name = name.sub(@plugins, "")
        
        # init
        thisPlugin = Object.const_get(name).new
        
        # output name
        puts "@ "+thisPlugin.key
        
        # run test
        thisPlugin.test
        
        # start
        thisPlugin.start
        
      rescue => e
        
        p e.message
        p e.backtrace
        
        next
        
      end
      
    end

  end
  # for testing only
  def runPlugin(plugin)
    pluginName = "Plugin_" + plugin
    load @plugins + pluginName + ".rb"
    thisPlugin = Object.const_get(pluginName).new
    puts thisPlugin.key
    thisPlugin.start
    rates = thisPlugin.rates
    puts rates
  end
end

module Helpers
  def assert(desc, var1, var2)
    print "@@@@ Testing #{desc} ... "
    if var1==var2 then
      print "PASS"
      1
    else
      print "FAIL"
      0
    end
    print "\n"
  end
end
