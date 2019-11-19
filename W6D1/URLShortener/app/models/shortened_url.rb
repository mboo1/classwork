class ShortenedUrl < ApplicationRecord
    validates :long_url, :user_id, presence: true

    def self.random_code
        code = SecureRandom::urlsafe_base64
        while ShortenedUrl.exists?(code)
            code = SecureRandom::urlsafe_base64
        end
        code
    end

    def self.shortener(user, long_url)
        code = ShortenedUrl.random_code
        short = ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: code)
        Visit.record_visit!(user, short)
    end

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
    
    has_many :visits,
        primary_key: :id,
        foreign_key: :url_id,
        class_name: :Visit

    has_many :visitors,
        through: :visits,
        source: :user

    def num_clicks
        return visits.length
    end

    def num_uniques
        visitors.select('user_id').uniq.count
    end

    def num_recent_uniques
        visitors.select.(where('created_at > ?', 10.minutes.ago).uniq.count
    end
end
