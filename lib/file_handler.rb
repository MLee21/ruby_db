require 'csv'

class FileHandler

  attr_accessor :file, :csv

  def initialize(file)
    @file = file
    @csv = []
  end

  def parse
    File.foreach(file, headers: true) { |row| csv << row.strip }
    csv
  end

end