class Favorite < ActiveRecord::Base
  belongs_to :favoritable, :polymorphic => true
  belongs_to :user, inverse_of: :favorites
  validates :user_id, uniqueness: { 
    scope: [:favoritable_id, :favoritable_type],
    message: 'can only favorite an item once'
  }

  def build_favorites(params, current_user)
    if params["artist"]
      self.favoritable = Artist.find(params[:artist])
    elsif params["song"]
      self.favoritable = Song.find(params[:song])
    elsif params["album"]
      self.favoritable = Album.find(params[:album])
    end
    current_user.favorites << self
    current_user.save
  end



end
