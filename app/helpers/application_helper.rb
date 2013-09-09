module ApplicationHelper
  def qr_code(size, url)
    "https://chart.googleapis.com/chart?cht=qr&chs=#{size}x#{size}&chl=#{CGI.escape(url)}"
  end
end
