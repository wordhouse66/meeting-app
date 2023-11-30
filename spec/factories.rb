FactoryBot.define do     
	factory :user do
		sequence(:email) {|n| "user#{n}@examples.com"}
		password {"mypassword"}
		password_confirmation {"mypassword"}

		# factory :guy do
    #   # sequence(:email) {|n| "guy#{n}@exampler.com"}
		# 	email {'guy@exampler.com'}
		# end
  end
end