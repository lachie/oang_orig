class Position < ActiveRecord::Base


  attr_accessor :twfy_gid
  before_validation :parse_gid

  named_scope :named, lambda {|name| {:conditions => ['lower(name) = lower(?)',name]} }

  def self.import_xmls!(people_path,ministers_path)
    member_positions = Hash.new {|h,k| h[k] = {}}

    ministers = Nokogiri::XML(open(ministers_path))
    ministers.search('//moffice').each do |office|
      member = Member.find_by_twfy_gid(office[:matchid])

      from = office[:fromdate]
      from = nil if from[/9999/]

      to = office[:todate]
      to = nil if to[/9999/]

      position = member.positions.create! :from => from, :to => to,
          :name => office[:position],
          :twfy_gid => office[:id]

      member_positions[member.id][position.id] = position
    end

    position_map = Nokogiri::XML(open(people_path))
    position_map.search('//person').each do |person|
      offices = person.search('office[current=yes]').to_a
      member_office = offices.shift

      if !offices.blank?
        member_id = TwfyGid.id(member_office[:id])

        offices.each do |office|
          pos_id   = TwfyGid.id(office[:id])
          position = member_positions[member_id][pos_id]

          unless position
            raise "Position not found for member_id #{member_id}, position_id #{pos_id}"
          end

          position.current = true
          position.save!
        end
      end
    end
  end

  protected
  def parse_gid
    if twfy_gid
      self.id = TwfyGid.id(twfy_gid)
    end
  end
end
