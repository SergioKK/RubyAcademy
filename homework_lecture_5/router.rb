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

      unless %w[GET POST PUT DELETE].include?(verb)
        print("You did not choose action (GET/POST/PUT/DELETE) or q to exit\n")
        next
      end

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        unless %w[index show].include?(action)
          print("You did not choose action (index/show) or q to exit\n")
          next
        end
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
    if result.empty? ? print("Have no posts yet\n") : puts(result)
    end
  end

  def show
    print "Please enter index of post you want to see: "
    ind = gets.chomp.to_i
    if @posts[ind].nil? ? print("No post with such index:#{ind}\n") : puts(@posts[ind])
    end
  end

  def create
    print "Please enter your post: "
    @posts << gets.chomp
  end

  def update
    print "Please enter index of post you want to update: "
    index = gets.chomp.to_i
    print "Please enter text you want to change: "
    text = gets.chomp
    @posts[index] = text
  end

  def destroy
    print "Please enter index of post you want to delete: "
    if @posts.delete_at(gets.chomp.to_i)
      print("Successfully deleted\n")
    else
      print("Cannot find post with that index\n")
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
      print("No implemented yet, but will be soon. Thx for staying with us.\n") if choice == '2'
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
