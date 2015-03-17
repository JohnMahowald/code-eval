def pangram? str
  pangram = {}.tap do |pg|
    ("a".."z").each do |l|
      pg[l] = false
    end
  end

  str.each_char do |char|
    next unless char =~ /\w/
    pangram[char.downcase] = true
  end

  remain = pangram.select { |letter, val| !val }

  remain.empty? ? "NULL" : remain.keys.join
end

File.readlines(ARGV[0]).each do |line|
  puts pangram?(line)
end
