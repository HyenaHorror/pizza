require "minitest/autorun"
require_relative "pizza.rb"

class Scotts_Test < Minitest::Test

	def test_bool
	  assert_equal(true,true)
	end

	def test_pepperoni_pizza_cost
		menu = menu_return["pizza"]["pepperoni"]
		assert_equal(5.0, menu)
	end

	def test_supreme_pizza_cost
		menu = menu_return["pizza"]["supreme"]
		assert_equal(10.0, menu)
	end

	def test_small_pizza_cost
		menu = menu_return["size"]["small"]
		assert_equal(9.99, menu)
	end

	def test_large_pizza_cost
		menu = menu_return["size"]["large"]
		assert_equal(16.99, menu)
	end

	def test_removing_sausage_from_array
		remove = remove(1, ["pepperoni", "sausage"])
		assert_equal("sausage", remove)
	end

	def test_removing_sausage_from_array
		remove = remove(3, ["pepperoni", "sausage", "jet_fuel", "melts", "steel_beams"])
		assert_equal("melts", remove)
	end

	def test_total_amount
		calc = calc_total([{"item_name"=>"Medium pepperoni", "price"=>17.240000000000002,"size"=>"medium", "qty"=>2},
		{"item_name"=>"Cheesesticks", "price"=>6.5, "qty"=>3},
		{"item_name"=>"Cookie", "price"=>7.0, "qty"=>2},
		{"item_name"=>"Garlic Sauce", "price"=>0.5, "qty"=>2}])
		assert_equal({"subtotal"=>68.98, "tax"=>4.1388, "total"=>73.11880000000001}, calc)
	end

	def test_total_amount_again
		calc = calc_total([{"item_name"=>"Large pepperoni", "price"=>20,"size"=>"large", "qty"=>2},
		{"item_name"=>"Cheesesticks", "price"=>6.5, "qty"=>5},
		{"item_name"=>"Brownie", "price"=>7.0, "qty"=>3},
		{"item_name"=>"Garlic Sauce", "price"=>0.5, "qty"=>10}])
		assert_equal({"subtotal"=>98.5, "tax"=>5.91, "total"=>104.41}, calc)
	end

	def test_add_custom
		custom = add_custom({"item_name"=>"original", "price"=>"12.99",
		"ingreds"=>["pepperoni", "sausage", "italian sausage", "bacon", "stuffed", "regular", "legos"],
		"quantity"=>"1", "size_price"=>"extra large, 18.74"}, [])
		assert_equal([{"item_name"=>"extra large original", "price"=>24.74,
		"ingreds"=>["pepperoni", "sausage", "italian sausage", "bacon", "stuffed", "regular", "legos"],
		"quantity"=>"1", "size"=>"extra large"}], custom)
	end

	def test_add_custom_again
		custom = add_custom({"item_name"=>"original", "price"=>"12.99",
		"ingreds"=>["pepperoni", "italian sausage", "bacon", "stuffed", "regular"],
		"quantity"=>"1", "size_price"=>"extra large, 18.74"}, [])
		assert_equal([{"item_name"=>"extra large original", "price"=>22.74,
		"ingreds"=>["pepperoni", "italian sausage", "bacon", "stuffed", "regular"],
		"quantity"=>"1", "size"=>"extra large"}], custom)
	end

	def test_adding_to_order
		add = add_to_order({"name_price"=>"Medium pepperoni, 17.24", "size"=>"medium", "qty"=>1}, [])
		assert_equal([{"item_name"=>"Medium pepperoni", "price"=>17.24, "qty"=>1}], add)
	end

	def test_adding_to_order_again
		add = add_to_order({"name_price"=>"Large pepperoni, 20.24", "size"=>"large", "qty"=>3}, [])
		assert_equal([{"item_name"=>"Large pepperoni", "price"=>20.24, "qty"=>3}], add)
	end

end

