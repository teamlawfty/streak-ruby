describe Streak::Box do
  let!(:api) { Streak.mock_rest_client = double('RestClient') }
  let(:box) { test_box }

  describe ".all" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/boxes"), nil, nil).
        and_return(test_response([box]))

      Streak::Box.all
    end

    context "for a pipeline" do
      it "should call the api" do
        api.should_receive(:get).
          with(Streak.api_url("/pipelines/pipeline_key_1/boxes"), nil, nil).
          and_return(test_response([box]))

        Streak::Box.all("pipeline_key_1")
      end
    end
  end

  describe ".find" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/boxes/box_key_1"), nil, nil).
        and_return(test_response(box))

      Streak::Box.find("box_key_1")
    end
  end

  describe ".create" do
    it "should call the api" do
      api.should_receive(:put).
        with(Streak.api_url("/pipelines/pipeline_key_1/boxes"), nil, "name=Great+Vendor").
        and_return(test_response(box))

      Streak::Box.create("pipeline_key_1", :name => "Great Vendor")
    end
  end

  describe ".delete" do
    it "should call the api" do
      api.should_receive(:delete).
        with(Streak.api_url("/boxes/box_key_1"), nil, nil).
        and_return(test_response(box))

      Streak::Box.delete("box_key_1")
    end
  end

  describe ".update" do
    it "should call the api" do
      api.should_receive(:post).
        with(Streak.api_url("/boxes/box_key_1"), nil, "{\"name\":\"Greatest Vendor\"}").
        and_return(test_response(box))

      Streak::Box.update("box_key_1", :name => "Greatest Vendor")
    end
  end

  describe ".update_linked_boxes" do
    it "should call the api" do
      api.should_receive(:post).
        with(Streak.api_url("/boxes/box_key_1"), nil, "{\"linkedBoxKeys\":[\"linked_box_key_1\"]}").
        and_return(test_response(box))

      Streak::Box.update_linked_boxes("box_key_1", ["linked_box_key_1"])
    end
  end

  # def self.update_linked_boxes(key, linked_box_keys)
  #     res = Streak.request(:post, "/boxes/#{key}", MultiJson.dump({'linkedBoxKeys' => linked_box_keys}))
  #     convert_to_streak_object(res, Box)
  #   end

 describe ".update_fields" do
    it "should call the api" do
      api.should_receive(:post).
        with(Streak.api_url("/boxes/box_key_1/fields"), nil, "[{\"key\":\"1005\",\"value\":\"test@test.com\"}]").
        and_return(test_response(box))

      params = [{key: "1005", value: "test@test.com"}]
      Streak::Box.update_fields("box_key_1", params)
    end
  end

  describe ".update_field" do
    it "should call the api" do
      api.should_receive(:post).
        with(Streak.api_url("/boxes/box_key_1/fields/1001"),nil,"{\"value\":\"somevalue\"}").
        and_return(test_response(test_field_value({"key"=>"1001","value" =>"somevalue"})))

      Streak::Box.update_field("box_key_1","1001","somevalue")
    end
  end
end
