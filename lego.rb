#require File.expand_path("/home/rob/.gem/ruby/1.8/gems/ruby-serialport-0.7.0/lib/serialport.rb")
require 'serialport'

#require File.expand_path("/usr/lib/ruby/gems/1.8/gems/ruby-nxt-0.8.1/lib/nxt.rb")
#require 'nxt'
require 'nxt_comm'


#sp =  SerialPort,new('/dev/bus/usb/001/004', 9600);
#a = sp.readline

#print a


@nxt = NXTComm.new('/dev/bus/usb/002/003')

nxt.motor_a do |m|
  m.forward(:degrees => 180, :power => 15)
end

nxt.disconnect

