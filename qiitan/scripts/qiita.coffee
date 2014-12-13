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

    kobito = ->
      msg.send """
                                        ,:         
                                      1@@@@8       
                                   .i@@@@@@@       
                              C@@@@@@@@@8f         
                          @@@@@@@@@@@@@@.          
                       @@@@@@@@@@@@@@@@@           
                    :@@@@@@@@@@@@@@@@@@@           
                  ;@@@@@@@@@@@@@@@@@@@@G           
      :ffi:      @@@@@@@@@@@@@@@@@@@@@@.           
     ;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@            
        i@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@            
            ,@@@@@@@@@@@@@@@@@@@@@@@@@0            
             @@@@L8@@@@@@@@@@@@@@@@@@@@8,          
            .@@@t11111tLG@@@@@@@@@@@@@@@@@@@;      
            .@@@1111i        .:L8@@@@@@@@@@@@@@.   
             @@@      @L   @@     i@@@    ,;i;.    
             ;@@@                 @@@              
              ,@@@;       :     t@@@               
                L@@@@G,     ,G@@@@C                
                  1@@@@@@@@@@@@@0                  
                 @@@@@@@@@@@@@@@@@                 
               f@@@@@@@@@@@@@@@@@@@0               
              0@@@  @@@@@@@@@@@@@@@@@              
             G@:      8@@@@@@@@@@@@@@8             
            .@@@@@  @@@. @@@@@@@@@@@@@i            
            G@@@@@f0@.     @@@@@@@@@@@@            
            i@@@@@@@@@@. @@@@@@@@@@@@@G            
              @@@@@@@@@@@@@@@@@@@@@@@              
                  18@@@@@@@@@@@@t.                 
                                                   
      """

    # Hubot qiita cmd
    switch cmd
      when "相思相愛" then exec_cmd("lovers.rb")
      when "kobito"  then kobito()
      when ""       then
      when ""       then
      else msg.send "command nothing"

