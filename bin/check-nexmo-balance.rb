#!/usr/bin/env ruby
#
#   check-nexmo-balance.rb
#
# DESCRIPTION:
#   Check Nexmo account balance.
#
# OUTPUT:
#   plain-text
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#   gem: nexmo
#
# USAGE:
#   ./check-nexmo-balance.rb -k API_KEY -s API_SECRET
#   ./check-nexmo-balance.rb -k API_KEY -s API_SECRET -w 30 -c 15
#
# NOTES:
#
# LICENSE:
#   Copyright (c) 2019, Nicolas Boutet amd3002@gmail.com
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/check/cli'
require 'nexmo'

class CheckNexmoBalance < Sensu::Plugin::Check::CLI
  option :api_key,
         short:       '-k API_KEY',
         long:        '--api-key API_KEY',
         description: 'Your Nexmo API Key',
         required:    true

  option :api_secret,
         short:       '-s API_SECRET',
         long:        '--api-secret API_SECRET',
         description: 'Your Nexmo API Secret',
         required:    true

  option :warning,
         short:       '-w N',
         long:        '--warning VALUE',
         description: 'Issue a warning if account balance is below VALUE',
         default:     10,
         proc:        proc(&:to_i)

  option :critical,
         short:       '-c N',
         long:        '--critical VALUE',
         description: 'Issue a critical if account balance is below VALUE',
         default:     5,
         proc:        proc(&:to_i)

  def run()
    client = Nexmo::Client.new(
      api_key: config[:api_key],
      api_secret: config[:api_secret]
    )

    balance = client.account.balance.value.round(2)

    if config[:critical] > 0 && balance < config[:critical]
      critical "Balance is #{balance} EUR which is below #{config[:critical]} EUR"
    elsif config[:warning] > 0 && balance < config[:warning]
      warning "Balance is #{balance} EUR which is below #{config[:warning]} EUR"
    end

    ok

  end

end
