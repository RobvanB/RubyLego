class LegoNxtSample
  $:.unshift File.join(File.dirname(__FILE__),"/lego_nxt/lib")
  $:.unshift File.join(File.dirname(__FILE__),"/ruby-nxt/ruby/lib")

  gem 'serialport'

  require 'usb'
  require 'pp'
  require 'serialport'
  require 'lego_nxt'

  #pp USB.devices          #pretty print

  conn =  LegoNXT::UsbConnection.new

  #Send beep
  #conn.transmit [0x80, 0x03, 0xf4, 0x01, 0xf4, 0x01].pack('C*')

  brick =  LegoNXT::Brick.new(conn)

  brick.run_motor(:a)

  sleep(3)

  brick.stop_motor(:all)

end