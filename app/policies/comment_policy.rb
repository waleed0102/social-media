class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def update?
    comment.commented_by == user
  end

  def destroy?
    comment.commented_by == user
  end
end