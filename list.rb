class List
  attr_reader :email, :first_name, :last_name, :scope_id

  def initialize(email, first_name, last_name, scope_id)
    @email      = email
    @first_name = first_name
    @last_name  = last_name
    @scope_id   = scope_id
  end
end
