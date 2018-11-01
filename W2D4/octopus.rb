# Sluggish Octopus

def sluggish_octopus(array)
  longest_fish = nil
  array.each_index do |idx1|
    longest_fish = array[idx1] if longest_fish.nil?
    array.each_index do |idx2|
      if idx2 > idx1
        longest_fish = array[idx2] if array[idx2].length > longest_fish.length
      end
    end
  end
  longest_fish
end

# Dominant Octopus

def merge_sort(array, &prc)
  prc ||= proc { |x, y| x <=> y }
  return array if array.length <= 1

  mid_idx = array.length / 2

  s_left = merge_sort(array.take(mid_idx), &prc)
  s_right = merge_sort(array.drop(mid_idx), &prc)

  merge(s_left, s_right, &prc)
end

def merge(left, right, &prc)
  result = []

  until left.empty? || right.empty?
    if prc.call(left.first, right.first) == 1
      result << right.shift
    else
      result << left.shift
    end
  end
  result + left + right
end

def dominant_octopus_search(fishes)
  merge_sort(fishes) { |x, y| y.length <=> x.length }.first
end


#Clever octopus

def clever_octopus_search(fishes)
  longest = nil

  fishes.each do |fish|
    if longest.nil? || fish.length > longest.length
      longest = fish
    end
  end
  longest
end

# Dancing Octopus

def slow_dance(direction, tiles)
  tiles.each_index do |tile_idx|
    return tile_idx if tiles[tile_idx] == direction
  end
  nil
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
