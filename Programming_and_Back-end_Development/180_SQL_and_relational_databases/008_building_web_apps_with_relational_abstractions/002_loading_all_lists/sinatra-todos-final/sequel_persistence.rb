require "sequel"

class SequelPersistence
  def initialize(logger)
    @db = Sequel.connect("postgres://ubuntu:ubuntu@localhost/todos")
    @db.loggers << logger
  end
  
  def query(statement, *params)
    @logger.info "#{statement}: #{params}"
    @db.exec_params(statement, params)
  end
  
  def create_list(name)
    sql = "INSERT INTO lists (name) VALUES ($1)"
    query(sql, name)
  end
  
  def delete_list(id)
    sql_todos = "DELETE FROM todos WHERE list_id = $1"
    query(sql_todos, id)
    
    sql_lists = "DELETE FROM lists WHERE id = $1"
    query(sql_lists, id)
  end

  def find_list(id)
    sql = "SELECT * FROM lists WHERE id = $1"
    sql = <<-SQL
      SELECT lists.*,
        COUNT(todos.id) AS todos_count,
        COUNT(NULLIF(todos.is_completed, true)) AS todos_remaining_count
        FROM lists 
        LEFT JOIN todos ON todos.list_id = lists.id
        WHERE lists.id = $1
        GROUP BY lists.id
        ORDER BY lists.name;
    SQL
    result = query(sql, id)
  
    tuple = result.first
    
    tuple_to_list_hash(tuple)
  end
  
  def all_lists
    @db[:lists].left_join(:todos, list_id: :id).
      select_all(:lists).
      select_append do
        [ count(todos__id).as(:todos_count), 
          count(nullif(todos__is_completed, true)).as(todos_remaining_count) ]
      end.
      group(:lists__id).
      order(:lists__name)
  end
  
  def update_list_name(id, new_name)
    sql = "UPDATE lists SET name = $1 WHERE id = $2"
    query(sql, new_name, id)
  end
  
  def create_new_todo(list_id, todo_name)
    sql = "INSERT INTO todos (name, list_id) VALUES ($1, $2)"
    query(sql, todo_name, list_id)
  end
  
  def delete_todo_from_list(list_id, todo_id)
    sql = "DELETE FROM todos WHERE id = $1 AND list_id = $2"
    query(sql, todo_id, list_id)
  end
  
  def update_todo_status(list_id, todo_id, new_status)
    sql = "UPDATE todos SET is_completed = $1 WHERE list_id = $2 AND id = $3"
    query(sql, new_status, list_id, todo_id)
  end
  
  def mark_all_todos_as_completed(list_id)
    sql = "UPDATE todos SET is_completed = true WHERE list_id = $1"
    query(sql, list_id)
    # list = find_list(list_id)
    # list[:todos].each do |todo|
    #   todo[:completed] = true
    # end
  end
  
  def find_todos_for_list(list_id)
    todo_sql = "SELECT * FROM todos WHERE list_id = $1"
    todos_result = query(todo_sql, list_id)
    
    todos_result.map do |todo_tuple|
      { id: todo_tuple["id"].to_i, 
        name: todo_tuple["name"], 
        completed: todo_tuple["is_completed"] == "t" ? true : false
      }
    end
  end
  
  private
  
  def tuple_to_list_hash(tuple)
    { id: tuple["id"],
      name: tuple["name"],
      todos_count: tuple["todos_count"].to_i,
      todos_remaining_count: tuple["todos_remaining_count"].to_i,
    }
  end
end