class CommentsController
  extend Resource

  def initialize
    @comments = []
  end

  def index
    @comments.each do |post|
      puts @comments.index + ' ' + post.to_s
    end
    puts temp
  end

  def show
    puts 'show'
    id = gets.chomp
    @comments.each do |post|
      if @comments.find_index(post) == id
        puts 'id = ' + id + 'text = ' + post.to_s
        break
      end
    end
  end

  def create
    puts 'create'
    post_text = gets.chomp
    @comments.push(post_text)
    puts 'id = ' + (@comments.find_index(@comments.last) + 1).to_s + ', text = ' + post_text.to_s
  end

  def update
    puts 'update'
    id = gets.chomp
    new_text = gets.chomp
    @comments.each do |comment|
      if @comments.find_index(comment) == id
        @comments[id] = new_text
        puts 'id = ' + id + ', text = ' + new_text
        break
      end
    end

  end

  def destroy
    puts 'destroy'
    id = gets.to_i.chomp
    @comments.delete_at(id)
  end
end

