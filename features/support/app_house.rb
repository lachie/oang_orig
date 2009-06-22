require File.dirname(__FILE__)+'/app_helper'

module OA
  class House < Namespace
    def xmls_for!(member_name)
      @xmls = {}
      %w{divisions links-abc-qanda ministers people representatives senators twitter websites}.each do |key|
        @xmls[key.to_sym] = fixture.path("#{member_name}_#{key}.xml")
      end
      self
    end

    def import_xmls!
      ::House.import_xmls!(@xmls)
      self
    end
  end
end
