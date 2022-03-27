require_relative "./subscribe_challenge/version"
require_relative "./subscribe_challenge/good_processor"
require_relative "./subscribe_challenge/receipt"

module SubscribeChallenge
  class Error < StandardError; end
  
  class Main
    def initialize(goods={})
      return if goods.empty?
      processed_goods = []

      goods.each do |good|
        processed_goods << GoodProcessor.new(good).good
      end

      Receipt.new(processed_goods).print_receipt       
    end
  end
end

SubscribeChallenge::Main.new(
  [
      {
         "name":"book",
         "value": 12.49,
         "amount": 2,
         "type":"book",
         "imported": false
      },
      {
         "name":"music CD",
         "value": 14.99,
         "amount": 1,
         "type":"general",
         "imported": false
      },
      {
         "name":"chocolate bar",
         "value": 0.85,
         "amount": 1,
         "type":"food",
         "imported": false
      }
   ]
)

SubscribeChallenge::Main.new(
  [
      {
        "name":"box of chocolates",
        "value": 10.00,
        "amount": 1,
        "type":"food",
        "imported": true
      },
      {
        "name":"bottle of perfume",
        "value": 47.50,
        "amount": 1,
        "type":"general",
        "imported": true
      }
   ]
)

SubscribeChallenge::Main.new(
  [
      {
         "name":"bottle of perfume",
         "value": 27.99,
         "amount": 1,
         "type":"general",
         "imported": true
      },
      {
         "name":"bottle of perfume",
         "value": 18.99,
         "amount": 1,
         "type":"general",
         "imported": false
      },
      {
         "name":"packet of headache pills",
         "value": 9.75,
         "amount": 1,
         "type":"medical",
         "imported": false
      },
      {
         "name":"box of chocolates",
         "value": 11.25,
         "amount": 3,
         "type":"food",
         "imported": true
      }
   ]
)