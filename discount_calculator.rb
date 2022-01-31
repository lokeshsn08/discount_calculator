products = [{
        "fruit": "Milk",
        "Price":3.97,
        "Sale":2,
        "Sale_Price":5.00,
        "Occurence":0
        },
        {
        "fruit": "Bread",
        "Price":2.17,
        "Sale":3,
        "Sale_Price":6.00,
        "Occurence":0
        },
        {
        "fruit": "Banana",
        "Price":0.99,
        "Sale":0,
        "Sale_Price":0,
        "Occurence":0
        },
        {
        "fruit": "Apple",
        "Price":0.89,
        "Sale":0,
        "Sale_Price":0,
        "Occurence":0
        }
      ]
puts "Please enter all the items purchased separated by a comma"
getstring=gets.chomp.split(',')
findedData = []
totalPrice = 0
savedPrice = 0
getstring.map do |data|
  products.each_with_index do |innerdata,index|
    if innerdata[:fruit] == data.capitalize()
      products[index][:Occurence] += 1
    end
  end
end

puts "  "
puts "Item     Quantity      Price"
puts "--------------------------------------"

products.map do |data|
  if data[:Occurence] > 0
    if data[:Occurence] == data[:Sale]
      findPrice = (data[:Sale_Price])
      savedPrice +=(data[:Price]*data[:Occurence])-findPrice if data[:Sale_Price] !=0
      totalPrice += data[:Sale_Price]
      puts "#{data[:fruit]}     #{data[:Occurence]}           $#{data[:Sale_Price]}"
    elsif data[:Occurence] > data[:Sale]
      findPrice = (data[:Occurence]-data[:Sale])*data[:Sale_Price]+data[:Price]
      savedPrice +=(data[:Price]*data[:Occurence])-findPrice if data[:Sale_Price] !=0
      totalPrice += findPrice
      puts "#{data[:fruit]}     #{data[:Occurence]}           $#{findPrice}"
    elsif data[:Occurence] < data[:Sale]
      totalPrice += data[:Price]
      puts "#{data[:fruit]}     #{data[:Occurence]}           $#{data[:Price]}"
    end
  end
end

puts "  "
puts "Total price : $#{totalPrice.round(2)}"
puts "You saved $ #{savedPrice.round(2)} today."
