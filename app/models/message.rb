class Message < ApplicationRecord
 belongs_to :conversation
 belongs_to :girl, optional: true
 belongs_to :guy, optional: true
 # validates_presence_of :body, :conversation_id, :user_id
 def message_time
  created_at.strftime("%m/%d/%y at %l:%M %p")
 end
end
