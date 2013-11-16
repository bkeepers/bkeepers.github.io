# https://gist.github.com/enaeher/88cda643aa7e3b0ca1e5
class Jekyll::Site
  alias :site_payload_without_tiered_archives :site_payload

  def site_payload
    data = site_payload_without_tiered_archives
    data['site']['years'] = TieredArchives::find_years(self.posts.reverse)
    data
  end
end

module TieredArchives

  def self.find_years(posts)
    posts.group_by {|post| post.date.year}.values
  end

end
