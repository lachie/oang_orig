class Hansard < ActiveRecord::Base
  acts_as_tree
  set_table_name 'hansard'

  def self.import_xml!(xml)
    hansard = Nokogiri::XML(open(xml))
    first_heading = hansard.at('major-heading')
    first_heading[:id][%r[/(\d{4}-\d{2}-\d{2})\.[^/]+]]
    root = create!(:transcribed_at => Date.parse($1))

    import!(hansard.search('//debates/*').to_a,[root])
  end

  def self.import!(list,stack)
    xml = list.shift

    kind = case xml.node_type
            when 'speech'
              :leaf
            when 'major-heading','minor-heading'
              :node
            else
              # skip
              return
            end

    if kind == :node
      stack.pop
    end

    next_item = stack.last.children.create!(parse_item(xml))

    if kind == :node
      stack << next_item
    end
    
    import!(list,stack)
  end
end
