class Home < ActiveRecord::Base
  def Business.search(term)
      where("name like :term", term: "%#{term}%")
  end

  CITY = %w[Anantapur
            Guntur
            Hyderabad
            Kadapa Kakinada Karimnagar Kurnool
            Nellore Nizamabad
            Rajahmundry Ramagundam
            Tirupati
            Vijayawada Visakhapatnam Vizianagaram
            Warangal]
end
