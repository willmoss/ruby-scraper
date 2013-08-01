# This is a sample plugin to scrape the Foreign Exchange rates from Thomson FX
# You can modify it to fit whatever website you are looking to scrape

class Plugin_thomson
  attr_reader :rates, :key
  def initialize
    @key = "THOMSON"
    @rates = Hash.new
    @url = "https://thomson.onlinecurrency.co.uk/cgi-bin/live/ecommerce.pl?site=thomson_onlinecurrency&state=products&dept_id=01&sub_dept_id=01&menu=currency"
  end
  def start
    
    doc = Nokogiri::HTML(open(@url))
    @items = doc.xpath("//div[@class='e-commerce-middle']/table/tr/td/table/tr/td").map { |item| item.text.gsub(/\s+/, " ").strip }
    
    @rates = {
      "GBP/USD"  => getSell("US - Dollar"),
      "USD/1GBP" => 0,
      "GBP/EUR"  => getSell("EU - Euro"),
      "EUR/1GBP" => 0,
      "GBP/AUD"  => getSell("Australia - Dollar"),
      "AUD/1GBP" => 0,
      "GBP/PLN"  => getSell("Poland - Zloty"),
      "PLN/1GBP" => 0,
      "GBP/CHF"  => getSell("Switzerland - Franc"),
      "CHF/1GBP" => 0
   }
    
  end
  def getSell(currency)
    @items[@items.index(currency)+1]
  end
  def test
        
  end
end
