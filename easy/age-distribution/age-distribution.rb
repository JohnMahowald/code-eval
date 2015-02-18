def distribute age
  case age
  when 0..2 then "Still in Mama's arms"
  when 3..4 then "Preschool Maniac"
  when 5..11 then "Elementary school"
  when 12..14 then "Middle school"
  when 15..18 then "High school"
  when 19..22 then "College"
  when 23..65 then "Working for the man"
  when 66..100 then "The Golden Years"
  end
end

File.open(ARGV[0]).each_line do |line|
  puts distribute line.to_i
end
