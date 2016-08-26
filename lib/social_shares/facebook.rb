module SocialShares
  class Facebook < Base
    URL = 'http://graph.facebook.com/v2.7/'

    def shares!
      response = get(URL, params: {
        id: checked_url,
        fields: 'share', 'like_count', 'comment_count'
      })
      json_response = JSON.parse(response)

      if json_response['share']
        json_response || 0
      else
        0
      end
    end
  end
end
