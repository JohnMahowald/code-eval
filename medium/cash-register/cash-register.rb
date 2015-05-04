CHANGE_IN_WORDS = {
  1 => 'PENNY', 
  5 => 'NICKEL', 
  10 => 'DIME',
  25 => 'QUARTER',
  50 => 'HALF DOLLAR',
  100 => 'ONE',
  200 => 'TWO',
  500 => 'FIVE',
  1000 => 'TEN',
  2000 => 'TWENTY',
  5000 => 'FIFTY',
  10000 => 'ONE HUNDRED'
}

CHANGE = CHANGE_IN_WORDS.keys.sort.reverse!

def cash_register charge, paid
  return "ERROR" if charge > paid

  coins = []
  change = (paid - charge).round(2) * 100

  return "ZERO" if change == 0

  CHANGE.each do |val|
    while change >= val && change > 0
      change -= val
      coins << CHANGE_IN_WORDS[val]
    end
  end

  coins.join(",")
end

File.open(ARGV[0]).each_line do |line|
  charge, paid = line.split(";").map(&:to_f)
  puts cash_register(charge, paid)
end
