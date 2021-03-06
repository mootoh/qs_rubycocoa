#
#  load_ruby.rb
#  RubyCocoaPlugin
#
#  Created by Fujimoto Hisa on 08/01/22.
#  Copyright (c) 2008 __MyCompanyName__. All rights reserved.
#
require 'osx/cocoa'

def load_ruby_programs(bundle, logger)
  path = bundle.resourcePath.fileSystemRepresentation
  rbfiles = Dir.entries(path).select {|x| /\.rb\z/ =~ x}
  rbfiles -= [ File.basename(__FILE__) ]
  rbfiles.each do |path|
    require( File.basename(path) )
  end

  Shared.set_logger(logger)
end

OSX.init_for_bundle do |bundle, param, logger|
  logger.info("init_for_bundle -- RUBY_VERSION=%s", RUBY_VERSION)
  logger.info("init_for_bundle -- RUBYCOCOA_VERSION=%s (r%s)",
    OSX::RUBYCOCOA_VERSION, 
    OSX::RUBYCOCOA_SVN_REVISION)
  load_ruby_programs(bundle, logger)
  logger.info("init_for_bundle -- done.")
end
