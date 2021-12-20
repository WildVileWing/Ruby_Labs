load 'Resource.rb'
class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    @posts.each.with_index do |post, index |
      puts "id: #{index+1} #{post}"
    end
  end

  def show
    puts "Type index of the post: "
    id = gets.to_i

    if id > 0
      puts "id: #{id} #{@posts[id-1]}"
    else
      puts "Wrong id, must be  higher than zero"
    end
  end

  def create
    puts "Type text of the post"
    post_text = gets.chomp
    @posts.push(post_text)
    puts "Post: #{post_text}\n id: #{@posts.find_index(post_text)+1}"
  end

  def update
    puts "Type index of the post"
    id = gets.to_i
    puts "Enter new text: "
    new_text = gets.chomp
    @posts[id-1] = new_text
    index
  end

  def destroy
    puts "Enter index of destroying post:"
    id = gets.to_i
    @posts.delete_at(id-1)
  end
end