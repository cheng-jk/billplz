module Billplz
  class Collection < Model
    self.api_url = get_api_url

    def get_api_url
      if Rails.env.production?
        self.api_url = 'https://www.billplz.com/api/v3/collections'
      else
        self.api_url = 'https://billplz-staging.herokuapp.com/api/v3/collections'
      end
    end

    def create
      requires!(@payload, :title)
      request(:post, @payload)
    end
  end
end
