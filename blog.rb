#blog.rb
#Chris Chapman

class BlogTracker

  @@blogid = 0
  
  def initialize
    @@blogid +=1
    @blogid = @@blogid
  end
  
  def get_id
    return @blogid
  end
  
end


class Blueprint < BlogTracker
  
  attr_accessor :title, :title, :content, :publish_date, :author
  
end


#Method to create blog posts
def make_new_blog(blogposts)
  blogposts = blogposts
  puts "Do you want to create a new blog post? (y/n)"
  action_to_take = gets.chomp
  while action_to_take.downcase == "y"
    blog = Blueprint.new
    puts "Enter the title of your blog:"
    # blog.set_title=gets.chomp
    blog.title = gets.chomp
    puts "Enter your blog content"
    # blog.set_content=gets.chomp
    blog.content = gets.chomp
    puts "Enter the date you want to publish yer blog"
    # blog.set_publish_date=gets.chomp
    blog.publish_date=gets.chomp
    puts "Enter your name"
    # blog.set_author=gets.chomp
    blog.author=gets.chomp
    puts "Press enter to save yer blog"
    blogposts.push(blog)
    puts blogposts[blogposts.length-1].inspect
    puts "Do you want to create a new blog post? (y/n)"
    action_to_take = gets.chomp
  end
end

# Method to publish blog posts
def publish_blogposts(blogposts)
  #inspect contents of each blog post
  puts "\n"
  puts "Yer Blogs\n\n"
  blogposts.each do |blogpost|
    puts "Blog Id = #{blogpost.get_id}"
    puts "Title = #{blogpost.title}"
    puts "Content = #{blogpost.content}"
    puts "Author = #{blogpost.author}"
    puts "Publish Date = #{blogpost.publish_date}"
    puts "\n"
  end
end

# Create and Publish blog posts

# create array to hold the blogposts
blogposts = []
# create blog posts
make_new_blog(blogposts)
# publish blog posts
publish_blogposts(blogposts)

