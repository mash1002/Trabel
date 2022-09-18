class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_trips, through: :favorites, source: :trip
  has_one_attached :icon_image

  has_many :reverse_of_relations, class_name: "Relation", foreign_key: "followed_id", dependent: :destroy
  has_many :relations, class_name: "Relation", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relations, source: :follower
  has_many :followings, through: :relations, source: :followed

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.user_name = "ゲスト"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

  def get_icon_image(width, height)
    unless icon_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      icon_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    icon_image.variant(resize_to_limit: [width, height]).processed
  end

  def follow(customer)
    relations.create(followed_id: customer.id)
  end

  def unfollow(customer)
    relations.find_by(followed_id: customer.id).destroy
  end

  def following?(customer)
    followings.include?(customer)
  end
end
