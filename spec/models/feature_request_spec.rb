require 'rails_helper'

RSpec.describe FeatureRequest, type: :model do
  let(:client_a){ create :client, name: 'A' }
  let(:client_b){ create :client, name: 'B' }
  let(:client_c){ create :client, name: 'C' }

  let!(:request_1){ create :feature_request, client: client_a, client_priority: 1}
  let!(:request_2){ create :feature_request, client: client_a, client_priority: 2}
  let!(:request_3){ create :feature_request, client: client_a, client_priority: 3}
  let!(:request_4){ create :feature_request, client: client_b, client_priority: 1}
  let!(:request_5){ create :feature_request, client: client_b, client_priority: 2}
  let!(:request_6){ create :feature_request, client: client_b, client_priority: 3}
  let!(:request_7){ create :feature_request, client: client_c, client_priority: 1}
  let!(:request_8){ create :feature_request, client: client_c, client_priority: 2}
  let!(:request_9){ create :feature_request, client: client_c, client_priority: 3}

  let!(:request_10){ create :feature_request, client: client_a, client_priority: 1}

  let(:a_by_priority){ client_a.feature_requests.order('client_priority asc') }

  it '#sum_gte_priorities shifts priorities' do
    expect(client_a.feature_requests.size).to eq 4
    expect(a_by_priority[0]).to eq request_10
    expect(a_by_priority[1]).to eq request_1
    expect(a_by_priority[2]).to eq request_2
    expect(a_by_priority[3]).to eq request_3

    # TODO add more test cases
  end
end
