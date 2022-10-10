class ActAsCsv
    def read
        file = File.new('csv.txt')
        @headers = file.gets.chomp.split(', ')

        file_data = file.readlines(&:chomp)
        file_data.each do |row|
            @result << row
        end
    end

    def headers
        @headers
    end

    def csv_contents
        @result
    end

    def initialize
        @result = []
        read
    end

    def each
        rows = []
        @result.each do |row|
            rows.append(CsvRow.new(row))
        end
        rows
    end
end

class CsvRow
    attr_accessor :value

    def initialize(value)
        @value = value
    end

    def method_missing(m, *args)
        if m.to_s == 'one' then
            value.split(', ')[0]
        end

        if m.to_s == 'two' then
            value.split(', ')[1]
        end
    end
end

class RubyCsv < ActAsCsv
end

csv = RubyCsv.new
rows = csv.each
rows.each do |row| puts row.two end
puts csv.headers.inspect
puts csv.csv_contents.inspect