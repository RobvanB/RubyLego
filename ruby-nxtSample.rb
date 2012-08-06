class RubyNxtSample
  $:.unshift File.join(File.dirname(__FILE__),"/ruby-nxt/ruby/lib")

  #gem 'ruby-nxt'  #See readme
  #gem 'ruby-usb'  #See readme
  #gem 'libusb'    # Is loaded by lego_nxt
  gem 'serialport'
  #gem 'lego_nxt'

  require 'usb'
  require 'pp'
  require 'nxt'
  require 'serialport'

  $DEBUG=true

  #pp USB.devices          #pretty print

  #dev = USB.find_bus(2).find_device(3)

  nxt =  NXT.new()

end