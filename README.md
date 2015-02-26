# Carrierwave::Cequel

This gem adds support for Cequel (https://github.com/cequel/cequel) to CarrierWave (https://github.com/carrierwaveuploader/carrierwave).

See the CarrierWave documentation for more detailed usage instructions.

This gem is based off carrierwave-sequel:
https://github.com/carrierwaveuploader/carrierwave-sequel

## Installation

Add this line to your application's Gemfile:

    gem 'carrierwave-cequel', :require => 'carrierwave/cequel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carrierwave-cequel

## Usage

extend CarrierWave::Cequel in order to add the mount_uploader method to your class and then mount the uploader as normal

```
class Profile
  include Cequel::Record
  extend CarrierWave::Cequel

  key    :id, :timeuuid, auto: true
  column :name, :text
  column :avatar, :text

  mount_uploader :avatar, AvatarUploader

end
```

make sure to mount the uploader after you define the keys/columns, otherwise it will not be loaded.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
