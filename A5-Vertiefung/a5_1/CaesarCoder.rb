class CaesarCoder
  attr_reader :original_name, :keyword, :key

  def initialize(original_file, keyword)
    @original_name = original_file
    @keyword = keyword

    # calculate key
    @key = keyword.upcase.ord - 'A'.ord
  end

  # calculate encoded letter's bytecode
  # decode with negative key
  def encode(byte, key)
    # make sure bytecode is a letter
    if ('A'..'Z').include?(byte.chr) || ('a'..'z').include?(byte.chr)
      # check uppercase or lowercase letter
      start = ((byte > 96) ?  'a'.ord : "A".ord)
      (byte+key-start) % 26 + start
    else
      byte
    end
  end

  def encode_file
    # read from 'original', write to 'encoded'
    File.open("a5_1/#{original_name}", 'r') { |fr|
      File.open("a5_1/encoded_#{original_name}", 'w') { |wr|
        fr.each_byte { |byte|
          # encode each letter and write each letter to new file
          wr << encode(byte, key).chr
        }
      }
    }
  end

  def decode_file
    # read from 'encoded', write to 'decoded'
    File.open("a5_1/encoded_#{original_name}", 'r') { |fr|
      File.open("a5_1/decoded_#{original_name}", 'w') { |wr|
        fr.each_byte { |byte|
          # encode each letter and write each letter to new file
          wr << encode(byte, -key).chr
        }
      }
    }
  end

end

cc = CaesarCoder.new('plain.txt','C')
cc.encode_file
cc.decode_file



