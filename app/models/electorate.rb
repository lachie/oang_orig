class Electorate < ActiveRecord::Base
  has_one :member

  named_scope :named, lambda {|name| {:conditions => ['lower(name) = lower(?)',name]} }

  def self.import!(name)
    name.downcase!
    @electorates ||= {}

    if electorate = @electorates[name]
      electorate
    else
      @electorates[name] = create!(:name => name)
    end
  end
end
