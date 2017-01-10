# Google::Places

Ruby library for Google Places API. [more info](https://developers.google.com/places/web-service/intro)

Currently Supported APIs are:
  - [Place Search](https://developers.google.com/places/web-service/search) return a list of places based on a user's location or search string.
  - [Place Details](https://developers.google.com/places/web-service/details) requests return more detailed information about a specific Place, including user reviews.
  - [Place Add](https://developers.google.com/places/web-service/add-place) allow you to supplement the data in Google's Places database with data from your application.
  - [Place Photos](https://developers.google.com/places/web-service/photos) gives you access to the millions of Place related photos stored in Google's Place database.
  - [Place Autocomplete](https://developers.google.com/places/web-service/autocomplete) can be used to automatically fill in the name and/or address of a place as you type.
  - [Query Autocomplete](https://developers.google.com/places/web-service/query) can be used to provide a query prediction service for text-based geographic searches, by returning suggested queries as you type.
  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google-places', '~> 1.0.0'
```

And then execute:

    $ bundle

## Usage

Get API Key from [here](https://developers.google.com/places/web-service/get-api-key#get_an_api_key).


```ruby
API_KEY = 'your_api_key'
client = Google::Places::Client.new(API_KEY)
```

### 1. Place Search
#### Nearby Search
```ruby
client.nearby_search(location, radius, options = {})
```
##### example:
```ruby
response = client.nearby_search('-33.8670522,151.1957362', 50000, type: 'restaurant', keyword: 'cruise')
search_result = response.parsed_response
```

* #### Text Search
* #### Radar Search

### 2. Place Details
```ruby
client.place_details(place_id, options = {})
```
example:
```ruby
response = client.place_details('ChIJN1t_tDeuEmsRUsoyG83frY4', language: 'en')
place_details = response.parsed_response
```

### 3. Place Add
### 4. Place Photos
### 5. Place Autocomplete
### 6. Query Autocomplete

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/OmkarPatil2510/google-places.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
