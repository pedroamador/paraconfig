# paraconfig

My little script to automate setup new machine

## Usage

As root, execute

`./paraconfig.sh [destination_host]`

Example:

`./paraconfig mail`

You should have a key pair and the destination root user password

You can also download the script and execute it "on the fly" without cloning the repository

`wget -O - https://raw.githubusercontent.com/pedroamador/paraconfig/master/_pcclient |bash -C`
