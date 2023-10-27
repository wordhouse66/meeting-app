module ClientsHelper
  def fullname(client)
		client.first_name.capitalize + " " + client.last_name.capitalize
	end
end
