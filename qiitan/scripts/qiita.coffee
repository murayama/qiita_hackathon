child_process = require 'child_process'
ruby_cmd = "bundle exec ruby ../ruby/"
error = "失敗してしまったみたい><"

module.exports = (robot) ->
  robot.respond /qiita (.*)/i, (msg) ->
    msg.send "少々お待ち下さい..."
    cmd = msg.match[1]

    # 実行するrubyファイルを指定して下さい。
    exec_cmd = (ruby_file) ->
      child_process.exec ruby_cmd + ruby_file , (error, stdout, stderr) ->
        if !error
          msg.send stdout
        else
          msg.send error

    # Hubot qiita cmd
    switch cmd
      when "相思相愛" then exec_cmd("lovers.rb")
      when ""       then
      when ""       then
      when ""       then
      else msg.send "command nothing"

