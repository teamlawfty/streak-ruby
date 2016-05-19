# Streak

Ruby bindings for the Streak API [www.streak.com/api/](http://www.streak.com/api/). Streak is a CRM in your Gmail inbox.

## Installation

Add this line to your application's Gemfile:

    gem 'streak-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install streak-ruby

## Usage

Configure your api key:

    Streak.api_key = '7941e92da6247ab955aab91ec479a4a2'

## Pipelines

Retrieve all pipelines:

    Streak::Pipeline.all

Retrieve one pipeline:

    Streak::Pipeline.find(pipeline_key)

## Boxes

Create a box:

    Streak::Box.create(pipeline_key, { :name => 'My customer' })

Retrieve list of boxes for a pipeline:

    Streak::Box.all(pipeline_key)

Find a single Box:

    Streak::Box.find("box_key_1")

Update a single value of box field:

    Streak::FieldValue.update(box_key, field_key, :value => value)

Update multiple Box fields:

    params = [{key: "1005", value: "test@test.com"}]
    Streak::Box.update_fields("box_key_1", params)

Update Linked Boxes:

    Streak::Box.update_linked_boxes("box_key_1", ["linked_box_key_1"])

Delete a Box:

    Streak::Box.delete(demobox.key)

## Stages

Retrieve list of stages for a pipeline:

    Streak::Stage.all("pipeline_key_1")

Find a single stage:

    Streak::Stage.find("pipeline_key_1", "stage_key_1")

Create a stage:

    Streak::Stage.create("pipeline_key_1", name: "New Stage")

## Fields

Retrieve list of fields for a pipeline:

    Streak::Field.all(pipeline_key)

## Search

Submit a Search query

    Streak::Search.query("box_key_1")

## Webhook (uses api v2)

Retrieve list of webhooks for a pipeline:

    Streak::Webhook.all("pipeline_key_1")

Find a single webhook:

    Streak::Webhook.find("webhook_key_1")

Create a webhook for a pipeline:

    Streak::Webhook.create("pipeline_key_1", {event: 'BOX_CREATE', targetUrl: 'http://www.example.com'})

Edit a webhook:

    Streak::Webhook.edit("webhook_key_1", {event: 'BOX_EDIT', targetUrl: 'http://of.dev/edit'})

Delete a webhook:

    Streak::Webhook.delete("webhook_key_1")

## NOTES

See the complete Streak API reference here: [http://www.streak.com/api/](http://www.streak.com/api/)

This gem currently supports:

* User
* Pipelines
* Boxes
* Stages
* Fields
* Search
* Webhooks
* Reminders (TODO)
* Files (TODO)
* Threads (TODO)
* Comments (TODO)
* Snippets (TODO)
* Newsfeed (TODO)
* Email filters for boxes
* Box's linked boxes

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
