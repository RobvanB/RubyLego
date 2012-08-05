class Usb1
  $:.unshift File.join(File.dirname(__FILE__),"/lego_nxt/lib")
  $:.unshift File.join(File.dirname(__FILE__),"/ruby-nxt/ruby/lib")

  #gem 'ruby-nxt'  #See readme
  #gem 'ruby-usb'  #See readme
  #gem 'libusb'    # Is loaded by lego_nxt
  gem 'serialport'
  #gem 'lego_nxt'

  require 'usb'
  require 'pp'
  #require 'nxt'
  require 'serialport'
  require 'lego_nxt'
  #require 'lego_nxt/usb_connection'

  #pp USB.devices          #pretty print

  #dev = USB.find_bus(2).find_device(3)

  #nxt =  NXT.new(dev)

  conn =  LegoNXT::UsbConnection.new

  #Send beep
  conn.transmit [0x80, 0x03, 0xf4, 0x01, 0xf4, 0x01].pack('C*')



end