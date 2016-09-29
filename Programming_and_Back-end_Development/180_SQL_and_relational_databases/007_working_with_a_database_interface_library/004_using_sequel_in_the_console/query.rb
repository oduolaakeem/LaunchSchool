require 'sequel'

DB = Sequel.connect("postgres://ubuntu:ubuntu@localhost/sequel-single-table")

result = DB[:menu_items].select{ 
            [item, 
            menu_price, 
            ingredient_cost, 
            (prep_time * 12.00 / 60.00).as(labor), 
            (menu_price - ingredient_cost - (prep_time * 12.00 / 60.00)).as(profit)]
          }.all
          
result.each do |dish|
  puts <<-OUTPUT  
    #{dish[:item]}
    menu price: $#{dish[:menu_price].to_f}
    ingredient cost: $#{dish[:ingredient_cost].to_f}
    labor: $#{dish[:labor].to_f}
    profit: $#{dish[:profit].to_f}

  OUTPUT
end