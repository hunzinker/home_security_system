# RaspberryPi Home Security Webcams

This code should run on your RaspberryPi(s) with camera attachment!

## Suggested Hardware
* Raspberry Pi 2 B+
* Raspberry Pi 5MP 1080P Camera NoIR

## Dependencies
* [Motion](http://www.lavrsen.dk/foswiki/bin/view/Motion/WebHome)
* Email / SMS messages sent via [msmtp](http://msmtp.sourceforge.net/).

## Install
* Configure your RaspberryPi(s)
* Move items in bin to `host:$HOME/bin` and ensure `$HOME/bin` in is your `$PATH`.
* Create `$HOME/motion`, `$HOME/motion/log` and `$HOME/motion/media`.
* Move `$HOME/bin/motion` to `$HOME/motion/`.
* Move `conf/motion.conf` to `$HOME/motion/`.
* Move `conf/security` to $HOME/.security.

## Configure

### `config/motion.conf`

It's a good idea to familiarize yourself with this file since `montion` has many
options. The config is designed to work assuming proper installation.

Default Options:
* PID, log, image and video files are stored under `/home/pi/motion`
* `on_picture_save` executes `bin/upload_file`
* `on_motion_detected` is disabled by default. If enabled, executes
  `bin/motion_detected`
* `on_movie_end` executes `bin/upload_file`

### `config/security`

This file contains ALL of the variables needed for the above scripts.

* `CAMERA` camera name ex: camera1
* `AWS_*` AWS / S3 configs
* `HOST` example `security_app` hostname
* `API_*` example `security_app` API configs
* `MESSAGE` stores the list of numbers and emails to notify on `start`, `stop`
  and `motion_detected`. See
`security_app/app/controllers/api/webcams_controller.rb#contacts`

## Run
* Assuming the above is correct, start the camera via `$HOME/bin/start_motion`
