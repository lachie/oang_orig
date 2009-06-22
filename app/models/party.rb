class Party < ActiveRecord::Base
  has_many :members

  named_scope :named, lambda {|name| {:conditions => ['lower(name) = lower(?)',name]} }

  before_validation :strip_name


  def self.import!(party_name)
    @parties ||= {}
    party_name.downcase!

    if party = @parties[party_name]
      party
    else
      @parties[party_name] = create!(:name => party_name)
    end
  end

  protected
  def strip_name
    self.name = name.gsub(/\s+party/i,'')
  end
end
