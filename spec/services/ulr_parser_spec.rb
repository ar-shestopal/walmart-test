require 'rails_helper'

RSpec.describe UrlParser, type: :model do
  describe 'products creation' do
    let(:url) { 'http://www.walmart.com/ip/43939510?findingMethod='\
                'wpa&wpa_qs=Mic7E1ejgWB7K0wqpfbt8uDEZFU03QqU6B9iOE'\
                'd_ZsU&tgtp=2' }
    let(:code) { '43939510' }

    it 'should create product' do
      puts UrlParser.code(url)
      expect(UrlParser.code).to eq code
    end
  end
end
