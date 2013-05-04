class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar
   has_attached_file :avatar, :styles => { :thumb => "200x200>" }, :url  => "/assets/photos/:id/:style/:basename.:extension",
                    											   :path => ":rails_root/public/assets/photos/:id/:style/:basename.:extension"
  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 3.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  attr_protected :avatar_file_name, :avatar_content_type, :avatar_size
  # attr_accessible :title, :body
end
