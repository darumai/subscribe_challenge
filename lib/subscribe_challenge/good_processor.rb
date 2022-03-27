require_relative "./numeric_helper"

module SubscribeChallenge
  class GoodProcessor
    attr_accessor :good

    BASIC_SALES_TAX_EXEMPT_GOODS = ["book","food","medical"]

    def initialize(good={})
      return if good.empty?

      @good = good
      basic_sales_result = basic_sales_tax(good)
      import_result = import_duty(good)

      @good[:percentage] = (basic_sales_result + import_result) * good[:amount]
      @good[:value] = (good[:value] * good[:amount]) + @good[:percentage] 
    end

    def basic_sales_tax_exempt?(type)
      BASIC_SALES_TAX_EXEMPT_GOODS.include?(type)
    end

    def basic_sales_tax(good)
      return 0 if basic_sales_tax_exempt?(good[:type])

      percentage_of_good = (10).percent_of(good[:value])
      percentage_of_good.round_up
    end

    def import_duty(good)
      return 0 unless good[:imported]

      percentage_of_good = (5).percent_of(good[:value])
      percentage_of_good.round_up
    end
  end
end
