module Hiveage
  class RecurringInvoice < Hiveage::Base
    alias :update_attributes :modify
    
    self.collection_name = "rinv"

    def to_param
      hash_key 
    end

    def invoices(params={})
      response = get(:invoices, params)

      Invoice.send(:instantiate_collection, response)
    end

    def activate
      post(:activate)
    end

    def close
      post(:close)
    end

    def pause
      post(:pause)
    end

    def resume
      post(:resume)
    end

  end
end
