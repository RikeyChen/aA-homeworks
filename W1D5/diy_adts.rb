class Stack

  def initialize
    @stack = []
  end

  def push(el)
    @stack << el
    @stack
  end

  def pop
    @stack.delete_at(-1)
  end

  def peek
    @stack.last
  end

end

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
    @queue
  end

  def dequeue
    @queue.pop
  end

  def peek
    @queue.last
  end

end

class Map

  def initialize
    @map = []
  end

  def set(key, value)
    new_pair = true
    @map.each_with_index do |pair, idx|
      if pair.first == key
        pair[-1] = value
        new_pair = false
        break
      end
    end
    @map << [key,value] if new_pair
    @map
  end

  def get(key)
    @map.find { |pair| pair.first == key }
  end

  def delete(key)
    pair = @map.find { |pair| pair.first == key }
    @map.delete(pair)
  end

  def show
    @map
  end

end
