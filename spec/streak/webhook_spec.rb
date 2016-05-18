describe Streak::Webhook do
  let!(:api) { Streak.mock_rest_client = double('RestClient') }
  let(:webhook) { test_webhook }

  describe ".all" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/pipelines/pipeline_key_1/webhooks"), nil, nil).
        and_return(test_response([webhook]))

      Streak::Webhook.all("pipeline_key_1")
    end
  end

  describe ".find" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/webhooks/webhook_key_1"), nil, nil).
        and_return(test_response(webhook))

      Streak::Webhook.find("webhook_key_1")
    end
  end

  describe ".create" do
    it "should call the api" do
      api.should_receive(:put).
        with(Streak.api_url("/pipelines/pipeline_key_1/webhooks"), nil, "event=BOX_CREATE&targetUrl=http://of.dev").
        and_return(test_response(webhook))

      Streak::Webhook.create("pipeline_key_1", {event: 'BOX_CREATE', targetUrl: 'http://of.dev'})
    end
  end
end
