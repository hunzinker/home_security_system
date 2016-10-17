class Api::WebcamsController < ApplicationController
  http_basic_authenticate_with name: "name", password: "password"

  protect_from_forgery except: :create

  def contacts
    render plain: contact_list.join(",")
  end

  def create
    @image = Webcam.new(webcam_params)
    if @image.save
      render nothing: true, status: 201
    else
      render json: { errors: @image.errors.full_messages }, status: 422
    end
  end

  private

  def webcam_params
    params.require(:webcam).permit(
      :camera, :image_file_name, :image_content_type, :image_file_size
    )
  end

  def contact_list
    %w(
      number@messaging.sprintpcs.com
      number@tmomail.net
      email@gmail.com
    )
  end
end
