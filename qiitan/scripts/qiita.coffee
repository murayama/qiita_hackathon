module.exports = (robot) ->
  robot.respond /qiita|キータ|きーた|qita|ki-ta|Qiita/, (msg) ->
    msg.send "Qiita OK!"
