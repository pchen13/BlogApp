class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  attr_accessible :body, :title, :user_id
  
  def owner?(user)
    return user.is_a?(User) && Post.where('id == ? and user_id == ?', self.id, user.id).count > 0
  end
  def self.search(criteria='')
    criteria = "%#{criteria}%"
    Post.where(["title LIKE ? OR body LIKE ?", criteria, criteria])
  end
  def images
    path = 'app/assets/images/posts/'+self.id.to_s+'/*.{png, gif, jpg, bmp}'
    image_urls = Dir.glob(path)
    image_urls.map { |url| url[17, url.size] }
  end
  def save_image(image)
    name = image.original_filename
    directory = 'app/assets/images/posts/'+self.id.to_s
    unless File.directory? directory
      FileUtils.mkpath directory
    end
    FileUtils.rm_rf("#{directory}/.", secure: true)
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(image.read)}
  end
end
