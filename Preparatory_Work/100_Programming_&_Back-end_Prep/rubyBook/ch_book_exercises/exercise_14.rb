contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts.each do |k, v|
  contact_data.each do |info_array|
    v[:email] = info_array[0]
    v[:address] = info_array[1]
    v[:phone] = info_array[2]
  end
end

puts contacts


