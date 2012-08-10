class RubyNxtSample
  $:.unshift File.join(File.dirname(__FILE__),"/ruby-nxt/ruby/lib")

  #gem 'ruby-nxt'    #See readme
  #gem 'ruby-usb'   #See readme
  #gem 'libusb'    # Is loaded by lego_nxt
  gem 'serialport'
  #gem 'lego_nxt'

  require 'usb'
  require 'pp'
  require 'nxt'
  require 'serialport'

  #$DEBUG=true

  #pp USB.devices          #pretty print

  #dev = USB.find_bus(2).find_device(3)

  nxt =  NXT.new()

  #nxt.sensor(3, "use_ambient_mode")

  #l = Commands::LightSensor.new(nxt)
  #l.illuminated_mode
  #l.generate_light

  #nxt.motor_a {|m| m.forward(:degrees => 180)}
  #nxt.disconnect

  #lproc = Proc.new(light_sensor.generate_light)
=begin
  COLORFULL = 0x0D  #NXT 2.0 color sensor in full color mode (color sensor mode)
  +	COLORRED = 0x0E   #NXT 2.0 color sensor with red light on  (light sensor mode)
  +	COLORGREEN = 0x0F #NXT 2.0 color sensor with green light on (light sensor mode)
  +	COLORBLUE = 0x10  #NXT 2.0 color sensor in with blue light on (light sensor mode)
  +	COLORNONE = 0x11  #NXT 2.0 color sensor in with light off (light sensor mode)
  +	COLOREXIT =0x12   #NXT 2.0 color sensor internal state  (not sure what this is for yet)
=end

  #nxt.sensor_light {|l|l.use_illuminated_mode}
  puts "Turn on Green light"
  nxt.set_input_mode(0x02, 0x0F, 0x00)    # 0x02 = Port 3 (Light Sensor) , 0x0F = Green, 0x00 = Raw mode
  #nxt.disconnect
  sleep(5)
  puts "Turn off Green Light"
  nxt.set_input_mode(0x02, 0x11, 0x00)
  nxt.disconnect
end