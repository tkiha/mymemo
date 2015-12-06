class Mymemo < ActiveRecord::Base
  # add_template_helper(EmojiHelper)

  belongs_to :user

  validates :title, presence: true
  validates :text, presence: true
end
