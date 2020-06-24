## Sensu-Plugins-nexmo

[![Gem Version](https://badge.fury.io/rb/sensu-plugins-nexmo.svg)](https://badge.fury.io/rb/sensu-plugins-nexmo.svg)
[![Sensu Bonsai Asset](https://img.shields.io/badge/Bonsai-Download%20Me-brightgreen.svg?colorB=89C967&logo=sensu)](https://bonsai.sensu.io/assets/boutetnico/sensu-plugins-nexmo)

## This is an unofficial fork

This fork is automatically tested, built and published to [RubyGems](https://rubygems.org/gems/sensu-plugins-nexmo/) and [Bonsai](https://bonsai.sensu.io/assets/boutetnico/sensu-plugins-nexmo).

## Files

 * bin/check-nexmo-balance.rb
 * bin/handler-nexmo.rb

## Usage

**check-nexmo-balance**
```bash
./check-nexmo-balance.rb -k API_KEY -s API_SECRET
./check-nexmo-balance.rb -k API_KEY -s API_SECRET -w 30 -c 15
```

**handler-nexmo**
```json
{
  "nexmo":{
    "api_key": "ABCDEF",
    "api_secret": "s3cr3t",
    "from": "Sensu",
    "recipients": [
      "00000000000"
    ]
  }
}
```

## Installation

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)
