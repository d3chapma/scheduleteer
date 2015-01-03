# Example associations
#                Schedule
#               /   |    \
#           Days   Jobs   Volunteers
#              \    |     /
#               Assignments

# Schedule
#   has_many :days
#   has_many :jobs
#   has_many :assignments, through: :days and/or :jobs

# Day
#   has_many :assignments
#   belongs_to :schedule

# Job
#   has_many :assignments
#   belongs_to :schedule

# Assignment
#   belongs_to :day
#   belongs_to :job

#  ex. table.tablize(:assignments, {col: :job, row: :day})


# What the result of tablize should be:

# [ Row, Row, Row, ...]

# Row
#


module Tablizer
  class Table
    attr_reader :header, :body, :parent

    def initialize(parent)
      @parent = parent
    end

    def tablize(association, options = {})
      row_class = options[:row]
      col_class = options[:col]

      cols = parent.send(pluralized(col_class)).to_a

      header.add nil
      header.add *cols

      parent.send(pluralized(row_class)).map do |r|
        grouped = r.send(association).includes(col_class).to_a.group_by(&id_for(col_class))

        row = Row.new
        object = {}
        object[row_class] = r
        object[association] = grouped[nil].sort_by(&:sortable_name)
        row.add(object)

        cols.each do |c|
          row.add(grouped[c.id].sort_by(&:sortable_name).reject(&:absent))
        end

        body << row
      end

      self
    end

    def pluralized(symbol)
      symbol.to_s.pluralize
    end

    def id_for(symbol)
      "#{symbol}_id".to_sym
    end

    def header
      @header ||= Row.new
    end

    def body
      @body ||= []
    end
  end

  class Row
    def add(*args)
      args.each do |arg|
        cells << Cell.new(arg)
      end
    end

    def cells
      @cells ||= []
    end
  end

  class Cell
    attr_reader :data

    def initialize(data)
      @data = data
    end
  end

  # Cell
  #   data:
  #     confirmed:  [assignments]
  #     available:  [assignments]
end
