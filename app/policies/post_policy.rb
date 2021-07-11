class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    post.posted_by == user
  end

  def destroy?
    post.posted_by == user
  end
end