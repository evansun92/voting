module Payable
  extend ActiveSupport::Concern

  def gateway
    @gateway ||= Braintree::Gateway.new(
      environment: ENV['paypal_environment'].to_sym,
      merchant_id: ENV['paypal_merchant_id'],
      public_key: ENV['paypal_public_key'],
      private_key: ENV['paypal_private_key']
      # environment: :sandbox,
      # merchant_id: '8x2h6y6rh59ccsw3',
      # public_key: 'dnnfsypt2kfxmyxj',
      # private_key: 'fae8c26052dfc427e816b3619f83e9b7'
    )
  end

  included do
  end

  class_methods do
  end
end
  