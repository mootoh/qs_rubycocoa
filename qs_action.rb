#
# RubyCocoaPlugin
#
# License: revised BSD
# Motohiro Takayama <mootoh@gmail.com>
#

require 'osx/cocoa'
require 'shared'

# 
# does actual Action
#
class RubyAction < OSX::QSActionProvider
  def act(arg)
    val = arg.stringValue
    Shared.logger.info('RubyAction : ' + val)
    OSX::QSObject.objectWithString('Hello world, ' + val)
  end
end # Action
