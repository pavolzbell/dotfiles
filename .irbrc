require 'rubygems'

require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:SAVE_HISTORY] = 2000
IRB.conf[:PROMPT_MODE] = :SIMPLE

if defined? ActiveRecord
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end
