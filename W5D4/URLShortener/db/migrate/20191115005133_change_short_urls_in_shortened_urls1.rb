class ChangeShortUrlsInShortenedUrls1 < ActiveRecord::Migration[5.2]
  def change

    add_column :shortened_urls, :short_url, :string
  end
end
