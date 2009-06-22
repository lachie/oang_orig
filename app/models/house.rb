class House < ActiveRecord::Base
  has_many :members

  named_scope :named, lambda {|name| {:conditions => ['lower(name) = lower(?)',name]} }

  def self.all!
    {
      :reps   => find_or_create_by_name_and_slug('House of Representatives','reps'),
      :senate => find_or_create_by_name_and_slug('Senate', 'senate')
    }
  end

  def self.import_xmls!(xmls)
    houses = House.all!
    houses[:reps].import!(xmls[:representatives])

    Position.import_xmls!(xmls[:people], xmls[:ministers])
  end

  def import!(xml)
    doc = Nokogiri::XML(open(xml))

    doc.search('//member').each do |minister|
      members.create!(
        :twfy_gid   => minister[:id],
        :first_name => minister[:firstname],
        :last_name  => minister[:lastname],
        :party      => Party.import!(minister[:party]),
        :electorate => Electorate.import!(minister[:division])
      )
    end
  end
end
