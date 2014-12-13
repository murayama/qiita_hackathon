child_process = require 'child_process'
ruby_cmd = "bundle exec ruby ../ruby/"
error = "失敗してしまったみたい><"

module.exports = (robot) ->
  robot.respond /qiita (.*)/i, (msg) ->
    msg.send "少々お待ち下さい..."
    cmd = msg.match[1]

    sousisouai = ->
      child_process.exec ruby_cmd + "lovers.rb", (error, stdout, stderr) ->
        if !error
          msg.send stdout
        else
          msg.send error

    # Hubot qiita cmd
    switch cmd
      when "相思相愛" then sousisouai()
      when ""       then
      when ""       then
      when ""       then
      else msg.send "command nothing"

