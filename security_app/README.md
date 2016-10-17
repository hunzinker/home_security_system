# Security App

Example Rails based security app for Raspberry Pi home security system.

## Features
* Devise based admin area to view webcam images and videos
* Webcam API

## Dependencies
* MySQL >= 5.5
* Ruby >= 2

## Settings
* Set API user / pass `app/controllers/api/webcams_controller.rb`
* Set the `SecurityApi` `host`, `user` and `pass`.
* AWS keys for `paperclip` `config/paperclip_storage.yml S3 storage
* [Devise
  Settings](https://github.com/plataformatec/devise/blob/master/README.md)
* [Paperclip](https://github.com/thoughtbot/paperclip/blob/v4.3.7/README.md)
* [AWS](https://aws.amazon.com/)

## Installation

`bundle install`

`bundle exec rails s`
