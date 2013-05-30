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
    
    # New method added to return the items in column "key"
    def method_missing key, *args, &block        
        if key.to_s == "each"
            csv_contents.each &block

            #for index in 0 ... csv_contents.size
            #    puts "csv_contents[#{index}] = #{csv_contents[index].inspect}"
            #    csv_contents[index].each &block
            #end
            
        else
            # array of columns we need to output
            #colToReturn.each {|a| puts a.to_s}
            puts "Stupid! Method " + key.to_s + " does not exist!"
        end
    end
    # --- end of new code ---
    
end

class Array
    include ActsAsCsv
    
    def method_missing key, *args, &block
        #puts headers.to_s
        # col_array.each {|x| puts self[x]}
        # puts self[0]
        #puts headers
        return key.to_s
    end
end

m = CVS.new
#puts m.headers.inspect
#puts m.csv_contents.inspect
m.each {|row| puts row.one}
