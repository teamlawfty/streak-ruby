describe Streak::Webhook do
  let!(:api) { Streak.mock_rest_client = double('RestClient') }
  let(:webhook) { test_webhook }

  describe ".all" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/pipelines/pipeline_key_1/webhooks", 2), nil, nil).
        and_return(test_response([webhook]))

      Streak::Webhook.all("pipeline_key_1")
    end
  end

  describe ".find" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/webhooks/webhook_key_1", 2), nil, nil).
        and_return(test_response(webhook))

      Streak::Webhook.find("webhook_key_1")
    end
  end

  describe ".create" do
    it "should call the api" do
      api.should_receive(:put).
        with(Streak.api_url("/pipelines/pipeline_key_1/webhooks", 2), nil, "event=BOX_CREATE&targetUrl=http://of.dev").
        and_return(test_response(webhook))

      Streak::Webhook.create("pipeline_key_1", {event: 'BOX_CREATE', targetUrl: 'http://of.dev'})
    end
  end

  describe ".edit" do
    it "should call the api" do
      api.should_receive(:put).
        with(Streak.api_url("/webhooks/webhook_key_1", 2), nil, "event=BOX_EDIT&targetUrl=http://of.dev/edit").
        and_return(test_response(webhook))

      Streak::Webhook.edit("webhook_key_1", {event: 'BOX_EDIT', targetUrl: 'http://of.dev/edit'})
    end
  end

  describe ".delete" do
    it "should call the api" do
      api.should_receive(:delete).
        with(Streak.api_url("/webhooks/webhook_key_1", 2), nil, nil).
        and_return(test_response(webhook))

      Streak::Webhook.delete("webhook_key_1")
    end
  end

end
