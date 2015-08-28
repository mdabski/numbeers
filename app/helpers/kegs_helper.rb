module KegsHelper
	def get_freshness()
    latest_keg = Keg.last
    if latest_keg.nil?
      "No Keg!?"
    else
    time_ago_in_words(latest_keg.start_date) + " ago"
      #lastpour.created_at.strftime("%a - %b %d, %Y \n %I:%M %p")
    end
  end
end
