require File.dirname(__FILE__)+'/app_helper'

module OA
  class Hansard < Namespace
    def xml!
      @xml = fixture.path('reps_2009-06-04.xml')
      self
    end

    def import_xml!
      ::Hansard.import_xml!(@xml)
      self
    end

    def fetch!
      @target = ::Hansard.first
      self
    end

    def root?
      @target.root.should == @target
    end

    def major_heading_count?(count)
      @target.children.count.should == count
    end
  end
end

