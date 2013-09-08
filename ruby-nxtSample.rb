class RubyNxtSample
  $:.unshift File.join(File.dirname(__FILE__),"/ruby-nxt/ruby/lib")

  #gem 'ruby-nxt'    #See readme
  #gem 'ruby-usb'    #See readme
  #gem 'libusb'     # Is loaded by lego_nxt
  gem 'serialport'
  #gem 'lego_nxt'

  require 'usb'
  #require 'pp'
  require 'nxt'
  require 'serialport'

  #$DEBUG=true
  #testPart  = 'M'   #Motor
  testPart = 'US'  #Ultrasonic sensor (nxt 2.0)    Port 4
  #testPart = 'LS'  #Light Sensor (nxt 2.0)

  #pp USB.devices          #pretty print

  #dev = USB.find_bus(2).find_device(3)

  nxt =  NXT.new()


  if (testPart == 'M')
    ## Motors ##
    # Run motor A

    #nxt.motor_a {|m| m.backward(:degrees => 180)}
    nxt.motor_a {|m| m.forward(:time => 2, :power => 40)}
    nxt.motor_a {|m| m.backward(:time => 2, :power => 40)}

    #nxt.disconnect
  end


  if (testPart == 'LS')
    ## Light sensor ##
    #I think that the light sensor code in the ruby-nxt gem is for the 'old' light sensor
    # I'm not sure if it works for the 2.0 version.
    # The code below sends 'direct' commands to the 2.0 sensor
    # The commented stuff doesn't work

=begin
    COLORFULL   = 0x0D  #NXT 2.0 color sensor in full color mode (color sensor mode)
    COLORRED    = 0x0E  #NXT 2.0 color sensor with red light on  (light sensor mode)
    COLORGREEN  = 0x0F  #NXT 2.0 color sensor with green light on (light sensor mode)
    COLORBLUE   = 0x10  #NXT 2.0 color sensor in with blue light on (light sensor mode)
    COLORNONE   = 0x11  #NXT 2.0 color sensor in with light off (light sensor mode)
    COLOREXIT   = 0x12  #NXT 2.0 color sensor internal state  (not sure what this is for yet)
=end

    #lproc = Proc.new(light_sensor.generate_light)
    #nxt.sensor_light {|l|l.use_illuminated_mode}
    #nxt.sensor(3, "use_ambient_mode")

    #l = Commands::LightSensor.new(nxt)
    #l.illuminated_mode
    #l.generate_light

    puts "Turn on Green light"
    nxt.set_input_mode(0x02, 0x0F, 0x00)    # 0x02 = Port 3 (Light Sensor) , 0x0F = Green, 0x00 = Raw mode
    #nxt.disconnect
    sleep(5)
    puts "Turn off Green Light"
    nxt.set_input_mode(0x02, 0x11, 0x00)
  end

  if (testPart == "TS")
    ## Touch Sensor ##
    ts = TouchSensor.new(nxt)

    puts "Press touch Sensor"
    if (ts.wait_for_event { ts.is_pressed? })
      puts "Pressed"
    end
  end

  if (testPart == "US")
    ## Ultrasonic Sensor ##
    us = UltrasonicSensor.new(nxt)
    puts "move object closer to Ultrasonic sensor"
    i = 999
    while i > 10
      j = us.get_distance
      if (j)
        i = Integer(j)
      end
      puts "Object detected at " + i.to_s + " cm"
      #sleep(1)
    end
  end

  nxt.disconnect
  puts 'NXT Disconnected'

rescue
  nxt.disconnect
  puts 'NXT Disconnected'
end
