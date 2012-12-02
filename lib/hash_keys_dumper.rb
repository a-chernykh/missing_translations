class HashKeysDumper
  def self.dump(hash)
    hash.map do |k, v|
      if v.is_a? Hash
        keys = dump(v)
        keys.map { |k1| [k, k1].join('.') }
      else
        k.to_s
      end
    end.flatten
  end
end
