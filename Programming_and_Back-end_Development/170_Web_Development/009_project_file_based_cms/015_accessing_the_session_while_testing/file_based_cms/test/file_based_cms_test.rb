ENV["RACK_ENV"] = 'test'

require 'minitest/autorun'
require 'minitest/reporters'
require 'rack/test'
require 'pry'
require 'fileutils'

Minitest::Reporters.use!

require_relative '../file_based_cms'

def create_document(name, content = "")
  File.open(File.join(data_path, name), 'w') do |file|
    file.write(content)
  end
end

class CMSTest < Minitest::Test
  include Rack::Test::Methods
  
  def setup
    FileUtils.mkdir_p(data_path)
  end
  
  def teardown
    FileUtils.rm_rf(data_path)
  end
  
  def app
    Sinatra::Application
  end
  
  def test_index
    create_document("about.md")
    create_document("about.txt")
    create_document("changes.txt")
    create_document("history.txt")
    get '/'
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "about.txt"
    assert_includes last_response.body, "changes.txt"
    assert_includes last_response.body, "history.txt"
  end
  
  def test_file_view
    create_document("history.txt", "this is my history file")
    get '/history.txt'
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "this is my history file"
  end
  
  def test_nonexisting_file
    get '/idonotexist.txt'
    assert_equal 302, last_response.status
    get last_response["Location"]
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'idonotexist.txt does not exist.'
  end
  
  def test_markdown_formated_file
    create_document("about.md", "*italic* and **bold** text examples")
    get '/about.md'
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<em>italic</em>"
    assert_includes last_response.body, "<strong>bold</strong>"
  end
  
  def test_editing_files
    create_document("changes.txt", "empty")
    get '/'
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<a class=\"file_name\" href=\"/changes.txt\">changes.txt</a>\n      <a class=\"edit_link\" href=\"/changes.txt/edit\">edit</a>"
    get '/changes.txt/edit'
    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, "<input type=\"submit\""
  end
  
  def test_updating_document
    create_document("changes.txt")
    post '/changes.txt/edit', file_content: "new content"
    assert_equal 302, last_response.status
    get last_response["Location"]
    assert_includes last_response.body, "changes.txt was updated"
    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end
  
  def test_creating_document
    get '/new'
    assert_equal 200, last_response.status
    assert_includes last_response.body, "Add a new document:"
    post '/create', file_name: ""
    assert_equal 200, last_response.status
    assert_includes last_response.body, "Please enter a valid name, and dont forget the extension."
    post '/create', file_name: "name"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "Please enter a valid name, and dont forget the extension."
    post '/create', file_name: "test.txt"
    assert_equal 302, last_response.status
    get last_response["Location"]
    assert_equal 200, last_response.status
    assert_includes last_response.body, "test.txt was created."
  end
  
  def test_deleting_documents
    create_document("delete_me.txt", "none")
    post "/delete_me.txt/delete"
    assert_equal 302, last_response.status
    get last_response["Location"]
    assert_equal 200, last_response.status
    assert_includes last_response.body, "The file delete_me.txt has been deleted."
    get "/"
    refute_includes last_response.body, "delete_me.txt"
  end
  
  def test_login_in
    post '/users/signin', username: "admin", password: "secret"
    get last_response["Location"]
    assert_equal 200, last_response.status
    assert_includes last_response.body, "Welcome"
    assert_includes last_response.body, "admin"
  end
  
  def test_login_with_empty_arguments
    post '/users/signin', username: "", password: ""
    assert_equal 200, last_response.status
    assert_includes last_response.body, "Please input the right username and password to login."
  end
  
  def test_login_with_empty_password
    post '/users/signin', username: "user", password: ""
    assert_equal 200, last_response.status
    assert_includes last_response.body, "Please input the right username and password to login."
  end
  
  def test_login_with_empty_user
    post '/users/signin', username: "", password: "secret"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "Please input the right username and password to login."
  end
  
  def test_signout_after_signin
    post '/users/signin', username: "admin", password: "secret"
    get last_response["Location"]
    assert_equal 200, last_response.status
    post '/users/signout'
    get last_response["Location"]
    assert_includes last_response.body, "Successfully signed out."
  end
end