module Jekyll

  module PostBitly

    require 'bitly'

    def shortened_url(post)
      begin
        Bitly.use_api_version_3
        bitly = Bitly.new(post.site.config['bitly']['username'], post.site.config['bitly']['api_key'])
        if bitly
          return bitly.shorten(post.full_url).short_url
        end
      end
      post.full_url
    end

  end

end
