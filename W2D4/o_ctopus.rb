def o_ctopus_one
  fish = ['fish', 'fiiish', 'fiiiiish',
   'fiiiish', 'fffish', 'ffiiiiisshh',
    'fsh', 'fiiiissshhhhhh']

  longest_fish = fish[0]
  (0...fish.length).each do |i|
    longest_fish = fish[i] if fish[i].length > longest_fish.length
  end

  longest_fish

end

def o_ctopus_two
  fish = ['fish', 'fiiish', 'fiiiiish',
   'fiiiish', 'fffish', 'ffiiiiisshh',
    'fsh', 'fiiiissshhhhhh']

  longest_fish = fish[0]
  (0...fish.length).each do |i|
    longest_fishy = true
    (0...fish.length).each do |j|
      next if i == j
      if fish[j].length > fish[i].length
        longest_fishy = false
        longest_fish = fish[j]
      end
      return longest_fish if longest_fishy == true
    end
  end
end

class Array
  def merge_sort
    return self if length <= 1
    prc ||= Proc.new { |num1, num2| num1 <=> num2 }

    mid = length/2
    left = take(mid).merge_sort
    right = drop(mid).merge_sort

    merge(left, right, &prc)
  end

  def merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      if prc.call(left[0].length, right[0].length) == -1
        merged << left.shift
      else
        merged << right.shift
      end
    end
    merged.concat(right).concat(left)
  end
end

def octo_merge
  fish = ['fish', 'fiiish', 'fiiiiish',
   'fiiiish', 'fffish', 'ffiiiiisshh',
    'fsh', 'fiiiissshhhhhh']
    fish.merge_sort.last
end

def dancing_octo(direction, tiles)
  tiles.each_with_index do |tile, index|
    return index if direction == tile
  end
end

leg_hash = {  "up" => 0, "right-up" => 1, "right"=> 2, "right-down" => 3,
    "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }

def constant_dance(direction, leg_hash)
  leg_hash[direciton]
end
