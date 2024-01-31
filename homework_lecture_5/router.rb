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
    result = []
    @posts.each_with_index do |post, i|
      result << ["#{i}. #{post}"]
    end
    if result.empty? ? puts("Have no posts yet") : puts(result)
    end
  end

  def show
    puts "Please enter index of post you want to see: "
    puts @posts[gets.chomp.to_i]
  end

  def create
    puts "Please enter your post: "
    @posts << gets.chomp
  end

  def update
    puts "Please enter index of post you want to update"
    index = gets.chomp.to_i
    puts "Please enter text you want to change"
    text = gets.chomp
    @posts[index] = text
  end

  def destroy
    puts "Please enter index of post you want to delete"
    if @posts.delete_at(gets.chomp.to_i) ? puts("Successfully deleted") : puts("Cannot find post with that index")
    end
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choice = gets.chomp

      PostsController.connection(@routes['posts']) if choice == '1'
      break if choice == 'q'
    end

    puts 'Good bye!'
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
