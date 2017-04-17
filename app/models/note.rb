class Note < ApplicationRecord
  belongs_to :investor
  has_many :distributions
end
