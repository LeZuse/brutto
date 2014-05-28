module BillAppMock
  def bill_app_api_mock(element_name)
    FakeWeb.register_uri :get,
                         api_endpoint(element_name),
                         response: json_response_file(element_name)
  end


private

  def json_response_file(element_name)
    File.join File.dirname(__FILE__),
              'bill_app_responses',
              "#{element_name}.json.txt"
  end

  def api_endpoint(element_name)
    %r[https://.+@.+\.billapp\.cz/#{element_name}\.json]
  end
end

# Disallow all request by default
FakeWeb.allow_net_connect = false

# Allow localhost requests - for Poltergeist
FakeWeb.allow_net_connect = %r[^https?://127\.0\.0\.1]
