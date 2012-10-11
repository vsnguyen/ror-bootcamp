class Post < ActiveRecord::Base
  attr_accessible :link, :title
  validates :title, :presence => true
  
  has_many :comments, :dependent => :destroy
  
  # SORTING
  default_scope :limit => 100
  scope :top, :order => {:max, :created_at}
  scope :bottom, order("max DESC").order("created_at DESC") # sequal sorting
  scope :latest, :order(:created_at)
  
  def self.filter(param)
    if param == 'top'
      self.top
    elsif param == 'bottom'
      self.bottom
    elsif param == 'latest'
      self.latest
    end
  end
end
