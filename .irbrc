require 'rubygems'

require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:SAVE_HISTORY] = 2000
IRB.conf[:PROMPT_MODE] = :SIMPLE

begin
  require 'hirb'

  Hirb.enable
rescue LoadError
  warn "Unable to load: #{$!}"
end

if defined? ActiveRecord
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

unless respond_to? :y
  def y(o)
    puts o.to_yaml
  end
end
