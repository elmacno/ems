class Season < ActiveRecord::Base
  belongs_to :show
  has_many :episodes, dependent: :destroy
  validates :show_id, presence: true
  validates :season_no, presence: true
end
