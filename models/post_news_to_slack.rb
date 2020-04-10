require 'slack-ruby-client'
require './models/formula1_news'

class PostNewsToSlack
  def self.post
    new.post
  end

  def post
    article = Formula1News.articles.last
    message = "<#{article["url"]}|#{article["title"]}>"
    send_message(content: message)
  end

  private

  def send_message(content:)
    Slack.configure do |config|
      config.token = 'xoxp-1052655198181-1052655198341-1053396944706-f9961320a155dce18b1aaa3648d30ff5'
    end
    client = Slack::Web::Client.new
    client.chat_postMessage(channel: '#f1-news', text: content, as_user: false)
  end
end
