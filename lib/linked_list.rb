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

  def pop
    return nil if @size.zero?

    removed_node = @size == 1 ? pop_single_node : pop_last_node
    @size -= 1

    removed_node
  end

  def pop_single_node
    node_to_remove = @head
    @head = nil
    @tail = nil

    node_to_remove
  end

  def pop_last_node
    node_to_remove = at(@size - 1)
    new_tail = at(@size - 2)
    new_tail.next_node = nil
    @tail = new_tail
  end

  def contains?(value)
    current_node = @head

    @size.times do
      return true if current_node.value == value

      current_node = current_node.next_node
    end

    false
  end

  def find(value)
    current_node = @head

    @size.times do |index|
      return index if current_node.value == value

      current_node = current_node.next_node
    end

    puts 'Value not found.'
  end

  def to_s
    current_node = @head
    list_string = String.new('')

    @size.times do |index|
      list_string << "( #{current_node.value} )"
      list_string << ' -> ' unless index == @size - 1
      current_node = current_node.next_node
    end

    list_string
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
