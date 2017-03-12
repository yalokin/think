vowels_a = %w(a e i o u)
vowels_h ={}

('a'..'z').each.with_index(1) do |letter, i|
  vowels_h[letter] = i if vowels_a.include?(letter)
end

puts vowels_h