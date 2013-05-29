class Tree
  attr_accessor :children, :node_name

  # def initialize(name, children={})
  #   @children = children
  #   @node_name = name
  # end

  def initialize(initHash)
    @children = initHash[initHash.keys.to_s]
    @node_name = initHash.keys.to_s
  end

  def visit_all(&block)
    visit &block
    puts "_name: " + node_name.to_s
    puts "children.keys:" + children.keys.to_s 
    children.keys.each {|c|
      puts "***" + c.to_s
      puts "***" + children[c].to_s
      newTree = Tree.new(children[c]) 
      newTree.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end

# ruby_tree = Tree.new( "Ruby",
#   [Tree.new("Reia"),
#    Tree.new("MacRuby")] )

# puts "Visiting a node"
# ruby_tree.visit {|node| puts node.node_name}

# puts "Visiting entire tree"
# ruby_tree.visit_all {|node| puts node.node_name}

puts "Initializer now accepts a nested structure of hashes"
familyTree = {'grandpa' => {'dad' => {'child1' => {}, 'child2' => {} }, 'uncle' => {'child3' => {}, 'child4' => {} }}}
hash_tree = Tree.new(familyTree)
puts "hash_tree created!"

hash_tree.visit_all {|node| puts node.node_name}
puts "hash_tree visited all!"
