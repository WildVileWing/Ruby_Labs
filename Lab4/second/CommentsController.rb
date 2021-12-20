load 'Resource.rb'
class CommentsController
  extend Resource

  def initialize
    @comments = []
  end

  def index
    @comments.each.with_index do |comment, index|
      puts "id: #{index+1} #{comment}"
    end
  end

  def show
    puts "Type index of the comment: "
    id = gets.to_i
    if id > 0
      puts "id: #{id} #{@comments[id-1]}"
    else
      puts "Wrong id, must be  higher than zero"
    end

  end

  def create
    puts "Type text of the comment"
    comment_text = gets
    @comments.push(comment_text)
    puts "Comment: #{comment_text}\n id: #{@comments.find_index(comment_text)+1}"
  end

  def update
    puts "Type index of the comment:"
    id = gets.to_i
    puts "Enter new text: "
    new_text = gets.chomp
    @comments[id-1] = new_text
    index
  end

  def destroy
    puts "Enter index of destroying comment:"
    id = gets.to_i
    @comments.delete_at(id-1)
  end
end

