class Poro
  def initialize(attrs={})
    attrs.each do |name, value|
      send("#{name}=", value)
    end
  end
end