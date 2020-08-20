class TalkRoom < ApplicationRecord
	has_many :talk_rooms
  has_many :talks
end
