require File.join(File.expand_path('../', __FILE__), 'qiita')

class Lovers < Base

  # 相互フォローしているユーザーを探す
  def execute
    # ユーザーをフォローしている
    res_followers = @client.list_user_followers(@current_user['id'], page: 1, per_page: 100).body.map{|u| u['id']}
    # ユーザーがフォローしている
    res_followees = @client.list_user_followees(@current_user['id'], page: 1, per_page: 100).body.map{|u| u['id']}
    res_followers & res_followees
  end
end

lovers =  Lovers.new.execute
p "(ohmy) no lovers" if lovers.empty?
lovers.each do |user|
  puts "I (heart) #{user}"
end
