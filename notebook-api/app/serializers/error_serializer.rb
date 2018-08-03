module ErrorSerializer
    def self.serialize(errors)
        return if errors.nil?

        json = {}

        new_hash = errors.tohash.map do |k, v|
            v.map do |map|
                {id: k, title: msg}
            end
        end.flatten
        json[:errors] = new_hash
        json
    end
end
