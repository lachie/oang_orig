class Member < ActiveRecord::Base
  attr_accessor :twfy_gid

  belongs_to :house
  belongs_to :party
  belongs_to :electorate

  has_many :positions

  before_validation :parse_gid

  def self.find_by_twfy_gid(gid)
    find(TwfyGid.id(gid))
  end

  def full_name
    "%s %s" % [first_name, last_name]
  end

  protected
  def parse_gid
    if twfy_gid
      self.id = TwfyGid.id(twfy_gid)
    end
  end
end
