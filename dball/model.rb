module Dball
  class Model

    class << self
      attr_writer :table_name
      attr_writer :primary_key
    end

    def self.find(pk)
      sql = <<-EOS.squish
      
      SELECT
        #{self.table_name}.*
      FROM #{self.table_name}
      WHERE
        #{self.table_name}.#{self.primary_key} = #{pk}
      LIMIT 1

      EOS

      Dball::Relation.new(sql)
    end

    def self.table_name
      return @table_name if @table_name.present?

      return self.name.underscore.pluralize
    end

    def self.primary_key
      return @primary_key if @primary_key.present?

      return "id"
    end
  end
end
