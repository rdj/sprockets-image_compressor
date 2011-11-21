module Sprockets
  module ImageCompressor
    class JpgCompressor
      def compress(content)
        compressed_jpg_data = ""
        Tempfile.open( "file.jpg", 'wb' ) do |file|
          file.write content
          file.close

          out = `jpegoptim --strip-all #{file.path} 2>&1`
          file.open 'rb'
          compressed_jpg_data = file.read
        end
        compressed_jpg_data
      end
    end
  end
end
