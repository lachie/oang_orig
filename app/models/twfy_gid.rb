module TwfyGid
  def self.id(string)
    if !string.blank?
      string.split('/').last.to_i
    end
  end
end
