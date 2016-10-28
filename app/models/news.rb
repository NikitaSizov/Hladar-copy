class News < ActiveRecord::Base
  translates :name, :desc
end
