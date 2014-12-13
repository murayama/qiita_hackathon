#                                    ,:         
#                                  1@@@@8       
#                               .i@@@@@@@       
#                          C@@@@@@@@@8f         
#                      @@@@@@@@@@@@@@.          
#                   @@@@@@@@@@@@@@@@@           
#                :@@@@@@@@@@@@@@@@@@@           
#              ;@@@@@@@@@@@@@@@@@@@@G           
#  :ffi:      @@@@@@@@@@@@@@@@@@@@@@.           
# ;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@            
#    i@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@            
#        ,@@@@@@@@@@@@@@@@@@@@@@@@@0            
#         @@@@L8@@@@@@@@@@@@@@@@@@@@8,          
#        .@@@t11111tLG@@@@@@@@@@@@@@@@@@@;      
#        .@@@1111i        .:L8@@@@@@@@@@@@@@.   
#         @@@      @L   @@     i@@@    ,;i;.    
#         ;@@@                 @@@              
#          ,@@@;       :     t@@@               
#            L@@@@G,     ,G@@@@C                
#              1@@@@@@@@@@@@@0                  
#             @@@@@@@@@@@@@@@@@                 
#           f@@@@@@@@@@@@@@@@@@@0               
#          0@@@  @@@@@@@@@@@@@@@@@              
#         G@:      8@@@@@@@@@@@@@@8             
#        .@@@@@  @@@. @@@@@@@@@@@@@i            
#        G@@@@@f0@.     @@@@@@@@@@@@            
#        i@@@@@@@@@@. @@@@@@@@@@@@@G            
#          @@@@@@@@@@@@@@@@@@@@@@@              
#              18@@@@@@@@@@@@t.                 
#                                               


child_process = require 'child_process'
ruby_cmd = "bundle exec ruby ../ruby/"
error = "失敗してしまったみたい><"

module.exports = (robot) ->

  buffer = {}
  buffer_flg = {}

  robot.respond /qiita (.*)/i, (msg) ->
    msg.send "少々お待ち下さい..."
    cmd = msg.match[1]
    username = msg.message.user.name

    # 実行するrubyファイルを指定して下さい。
    exec_cmd = (ruby_file, option) ->
      child_process.exec ruby_cmd + ruby_file + ' ' + option , (error, stdout, stderr) ->
        if !error
          msg.send stdout
        else
          msg.send error

    kobito_start = ->
      buffer_flg[username] = true

    kobito_end = ->
      buffer_flg[username] = false

    kobito_clear = ->
      buffer_flg[username] = false
      buffer[username] = null

    kobito_buffer = ->
      msg.send buffer[username].join("\n")

    kobito_post = ->
      buffer[username].shift()
      text = buffer[username].join("\\\\n")
      exec_cmd("create_item.rb", "-t #{text}")
      kobito_clear()


    # Hubot qiita cmd
    switch cmd
      when "相思相愛" then exec_cmd("lovers.rb")
      when "kobito_start"  then kobito_start()
      when "kobito_end"    then kobito_end()
      when "kobito_clear"  then kobito_clear()
      when "kobito_buffer" then kobito_buffer()
      when "kobito_post"   then kobito_post()
      else msg.send "command nothing"

  robot.hear /(.*)/, (msg) ->
    username = msg.message.user.name

    if buffer_flg[username]

      unless buffer[username]
        buffer[username] = []

      buffer[username].push msg.message.text


