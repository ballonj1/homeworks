class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    if @map.any? {|key_val_pair| key_val_pair.include?(key)}
      @map = @map.reject {|key_val_pair| key_val_pair.include?(key)}
      @map << [key, value]
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    @map.select {|key_val_pair| key_val_pair.include?(key)}.flatten[-1]
  end

  def remove(key)
    @map.reject {|key_val_pair| key_val_pair.include?(key)}
  end

  def show
    @map
  end
end
