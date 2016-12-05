require 'byebug'

class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
      return
    end
    BinarySearchTree.insert!(@root, value)

  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)

  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)

  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    return BSTNode.new(value) if node.nil?

    if value <= node.value
      node.left = insert!(node.left, value)
    else
      node.right = insert!(node.right, value)
    end

    return node

  end

  def self.find!(node, value)
    return nil if node.nil?

    case value <=> node.value
    when -1
      return nil if node.left.nil? #Ran out of nodes and didn't find the value
      return find!(node.left, value)
    when 0
      return node #Found the node
    when 1
      return nil if node.right.nil? #Ran out of nodes and didn't find the value
      return find!(node.right, value)
    end
  end

  def self.preorder!(node)
    return [] if node.nil?

    return [node.value] + preorder!(node.left) + preorder!(node.right)
  end

  def self.inorder!(node)
    return [] if node.nil?

    return inorder!(node.left) + [node.value] + inorder!(node.right)
  end

  def self.postorder!(node)
    return [] if node.nil?

    return postorder!(node.left) + postorder!(node.right) + [node.value]
  end

  def self.height!(node)
    return -1 if node.nil?

    return 0 if (node.left.nil? && node.right.nil?) #node is a leaf

    left_height = 1 + height!(node.left)
    right_height = 1 + height!(node.right)

    return left_height >= right_height ? left_height : right_height

  end

  def self.max(node)
    return nil if node.nil?

    if node.right
      return max(node.right)
    else
      return node
    end

  end

  def self.min(node)
    return nil if node.nil?

    if node.left
      return min(node.left)
    else
      return node
    end


  end

  def self.delete_min!(node)
    return nil if node.nil?

    if node.left
      node.left = delete_min!(node.left)
    else
      return node.right
    end

  end

  def self.delete!(node, value)
    return nil if node.nil?

    case value <=> node.value
    when -1
      node.left = delete!(node.left, value)
    when 1
      node.right = delete!(node.right, value)
    when 0
      return node.left if node.right.nil?
      return node.right if node.left.nil?
    end
  end
end
