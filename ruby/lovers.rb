require File.join(File.expand_path('../', __FILE__), 'qiita')

class Lovers < Base

  def execute
    # 相互フォローしているユーザーを探す
    res_followers = @client.list_user_followers(@current_user['id'], page: 1, per_page: 100)

    lovers = []
    res_followers.body.each do |user|
      unless  @client.list_user_followers(user['id'], page: 1, per_page: 100).body.select {|u| u['id'] == @current_user['id']}.empty?
        lovers << user
      end
    end

    lovers
  end
end

lovers =  Lovers.new.execute
p "(ohmy) no lovers" if lovers.empty?
lovers.each do |user|
  puts "I (heart) #{user['id']}"
end
