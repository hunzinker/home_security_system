# DIY RaspberryPi Home Security System

## What's included?
1. `security_api`
  * Example `sinatra` API intended to run on your home LAN to execute camera
    `start` and `stop` commands.
  * see `security_api/README.md`
2. `security_app`
  * Example `rails` web app to view security camera images. This app contains a
    `devise` based admin area for secure image viewing and an API endpoint for
    the webcams to `POST` image metadata.
  * see `security_app/README.md`
3. `security_webcams`
  * RaspberryPi webcam motion detection software plus `start`, `stop` and
    `motion_detected` scripts.

## What do I need to get started?
* RaspberryPi
* RaspberryPi camera
* plus more

If you're not familiar with the RaspberryPi and camera interface, I recommend
giving this [article](http://www.codeproject.com/Articles/665518/Raspberry-Pi-as-low-cost-HD-surveillance-camera)
a read.

## Security System Flow

## Start Motion
```
`security_app` ---> Start ---> `security_api` ---> `start_motion` ---> Notify_`security_app#contacts`
                                                         |
                                                         |
                                                         |
                                                         v
                             `motion_detected` ---> (Optional) Notify_`security_app#contact`
                                                         |
                                                         |
                                                         |
                                                         v
                                                   `upload_file`
                                                   /         \
                                                  /           \
                                                 /             \
                                                v               v
                                     `PUT`_on_`S3`             `POST`_metadata_to_`security_app`
                                      |                        /
                                      |                       /
                                      v                      /
`security_app` ---> Auth ---> View_Images_Videos <-----------
                                   |
                                   |
                                   |
                                   v
                         Create_Signed_S3_URL
                                   |
                                   |
                                   |
                                   v
                                 View
```
### Stop motion
```
`security_app` ---> Stop ---> `security_api` ---> `stop_motion` ---> Notify_`security_app#contacts`
```
