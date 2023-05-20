# frozen_string_literal: true

class LinkedList

  attr_accessor :size, :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    if @size.zero?
      @tail = Node.new(value)
      @head = @tail
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end

    @size += 1
  end

  def prepend(value)
    if @size.zero?
      @head = Node.new(value)
      @tail = @head
    else
      @head = Node.new(value, head)
    end

    @size += 1
  end

  def at(index)
    return nil if index.negative? || index >= @size

    current_node = @head
    current_index = 0

    while current_index < index
      current_node = current_node.next_node
      current_index += 1
    end

    current_node
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
