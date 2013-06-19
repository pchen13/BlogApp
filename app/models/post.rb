class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, :presence => true
  validates :body, :presence => true
  attr_accessible :body, :title, :user_id
  
  def owner?(user)
    # return user.is_a?(User) && Post.where('id == ? and user_id == ?', self.id, user.id).count > 0
    return user.is_a?(User) && self.user.id == user.id
  end
  def self.search(criteria='', user_id)
    criteria = "%#{criteria}%"
    if user_id.to_i > 0
      return Post.where(["title LIKE ? OR body LIKE ? AND user_id == ?", criteria, criteria, user_id])
    else
      return Post.where(["title LIKE ? OR body LIKE ?", criteria, criteria])
    end
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
