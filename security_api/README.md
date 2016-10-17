# Security API

Example Sinatra app to toggle `arm` and `disarm` commands. This app is designed
to run on a separate box on the webcam LAN.

Tested on:
* 1st gen RaspberryPI B

## Install

* Move `bin/security` to `$HOME/bin` and ensure `$HOME/bin` is in your
  `$PATH`.
* `sudo apt-get update && apt-get upgrade && apt-get install ruby`
* `gem install sinatra`

## Config Settings

* `bin/security` add `user@hostname` to `HOSTS` array
* ssh connection to ALL webcams in `HOSTS` array
  * [Example password less ssh](http://askubuntu.com/questions/46930/how-can-i-set-up-password-less-ssh-login)
* SSL cert
  * [Creating a self signed cert](http://stackoverflow.com/questions/10175812/how-to-create-a-self-signed-certificate-with-openssl)
* Change `app.rb` `username` and `password`.

## Commands

Execute `security -h` for a full list of commands.

* `security -a`
  * Iterates over the `HOSTS` array and executes `start_motion` on
    ALL hosts via ssh
* `security -d`
  * Iterates over the `HOSTS` array and executes `stop_motion` on
    ALL hosts via ssh
* `security -s` prints status (armed/disarmed)

## Start The App

Example `init.d` script:
`su pi -c "ruby /path/to/security_api/app.rb -o IP_ADDRESS >> /path/to/app.log 2>&1"`

## Test

`curl IP_ADDRESS:PORT/status`
`curl IP_ADDRESS:PORT/arm`
`curl IP_ADDRESS:PORT/disarm`
