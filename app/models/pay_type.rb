class PayType < ActiveRecord::Base
	def self.types_names
		select(:name).map { |pt| pt.name }
	end
end
