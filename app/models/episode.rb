class Episode < ActiveRecord::Base
  belongs_to :season
  validates :season_id, presence: true
  validates :episode_no, presence: true
  validates :file_name, {presence: true, uniqueness: true}
end
