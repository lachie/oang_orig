require File.dirname(__FILE__)+'/app_helper'

module OA
  class Member < Namespace
    def name!(name)
      @name = name
      self
    end


    def first!
      self.target = ::Member.first
    end

    # test
    def count?(count)
      ::Member.count.should == count
    end

    def full_name?(full_name)
      target.full_name.should == full_name
    end

    def exists?
      target.should_not be_nil
    end

    def house?(house)
      target.house.should_not be_nil
      target.house.should == ::House.named(house).first
    end

    def party?(party)
      target.party.should_not be_nil
      target.party.should == ::Party.named(party).first
    end

    def id?(id)
      target.id.should == id
    end

    def electorate?(electorate)
      target.electorate.should_not be_nil
      target.electorate.should == ::Electorate.named(electorate).first
    end

    def positions?(table)
      table.hashes.each do |row|
        row['current'] = row[:current] == 'false' ? false : true
        row['from']    = Date.parse(row[:from]) if row[:from]
        row['to']      = Date.parse(row[:to]  ) if row[:to]
        pos = ::Position.first(:conditions => row)
        pos.should_not be_nil

        target.positions.should include(pos)
      end
    end
  end
end
