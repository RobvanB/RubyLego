#Get the adapter ID
BTDEV=`hcitool dev | awk '{ if( NR == 2 ) print $1 }'`

# Release current connection (if any)
sudo rfcomm release ${BTDEV}

#Find the address of the device
#CLIENTADDR=`hcitool scan | awk '{ if( NR == 2 ) print $1 } '`
# to speed up things we hardcode the address for now
CLIENTADDR=00:16:53:11:CB:1B

# Bind the device to the adapter
sudo rfcomm bind ${BTDEV} ${CLIENTADDR}

# Set permissions
sudo chmod 777 /dev/rfcomm0

echo "Device:"
ls -l /dev/rfcomm*
