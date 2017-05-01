class Note < ApplicationRecord
  has_one :investor
  has_many :distributions
end