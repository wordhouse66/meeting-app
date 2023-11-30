	include Capybara::DSL
	def visit_page
		visit('/')
		self
	end

	def login_as_member
		visit('/users/sign_in')
		expect(page).to have_content('Sign in to start your session')
		fill_in('user[email]', with: "#{user.email}")
		fill_in('user[password]', with: 'mypassword')
		click_on('Login')
		self
	end

	def submit
		click_on('Create Casting')
		self
	end
