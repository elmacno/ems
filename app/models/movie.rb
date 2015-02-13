class Movie < ActiveRecord::Base
  validates :file_name, {presence: true, uniqueness: true}
  validates :moviedb_id, {presence: true, uniqueness: true}
end
