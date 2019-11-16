class ChangeShortUrlsInShortenedUrls < ActiveRecord::Migration[5.2]
  def change
        remove_column :shortened_urls, :short_url, null: false

        # add_column :shortened_urls, :short_url
  end
end
