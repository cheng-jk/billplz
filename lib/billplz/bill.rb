module Billplz
  class Bill < Model
    self.api_url = get_api_url

    def get_api_url
      if Rails.env.production?
        self.api_url = 'https://www.billplz.com/api/v3/bills'
      else
        self.api_url = 'https://billplz-staging.herokuapp.com/api/v3/bills'
      end
    end

    def get
      requires!(@payload, :bill_id)
      @api_url = "#{@api_url}/#{@payload[:bill_id]}"
      request(:get, nil)
      JSON.parse(@response.body) if success?
    end

    def delete
      requires!(@payload, :bill_id)
      @api_url = "#{@api_url}/#{@payload[:bill_id]}"
      request(:delete, nil)
    end
  end
end
