class Investor < ApplicationRecord
  has_many :notes
  has_many :distributions, through: notes
end
