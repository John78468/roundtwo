require 'byebug'
require 'csv'


def read_csv
  array_one = CSV.parse(File.read("algeria_cities.csv"), headers: true)
  recover_csv_in_french(convert_to_a_of_to_a(array_one))

end


def convert_to_a_of_to_a(array_one)
  array_one.map do |row|
    row.to_h
    row.fields("commune_name_ascii","daira_name_ascii", "wilaya_name_ascii")
  end
end

def recover_csv_in_french(new_a)
  CSV.open("french.csv", "a+") do |row|
  row << ["commune_name_ascii", "daira_name_ascii", "wilaya_name_ascii"]
  new_a.each do |new_a|
      row << new_a
  end
    end
end


def peform
  read_csv
end

peform