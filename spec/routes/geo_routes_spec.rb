RSpec.describe GeoRoutes, type: :routes do
  describe '/coordinates' do
    context 'when filled existed city' do
      it 'returns coordinates hash' do
        get '/coordinates', city: 'Екатеринбург'

        aggregate_failures do
          expect(last_response.status).to eq 200
          expect(response_body['data']).to include(
            "lat" => 56.839104, "lon" => 60.60825
          )
        end
      end
    end

    context 'when filled city does not exists' do
      it 'returns coordinates hash' do
        get '/coordinates', city: '123qweasd'

        aggregate_failures do
          expect(last_response.status).to eq 400
          expect(response_body['errors']).to include(
            'detail' => 'Данного города не существует'
          )
        end
      end
    end
  end
end