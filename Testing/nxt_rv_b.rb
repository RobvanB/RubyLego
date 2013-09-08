class NxtRvb
  $:.unshift File.join(File.dirname(__FILE__),"/ruby-nxt/ruby/lib")

  require 'serialport'

  class Array
    def to_hex_str
      self.collect{|e| "0x%02x " % e}
    end
  end


  #$DEBUG=true
#  begin
    @sp = SerialPort.new("/dev/rfcomm0", 57600, 8, 1, SerialPort::NONE) #RvB
    @sp.flow_control = SerialPort::HARD #RvB Orig
    #@sp.flow_control = SerialPort::NONE #RvB

 #   $stderr.puts "Cannot connect to #{dev}" if @sp.nil?
 # rescue
  #  raise "Cannot connect. The #{@connection_type} device is busy or unavailable."
 # end
  #beep
  #sleep 5
  #0x06 0x00 0x80 0x03 0x0B 0x02 0xF4 0x01
  @sp.putc 0x06
  @sp.putc 0x00
  @sp.putc 0x80
  @sp.putc 0x03
  @sp.putc 0x0B
  @sp.putc 0x02
  @sp.putc 0xF4
  @sp.putc 0x01

  #@sp.putc 0x06
  #@sp.putc 0x00
  #@sp.putc 0x00
  #@sp.putc 0x05
  #@sp.putc 0x00
  #@sp.putc 0x01
  #@sp.putc 0x20
  #@sp.putc 0x00
  #
  #msg = @sp.sysread(2)
  #
  #len = msg.unpack("v")[0]
  #
  #puts "len : #{len}"
  #
  #msg = @sp.sysread(len)
  #
  #puts "msg : #{msg}"
  #
  #@cntr = 0
  #while @cntr < len
  #  resp = msg.unpack("v")[@cntr]
  #  puts resp
  #  puts resp.class
  #  if (resp)
  #    puts "resp #{sprintf("0x%02x", resp)}"
  #  end
  #
  #  #puts "msg #{@cntr} #{sprintf(", 0x%02x", msg.unpack("v")[@cntr])}"
  #  @cntr = @cntr + 1
  #end
  #

  #sleep 3
  #
  #@sp.putc 0x06
  #@sp.putc 0x00
  #@sp.putc 0x80
  #@sp.putc 0x03
  #@sp.putc 0x0B
  #@sp.putc 0x02
  #@sp.putc 0xF4
  #@sp.putc 0x01

  sleep 3

  @sp.close



  puts 'Done'


    #def play_tone(freq,dur,request_reply=true)
    #freq = 1000
    #dur = 500
    #cmd = [(freq & 255),(freq >> 8),(dur & 255),(dur >> 8)]
    #result = send_and_receive @@op_codes["play_tone"], cmd, request_reply
    #result = true if result == ""
    #result

    #Direct command = "0x00" with response
    # 0x80 no response required
    #puts cmd[0] & 255
    #Send length (6)


  #i = 0

  #while i <= 10
    #@sp.putc 0x06  #
    #@sp.putc 0x00  #
    #@sp.putc 0x00  # Direct command with response
    #@sp.putc 0x03  # Command (play tone)
    #@sp.putc 0x0B  # Frequency part 1
    #@sp.putc 0x02 # Frequency part 2
    #@sp.putc 0xF4  # Duration part 1
    #@sp.putc 0x01  # Duration part 2
    #msg =[0x06, 0x00, 0x00, 0x03, 0x0B, 0x02, 0xF4, 0x01]
    #@sp.puts(msg)

    #i += 1
   # puts i
  #end

  #try turn on the green light
  #nxt.set_input_mode(0x02, 0x0E, 0x00)    # 0x02 = Port 3 (Light Sensor) , 0x0F = Green, 0x00 = Raw mode

  #@sp.putc 0x06  #
  #@sp.putc 0x00  #
  #@sp.putc 0x00  # Direct command with  response
  #@sp.putc 0x05  # Set input mode (light active)
  #@sp.putc 0x02  # Command (port 3, light)
  #@sp.putc 0x05  # Sensor - type : Light active
  #@sp.putc 0x00  # Sensor mode (raw)
  #@sp.putc 0x0E  # Green



  #@sp.write [6.chr, 0.chr, 80.chr, 3.chr, 11.chr, 2.chr, 244.chr, 1.chr ].to_s

  #resp = @sp.readline

  #puts resp

  #puts 6.chr


  #Get battery level
  #@sp.putc 0x02
  #@sp.putc 0x00
  #@sp.putc 0x80
  #@sp.putc 0x0b

  #play_tone(1000,500)
  #puts "get data"
  #sleep 1
  #@sp.read_timeout = 5000
  #retmsg = @sp.readpartial(2)
  #puts retmsg
  #sleep 2

end