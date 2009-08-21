class Widget < ActiveRecord::Base
  def valid
    valid?
  end
end
