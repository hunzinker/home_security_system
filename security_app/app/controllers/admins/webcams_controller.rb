class Admins::WebcamsController < ApplicationController
  before_action :authenticate_admin!

  def index
    webcam = Webcam.where(image_content_type: "image/jpeg")

    @camera = webcam.where("camera = ?", query)
  end

  def video
    webcam = Webcam.where(image_content_type: "application/ogg")

    @camera = webcam.where("camera = ?", query)
  end

  def delete_images
    Webcam.destroy_all
    redirect_to admins_webcams_path, notice: "All images deleted"
  end

  def status
    render text: SecurityApi.status
  end

  def toggle
    if status_valid?
      resp = SecurityApi.action(params["status"])
      render text: resp, status: resp
    else
      render text: 422, status: 422
    end
  end

  def security; end

  private

  def status_valid?
    ["armed", "disarmed"].include?(params["status"])
  end

  def query
    params["q"] || ""
  end
end
