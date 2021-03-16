class GeoRoutes < Application
  get '/coordinates' do
    cities = Geocoder.search(params[:city])

    if cities.empty?
      response = { errors: {detail: 'Данного города не существует'} }

      status 400
      return json response
    end

    coor = {}
    coor[:lat], coor[:lon] = cities .first.coordinates
    response = {data: coor}

    json response
  end
end