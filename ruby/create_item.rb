require File.join(File.expand_path('../', __FILE__), 'qiita')

class CreateItem < Base

  def execute
    text = @args[:text]
    return unless text
    body = text.split("\\n")
    title = body.first

    res = @client.create_item({
      body: body.join("\n"),
      coediting: false,
      gist: false,
      private: false,
      tags: [{
        name: 'from_hubot',
        versions: ['0.0.1']
      }],
      title: title,
      tweet: false
    })
  end
end

res =  CreateItem.new.execute
puts res['url']
