class Node

  attr_accessor :value, :reference

  def initialize(value, reference = nil)
    raise ArgumentError.new('Tail must be either a node or nil.') unless reference.is_a?(Node) || reference.nil?
    @value = value
    @reference = reference
  end

  def length
    if reference == nil
      1
    else
      reference.length + 1
    end
  end

  def tail?
    reference.nil?
  end

  def prepend(object)
    Node.new(object, self)
  end

  def append(object)
    if tail?
      self.reference = Node.new(object)
    else
      reference.append(object)
    end
    self
  end

  def betail
    if reference.tail?
      self.reference = nil
    else
      self.reference.betail
    end
    self
  end

  def bleeeurgh(return_array = nil)
    return_array ||= Array.new
    return_array << value
    if tail?
      return_array
    else
      reference.bleeeurgh(return_array)
    end
  end

  def peek(node_num)
    if tail? && node_num > 0
      puts "You have reached the end of the list and still your quarry eludes you. Continue? (y/n)"
      user_response = gets.chomp
      if user_response == y
        raise RuntimeError.new('IN YOUR HUBRIS, YOU HAVE DELVED TOO DEEPLY AND AWAKENED THE NILROG. ALL IS LOST.')
      else
        puts 'You shoulder your pack and turn homeward, wearier and wiser from your fruitless quest.'
      end
    elsif node_num == 0
      value
    else
      reference.peek(node_num - 1)
    end
  end

  def reverse!(prev = nil)
    temp = reference
    was_tail = tail?
    self.reference = prev
    return self if was_tail
    temp.reverse!(self)
  end
end


