class Comment < ApplicationRecord
  belongs_to :residence
  has_one :user, through: :residence
end
