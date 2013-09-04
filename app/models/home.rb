class Home < ActiveRecord::Base
  def Business.search(term)
      where("name like :term", term: "%#{term}%")
    end
end
