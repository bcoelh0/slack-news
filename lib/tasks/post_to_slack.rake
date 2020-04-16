require './models/post_news_to_slack'

task :post_to_slack do
  PostNewsToSlack.post
end
