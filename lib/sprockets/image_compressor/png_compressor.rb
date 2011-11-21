module Sprockets
  module ImageCompressor
    class PngCompressor
      def compress(content)
        compressed_png_data = ""
        Tempfile.open ["in_file", ".png"], :encoding => 'binary' do |in_file|
          out_file_path = in_file.path + ".optimized.png"
          in_file.write content
          in_file.close
          out = `pngcrush #{in_file.path} #{out_file_path} 2>&1`
          in_file.delete

          compressed_png_data = File.read out_file_path, :encoding => 'binary'
          File.unlink out_file_path
        end
        compressed_png_data
      end
    end
  end
end
