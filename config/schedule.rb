# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
require File.expand_path(File.dirname(__FILE__) + '/environment')# Rails.rootを使用するために必要
rails_env = ENV['RAILS_ENV'] || :dependent# cronを実行する環境変数
set :enviroment, rails_env# cronを実行する環境変数をセット
set :output, "#{Rails.root}/log/cron.log"# cronのログの吐き出し場所

every :hour do#1時間ごとに（:hour）実行する先程設定したrakeタスクを記入
  rake 'article_state:change_to_be_published'
end
