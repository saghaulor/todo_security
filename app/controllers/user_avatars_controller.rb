require 'open-uri'

class UserAvatarsController < ApplicationController
  def show
    user = User.find(params[:id])
    if user && user.avatar_url
      if stale?(user)
        send_data(open(user.avatar_url).read, disposition: 'inline', filename: File.basename(user.avatar_url))
      end
    else
      render nothing: true, status: :not_found
    end
  end
end

