require File.join(File.expand_path('../', __FILE__), 'qiita')

class RankingItems < Base

  def execute
    followees = @client.list_user_followees(@current_user['id'], page: 1, per_page: 100).body
    followees << @current_user
    followees =  followees.sort{|a,b| b['items_count'] <=> a['items_count']}

    msg = []
    followees.each do |user|
      if user['id'] == @current_user['id']
        msg << "(goldstar) #{user['id']}  #{user['items_count']}"
      else
        msg <<  "#{user['id']}  #{user['items_count']}"
      end
    end
    msg.join("\n")
  end
end

puts RankingItems.new.execute

