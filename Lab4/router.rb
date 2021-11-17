module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end


      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    puts 'index'
    @posts.each do |post|
      puts @posts.index + ' ' + post.to_s
    end
    puts temp
  end

  def show
    puts 'show'
    id = gets.chomp
    @posts.each do |post|
      if @posts.find_index(post) == id
        puts 'id = ' + id + 'text = ' + post.to_s
        break
      end
    end
  end

  def create
    puts 'create'
    post_text = gets.chomp
    @posts.push(post_text)
    puts 'id = ' + (@posts.find_index(@posts.last) + 1).to_s + ', text = ' + post_text.to_s
  end

  def update
    puts 'update'
    id = gets.chomp
    new_text = gets.chomp
    @posts.each do |post|
      if @posts.find_index(post) == id
        @posts[id] = post
        puts 'id = ' + id + ', text = ' + new_text
        break
      end
    end

  end

  def destroy
    puts 'destroy'
    id = gets.to_i.chomp
    @posts.delete_at(id)
  end
end

class CommentsController
  extend Resource

  def initialize
    @comments = []
  end

  def index
    puts 'index'
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

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')
    resources(CommentsController, 'comments')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      if choise == '1'
        PostsController.connection(@routes['posts'])
      else if choise == '2'
        CommentsController.connection(@routes['comments'])
      else if choise == 'q'
        puts 'Good bye!'
        break
      else
        puts 'You wrote the wrong command, try 1 for work with Posts, 2 for work with Comments and q for Exit from programm '
      end

    end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
