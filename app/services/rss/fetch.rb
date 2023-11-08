# frozen_string_literal: true

module Rss
  class Fetch
    RSS_URL = ENV['RSS_SOURCE']

    def self.call
      return if RSS_URL.blank?

      URI.parse(RSS_URL).open do |rss|
        feed = RSS::Parser.parse(rss)
        feed.items.each do |item|
          next if Article.exists?(title: item.title)

          Article.create(title: item.title, content: item.description, published_at: item.pubDate)
        end
      end
    end
  end
end
