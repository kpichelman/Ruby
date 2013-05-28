class Tree
  attr_accessor :children, :node_name

  # def initialize(name, children={})
  #   @children = children
  #   @node_name = name
  # end

  def initialize(hash)
    @children = hash.values
    @node_name = hash.keys.to_s
  end

  def visit_all(&block)
    puts "1"
    visit &block
    puts "2"
    children.each {|c| c.visit_all &block}
    puts "3"
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

puts "Initializer new accepts a nested structure of hashes"
familyTree = {'grandpa' => {'dad' => {'child1' => {}, 'child2' => {} }, 'uncle' => {'child3' => {}, 'child4' => {} }}}
hash_tree = Tree.new(familyTree)
hash_tree.visit_all {|node| puts node.node_name}
