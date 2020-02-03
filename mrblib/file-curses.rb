module Mrbmacs
  class Application
    def read_file_name(prompt, directory)
      prefix_text = directory + "/"
      filename = @frame.echo_gets(prompt, prefix_text) do |input_text|
        file_list = []
        len = 0
        if input_text[-1] == "/"
          file_list = (Dir.entries(input_text) - ['.', '..']).sort
        else
          dir = File.dirname(input_text)
          fname = File.basename(input_text)
          Dir.foreach(dir) do |item|
            if item =~ /^#{fname}/
              file_list.push(item)
            end
          end
          len = fname.length
        end
#        file_list = Dir.glob(input_text+"*")
#        len = if input_text[-1] == "/"
#          0
#        else
#          input_text.length - File.dirname(input_text).length - 1
#        end
#        [file_list.map{|f| File.basename(f)}.join(" "), len]
        [file_list.join(" "), len]
      end
      return filename
    end
  end
end