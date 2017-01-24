class Conversation < ApplicationRecord
 belongs_to :guy, optional: true
 belongs_to :girl, optional: true
 has_many :messages, dependent: :destroy
 # validates_uniqueness_of :sender_id, :scope => :recipient_id
 scope :between, -> (guy_id,girl_id) do
 where("(conversations.guy_id = ? AND conversations.girl_id =?) OR (conversations.guy_id = ? AND conversations.girl_id =?)", guy_id,girl_id, girl_id, guy_id)
 end
end
