require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "add unique products" do
  	cart = Cart.new
  	ruby_book = products(:ruby).id
  	cart.add_product(ruby_book)
  	one_book = products(:one).id
  	cart.add_product(one_book)
  	cart.save
  	assert_equal 1, sum_quantity_in_cart(cart, ruby_book)
  	assert_equal 1, sum_quantity_in_cart(cart, one_book)
  end

  test "add duplicate products" do
  	cart = Cart.new
  	ruby_book = products(:ruby).id
  	cart.add_product(ruby_book)
  	cart.add_product(ruby_book)
  	cart.save
  	assert_equal 2, sum_quantity_in_cart(cart, ruby_book)
  end

  def sum_quantity_in_cart(cart, product_id)  	
  	cart.line_items.where(product_id: product_id).to_a.sum { |item| item.quantity }
  end
end
