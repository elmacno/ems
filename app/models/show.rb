class Show < ActiveRecord::Base
  has_many :seasons, dependent: :destroy
  validates :moviedb_id, {presence: true, uniqueness: true}
end
