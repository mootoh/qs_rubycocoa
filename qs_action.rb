class Action
  def initialize(logger)
    @logger = logger
  end

  # write something great :)
  #  - arg : QSObject
  def act(arg)
    val = arg.stringValue
    @logger.info(val)
    'Hello world, ' + val
  end
end # Action

require 'osx/cocoa'
OSX.init_for_bundle do |bdl, owner, log|
  # bdl    - the bundle related with the 2nd argument of RBBundleInit
  # owner  - the 3rd argument of RBBundleInit as optional data
  # log    - logger for this block

  act = Action.new(log)
  owner.setInstance act
end

