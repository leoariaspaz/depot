require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  setup do
    @order = orders(:one)
  end

  test "order_received" do
    mail = Notifier.order_received(@order)
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "order_shipped" do
    mail = Notifier.order_shipped(@order)
    assert_equal "Pragmatic Order Store Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td>1 &times; <\/td><td>Programming Ruby 1.9<\/td>/, mail.body.encoded.gsub(/[\t\r\n]/, '')
  end

end
