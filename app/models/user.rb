class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, presence: true, format: { with: /\A[-a-z A-Z']+\z/, message: "only accepts letters, spaces, hyphens and apostrophes" }
    validates :last_name, presence: true, format: { with: /\A[-a-z A-Z']+\z/, message: "only accepts letters, spaces, hyphens and apostrophes" }
    before_save :downcase_email, :capitalize_name

    def downcase_email
        self.email = email.downcase
    end

    def capitalize_name
        self.first_name = first_name.capitalize
        self.last_name = last_name.capitalize
    end
end
