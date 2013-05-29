# Modifed code from "Seven Languages in Seven Weeks".

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
end

class CVS
    include ActsAsCsv
    
    acts_as_csv
    
    def self.method_missing name, *argu, &block
      puts "found internal method_missing"
    end
    
    # New method added to return the items in column "key"
    def method_missing key, *argu, &block
        
        if key.to_s == "each"            
            # colToReturn.each { |i| csv_contents.each { |c| puts c[i] } }
            csv_contents.each &block
        else
            colToReturn = []
            # array of columns we need to output
            headers.each_with_index {|h, index| if h.to_s == key.to_s : colToReturn = colToReturn + Array[index] end}
            colToReturn.each {|a| puts a.to_s}
            ## puts "Stupid! Method " + key.to_s + " does not exist!"
        end
    end
    # --- end of new code ---
end

class Array
    def method_missing key, *argu, &block
        puts "hi"
    end
end


m = CVS.new
#puts m.headers.inspect
#puts m.csv_contents.inspect
m.each {|row| puts row.one}