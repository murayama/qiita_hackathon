require 'bundler'
Bundler.require

class Base

  def initialize
    @client = Qiita::Client.new(access_token: '0ca76599346a8df81e5ecf3835a7c794a91d0aa0')
    # ユーザーオブジェクト
    res_user = @client.get_authenticated_user
    @current_user  = res_user.body
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
