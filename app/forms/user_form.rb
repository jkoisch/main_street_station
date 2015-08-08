class UserForm
  include ActiveModel::Model

  attr_accessor :email, :password, :password_confirmation

  validates :email, presence: true
  #look at other validators

  def initialize(attrs={})
    attrs.each do |name, value|
      send("#{name}=", value)
    end
  end

end