module EmojiHelper
  def emojify(content, options = {})
    h(content).to_str.gsub(/:([\w+-]+):/) do |match|
      begin
        emoji = Emoji.find_by_alias($1)
        emoji_path = "/images/emoji/#{emoji.image_filename}"
        src = options[:absolute_url] ? URI.join(root_url, emoji_path) : emoji_path
        %Q(<img alt="#{$1}" height="20" src="#{src}" style="vertical-align:middle" width="20" />)
      rescue
        match
      end
    end.html_safe if content.present?
  end
end
