require "csv"
require_relative "list"

class Repository
  def initialize(csv_file_input, csv_file_output)
    @lists           = []
    @csv_file_input  = csv_file_input
    @csv_file_output = csv_file_output
    @scope_id        = 14
  end

  def load_csv_in_lists
    CSV.foreach(@csv_file_input) do |row|
      @lists << row[0]
    end
  end

  def instantiate_lists
    @lists.map! do |email|
      name       = email.split('@').first
      first_name = name.split('.').first
      last_name  = name.split('.').last
      List.new(email, first_name, last_name, @scope_id)
    end
  end

  def save_lists_to_csv
    CSV.open(@csv_file_output, 'wb') do |csv|
      @lists.each do |list|
        csv << [list.email, list.first_name, list.last_name, list.scope_id]
      end
    end
  end
end
