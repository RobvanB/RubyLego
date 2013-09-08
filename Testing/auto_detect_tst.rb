class AutoDetectTst
   # TODO: This curently only works on *nix based systems (MacOS X too!)
  #       I don't know how to implement this for Win32 :(

  # If there is an NXT or DEV environment variable, or a $DEV global,
  # we'll use that and not try to auto-set it ourselves.
  $DEV = $DEV || ENV['NXT'] || ENV['DEV']

  unless $DEV or ENV['NXT'] or ENV['DEV']
    begin
      devices = Dir["/dev/*NXT*"]
      $DEV = devices[0] if devices.size > 0
      if (!$DEV)
        devices = Dir["/dev/rfcomm*"]
        $DEV = devices[0] if devices.size > 0
      end
      if (!$DEV)
        usbBus = `lsusb | grep '0694:0002' | awk '{print $2}'`
        usbDev = `lsusb | grep '0694:0002' | awk '{print substr($4,0,3)}'`
        if (usbBus.length > 0)
          $DEV="/dev/bus/usb/" + usbBus + "/" + usbDev
        end
      end

      if ($DEV)
        puts "Auto-detected NXT at #{$DEV}"
      else
        throw StandardError
      end
    rescue
      $stderr.puts "WARNING: NXT could not be automatically detected! Autodetect only works on Linux"
      # Maybe we're on Win32?
    end
  end
end