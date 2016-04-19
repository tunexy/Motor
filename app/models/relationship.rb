class Relationship < ActiveRecord::Base
  
  belongs_to :invited_user, class_name: 'User', foreign_key: :invited_id
  belongs_to :inviting_user, class_name: 'User', foreign_key: :inviting_id

end
