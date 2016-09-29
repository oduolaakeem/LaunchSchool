require "sequel"

DB = Sequel.connect("postgres://ubuntu:ubuntu@localhost/sequel-multiple-tables")

number_of_tickets = DB[:tickets].count
puts "Number of tickets: #{number_of_tickets}"

number_of_customers_purchased_at_least_one_ticket = DB[:tickets].distinct(:customer_id).count
puts "Number of customer who purchased at least one ticket for one event: #{number_of_customers_purchased_at_least_one_ticket}"

# Exercise 6 by me 
DB[:tickets].select do
     ( count(distinct(tickets__customer_id)).to_f / count(customers__id).to_f * 100.0 ).as(:percent)
end.left_outer_join(:tickets, customer_id: :id).first

# Exercise 6 by LaunchSchool
DB[:customers].select do
     (count(tickets__customer_id).distinct / count(customers__id).distinct.cast(Float) * 100).as(:percent)
   end.left_outer_join(:tickets, customer_id: :id).first

# Exercise 7 by me
DB[:tickets].select do
     [events__name.as(:event_name), count(tickets__event_id).as(:tickets_sold)]
end.join(:events, id: :event_id).group(:event_name).reverse_order(:tickets_sold).first

# Exercise 7 by LaunchSchool
DB[:events].select { [events__name, count(tickets__id)] }.
 left_outer_join(:tickets, event_id: :id).
 group(:events__id).
 order { count(tickets__id) }.reverse.all
 
# Exercise 8 by me same as LaunchSchool
DB[:customers].select do
     [customers__id, customers__email, count(tickets__event_id).distinct]
end.join(:tickets, customer_id: :id).group{[customers__id]}.having{count(tickets__event_id).distinct >= 3}.all

# Exercise 9 by me same as LaunchSchool
DB[:tickets].select do
     [events__name.as(:event_name), events__starts_at, sections__name.as(:section_name), seats__row, seats__number]
end.
join(:events, id: :tickets__event_id).
join(:customers, id: :tickets__customer_id).
join(:seats, id: :tickets__seat_id).
join(:sections, id: :seats__section_id).
where(:customers__email => "gennaro.rath@mcdermott.co").all