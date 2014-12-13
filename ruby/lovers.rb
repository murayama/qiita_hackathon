require File.join(File.expand_path('../', __FILE__), 'qiita')

class Lovers < Base

  # 相互フォローしているユーザーを探す
  def execute
    # ユーザーをフォローしている
    res_followers = @client.list_user_followers(@current_user['id'], page: 1, per_page: 100).body.map{|u| u['id']}
    # ユーザーがフォローしている
    res_followees = @client.list_user_followees(@current_user['id'], page: 1, per_page: 100).body.map{|u| u['id']}
    _lovers = res_followers & res_followees

    if _lovers.empty?
      "(ohmy) no lovers"
    else
      msg = []
      _lovers.each do |user|
        msg <<  "I (heart) #{user}"
      end
      msg.join("\n")
    end
  end
end

puts Lovers.new.execute
