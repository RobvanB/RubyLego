class Vehicle1
  $:.unshift File.join(File.dirname(__FILE__),"/ruby-nxt/ruby/lib")

  #gem 'ruby-serialport'
  #gem 'ruby-usb'

  require 'usb'
  require 'nxt'
  require 'serialport'

  #$DEV = "/dev/ttyS3"

  $DEBUG=false

  def self.move_bot()
    # Check path
    puts "*** Check for obstacles ***"
    d_forward = @us.get_distance
    sleep 0.2

    if (d_forward)
      d_forward_i = Integer(d_forward)
      puts "*** Forward distance: #{d_forward_i.to_s} ***"
    end

    puts "*** check for drop off ***"
    @nxt.motor_c {|m| m.forward(:power => 20, :degrees => 3)}
    sleep 1

    d_dropoff = @us.get_distance
    sleep 0.2

    if (d_dropoff)
      d_dropoff_i = Integer(d_dropoff)
      puts "*** Drop Off distance: #{d_dropoff_i.to_s}"
    end

    # Bring sensor back up
    @nxt.motor_c {|m| m.backward(:power => 20, :degrees => 5)}
    sleep 1

    if  (d_forward_i > 20 && d_dropoff_i < 10)
      puts "*** move ***"
      @nxt.motor_a {|m| m.forward(:power => 40, :degrees => 360, :brake_on_stop => true)}
      @nxt.motor_b {|m| m.forward(:power => 40, :degrees => 360, :brake_on_stop => true)}
      sleep 1
    else
      puts "*** object detected ***"
    end
  end

  #nxt =  NXT.new("/dev/rfcomm0") #Bluetooth
  tmp=1
  @nxt =  NXT.new()
  sleep 0.1

  # Turn on Green light
  puts '***turn on green light***'
  @nxt.set_input_mode(0x02, 0x0F, 0x00)    # 0x02 = Port 3 (Light Sensor) , 0x0F = Green, 0x00 = Raw mode
  sleep 0.2

  ## Ultrasonic Sensor ##
  puts "***initialize U - sensor***"
  @us = UltrasonicSensor.new(@nxt)
  sleep 0.2

  puts "*** move ***"

  move_bot
  sleep 2
  move_bot


  ## Start moving
  #puts "***Start moving***"
  #nxt.motor_a {|m| m.forward(:power => 40, :brake_on_stop => true)}
  #nxt.motor_b {|m| m.forward(:power => 40, :brake_on_stop => true)}
  #
  #sleep 1
  #i = 9
  #while i < 10
  #  j = us.get_distance
  #  if (j)
  #    i = Integer(j)
  #  end
  #  puts "***Object detected at " + i.to_s + " cm***"
  #
  #  if j > 20
  #    # Turn on red light
  #    nxt.set_input_mode(0x02, 0x0E, 0x00)    # 0x02 = Port 3 (Light Sensor) , 0x0F = Green, 0x00 = Raw mode
  #
  #    puts "***STOP***"
  #    nxt.motor_a {|m| m.stop}
  #    sleep 0.2
  #    nxt.motor_b {|m| m.stop}
  #  end
  #  puts 'sleep'
  #  sleep 0.5
  #end
  #
  #sleep 2

  puts "*** END-STOP ***"
  #nxt.motor_a {|m| m.stop}
  #nxt.motor_b {|m| m.stop}

  #Turn off light
  @nxt.set_input_mode(0x02, 0x11, 0x00)
  @nxt.disconnect
  puts '*** NXT Disconnected ***'

rescue => ex
  if (@nxt)
    puts "*** RESCUE-STOP ***"
    #nxt.motor_a {|m| m.stop}
    #nxt.motor_b {|m| m.stop}

    #Turn off light
    @nxt.set_input_mode(0x02, 0x11, 0x00)
    @nxt.disconnect
    puts 'NXT Disconnected'
  end
  puts 'NXT Disconnected'
  puts ex.message
end


#threads = []

  #nxt.motor_a {|m| m.(:time => 2, :power => 40)}
  #nxt.motor_a {|m| m.forward(:time => 2, :power => 40)}



=begin
  ## Motors ##
  # Run motor A

  #nxt.motor_a {|m| m.backward(:degrees => 180)}
  #nxt.motor_a {|m| m.forward(:time => 2, :power => 40)}
  #nxt.motor_a {|m| m.backward(:time => 2, :power => 40)}

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

  #puts "Turn off Green Light"
  #nxt.set_input_mode(0x02, 0x11, 0x00)

=begin
  ## Touch Sensor ##
  ts = TouchSensor.new(nxt)

  puts "Press touch Sensor"
  if (ts.wait_for_event { ts.is_pressed? })
    puts "Pressed"
  end
=end

=begin
  command = Commands::Move.new(nxt)

  command.ports = :a, :b
  command.direction = :forward
  #command.duration = {:seconds => 5}
  puts 'wait'
  sleep 2
  command.next_action = :brake

  threads =  []
  threads <<  command.start

  puts "started"
  #sleep(1)
=end