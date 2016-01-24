# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '
  
  attr_accessor :title, :description, :done
  
  def initialize(title, description = '')
    @title = title
    @description = description
    @done = false
  end
  
  def done!
    self.done = true
  end
  
  def done?
    done
  end
  
  def undone!
    self.done = false
  end
  
  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title
  
  def initialize(title)
    @title = title
    @todos = []
  end
  
  def <<(todo_item)
    if todo_item.class == Todo
      @todos << todo_item
    else
      raise TypeError, "Can only add Todo objects"
    end
  end
  alias_method :add, :<<
  
  def size
    @todos.size
  end
  
  def first
    @todos.first
  end
  
  def last
    @todos.last
  end
  
  def item_at(index)
    @todos.fetch(index)
  end
  
  def mark_done_at(index)
    item_at(index).done!
  end
  
  def mark_undone_at(index)
    item_at(index).undone!
  end
  
  def done!
    each do |todo|
      todo.done!
    end
  end
  alias_method :mark_all_done, :done!
  
  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end
  
  def shift
    @todos.shift
  end
  
  def pop
    @todos.pop
  end
  
  def done?
    result = true
    each do |todo|
      result = result && todo.done?
    end
    result
  end
  
  def remove_at(index)
    @todos.delete(item_at(index))
  end
  
  def to_s
    output = ""
    output << "---- #{title} ----\n"
    @todos.each do |todo|
      output << todo.to_s + "\n"
    end
    output
  end
  
  def to_a
    @todos
  end
  
  def each
    @todos.each do |todo|
      yield todo
    end
    self
  end
  
  def select
    new_list = TodoList.new("Selected Todos")
    each do |todo|
      new_list << todo if yield todo
    end
    
    new_list
  end
  
  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end
  
  def all_done
    select { |todo| todo.done? }
  end
  
  def all_not_done
    select { |todo| !todo.done? }
  end
  
  def mark_done(str)
    find_by_title(str).done! if find_by_title(str)
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

# todo1.done!
list.mark_done("xavier")
todo2.done!

# list.done!
# list.mark_all_done

puts list.all_done
puts "-------------"
puts list.all_not_done
puts list
# list.mark_all_undone

# puts list.all_done
# puts "-------------"
# puts list.all_not_done