# Класс предназначен для сохранения любого набора конфиграционных данных
class VmBuilder
  class << self
    attr_accessor :config

    def build(&block)
      self.new.build(&block)
    end
  end

  def initialize
    @config = {}
  end

  def build(&block)
    instance_exec &block
    return @config
  end

  def method_missing(method, *args, &block)
    if args.any?
      set_value_to_config(method, args)
    end
    if block_given?
      @config[method] = VmBuilder.build(&block)
    end
  end

  def set_value_to_config(method, args)
    if args.one?
      @config[method] = args.first
    else
      @config[method] = args
    end
  end
end

c = VmBuilder.build do
  ola 'viola'

  enot do
    poloskun 'yee'
  end
end

p c
