# merge_diferences.rb

hash1 = {a: 1, b: 2, c: 3}
hash2 = {d: 4, e: 5, f: 6}

puts "Given the hash1 =  #{hash1} and hash2 = #{hash2}, merge will return " + hash1.merge(hash2).to_s
puts "hash1 and hash2 will remain the same. As follows: hash1 = #{hash1}. hash2 = #{hash2}\n\n\n"


hash1 = {a: 1, b: 2, c: 3}
hash2 = {d: 4, e: 5, f: 6}

puts "Given the hash1 =  #{hash1} and hash2 = #{hash2}, merge! will return " + hash1.merge!(hash2).to_s
puts "hash1 will be modified and hash2 will remain the same. As follows: hash1 = #{hash1}. hash2 = #{hash2}\n\n"
