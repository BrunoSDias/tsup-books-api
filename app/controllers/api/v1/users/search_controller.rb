class Api::V1::Users::SearchController < Api::V1::ApiController
  def by_token
    decoded_data = JWT.decode(request.headers['authorization'].split(' ')[1], Rails.application.credentials.devise_jwt_secret_key!)
    render json: User.find(decoded_data[0]["sub"]), status: :ok
  end

  def show_data(content)
    puts "============="
    puts content.inspect
    puts "============="
  end
end