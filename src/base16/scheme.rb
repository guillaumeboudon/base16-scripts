require "safe_yaml"
require "slugify"

module Base16
  class Scheme
    def self.load_all(dir)
      puts "Load #{dir}"
      schemes = []
      Dir["#{dir}/*/*.yaml"].each do |file|
        schemes << new(file)
      end
      schemes
    end

    def initialize(file)
      @bases = {}
      @name = File.basename(file, ".yaml").slugify
      @content = SafeYAML.load(File.read(file))

      extract_bases
    end

    def build(dir)
      file = File.join(dir, "#{@name}.sh")
      puts "Build #{file}"
      content = <<~STR
        #!/usr/bin/env bash

        export BASE16_THEME="#{@name}"
      STR

      @bases.each do |base, value|
        content << "export BASE16_#{base}=\"#{value}\"\n"
      end

      File.write(file, content)
    end

    private

    def extract_bases
      %w[00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F].each do |base|
        @bases[base] = @content["base#{base}"]
      end
    end
  end
end
