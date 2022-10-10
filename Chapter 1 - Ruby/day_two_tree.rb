class Tree
    attr_accessor :children, :node_name

    def initialize(name, children=[])
        @children = children
        @node_name = name
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

class TreeHash
    attr_accessor :tree

    def initialize(tree = {})
        @tree = tree
    end

    def visit_all(&block)
        recursive_visit_all(tree, &block)
    end

    def visit(who, &block)
        block.call who
    end

    def recursive_visit_all(who, &block)
        who.each_pair do |k, v|
            visit(k, &block)
            if v.empty? == false then recursive_visit_all(v, &block) end
        end
    end
end

ruby_tree = TreeHash.new({'grandpa' => { 'dad' => { 'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}} }})

# ruby_tree = Tree.new( "Ruby", 
#     [Tree.new("Reia"), 
#     Tree.new("MacRuby")])

# puts "Visiting a node"
# ruby_tree.visit 'ss' {|node| puts node}
puts
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node}