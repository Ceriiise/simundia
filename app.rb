require_relative 'repository'

csv_file_input  = File.join(__dir__, 'input.csv')
csv_file_output = File.join(__dir__, 'output.csv')

repository = Repository.new(csv_file_input, csv_file_output)

repository.load_csv_in_lists

repository.instantiate_lists

repository.save_lists_to_csv
