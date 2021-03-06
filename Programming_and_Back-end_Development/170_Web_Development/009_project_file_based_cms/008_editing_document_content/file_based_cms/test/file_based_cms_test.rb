ENV["RACK_ENV"] = 'test'

require 'minitest/autorun'
require 'minitest/reporters'
require 'rack/test'
require 'pry'
Minitest::Reporters.use!

require_relative '../file_based_cms'

class CMSTest < Minitest::Test
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end
  
  def test_index
    get '/'
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "about.txt"
    assert_includes last_response.body, "changes.txt"
    assert_includes last_response.body, "history.txt"
  end
  
  def test_file_view
    get '/history.txt'
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "2013 - Ruby 2.0 released."
  end
  
  def test_nonexisting_file
    get '/idonotexist.txt'
    assert_equal 302, last_response.status
    get last_response["Location"]
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'idonotexist.txt does not exist.'
  end
  
  def test_markdown_formated_file
    get '/about.md'
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<em>italic</em>"
    assert_includes last_response.body, "<strong>bold</strong>"
  end
  
  def test_editing_files
    get '/'
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<a href=\"/changes.txt\">changes.txt</a> - <a href=\"/changes.txt/edit\">edit</a>"
    get '/changes.txt/edit'
    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, "<input type=\"submit\""
  end
  
  def test_updating_document
    post '/changes.txt/edit', file_content: "new content"
    assert_equal 302, last_response.status
    get last_response["Location"]
    assert_includes last_response.body, "changes.txt was updated"
    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end
end