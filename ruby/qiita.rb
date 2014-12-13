require 'optparse'
require 'bundler'
Bundler.require

class Base

  def initialize

    @args = {}
    OptionParser.new do |parser|
      parser.on('-u', '--user', 'ユーザー指定') {|v| @args[:user_id] = v}
      parser.on('-t', '--text ', '投稿内容のテキスト') {|v| @args[:text] = v}
      parser.parse!(ARGV)
    end 

    # @client = Qiita::Client.new(access_token: 'cc6ccacf7a0ceaf6905eea580a1745bae1b457fd')
    @client = Qiita::Client.new(access_token: 'b71f8014e6a684bfa0ef4bc33a0e4dce0fad6e4d', host: 'qiitahackathon07.qiita.com')
    # ユーザーオブジェクト
    if @args[:user_id]
      res_user = @client.get_user(@args[:user_id])
    else
      res_user = @client.get_authenticated_user
    end
    @current_user = res_user.body
  end
end

#
#
# p client
#
# # ユーザーオブジェクト
# res_user = client.get_authenticated_user
# user_id = res_user.body["id"]
# items_count = res_user.body["items_count"]
# # p res_user.body
#
# # 自分の投稿一覧
# page = 1
# res_items  = client.list_user_items(user_id, page: page, per_page: 100)
#
# # p res_items.body
#
# # 自分の投稿に対するコメント一覧
# res_items.body.each do |item|
#   res_comments = client.list_item_comments(item['id'], page: 1, per_page: 100)
#   # p res_comments.body
# end
#
#
# # 相互フォローしているユーザーを探す
# res_followers = client.list_user_followers(user_id, page: 1, per_page: 100)
#
# p res_followers.body
#
# lovers = []
# res_followers.body.each do |user|
#   unless  client.list_user_followers(user['id'], page: 1, per_page: 100).body.select {|u| u['id'] == user_id}.empty?
#     lovers << user
#   end
# end
#
# p lovers
