alphabet = {}
vowels_a = ['a', 'e', 'i', 'o', 'u']
vowels_h ={}

i = 1
('a'..'z').each do |letter|
  alphabet[letter] = i
  i += 1
end

vowels_a.each do |letter|
  vowels_h[letter] = alphabet[letter]
end

puts vowels_h