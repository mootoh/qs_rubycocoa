#
# Logger Factory
#
class Shared
  def Shared.set_logger(logger)
    @@logger = logger
  end

  def Shared.logger
    @@logger
  end
end
