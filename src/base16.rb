require "fileutils"
require "parallel"
require "safe_yaml"

require_relative "base16/repo"
require_relative "base16/scheme"

module Base16
  DATA_ROOT = "build"
  DEFAULT_BUILD_DIR = File.join(ENV["XDG_DATA_HOME"], "base16")
  OFFICIAL_SOURCES_URL = "https://github.com/chriskempson/base16-schemes-source"

  class << self
    def update
      official_sources =
        Base16::Repo.new(
          name: "official",
          type: "sources",
          url: OFFICIAL_SOURCES_URL
        ).update

      official_schemes =
        SafeYAML.load(
          File.read(File.join(official_sources.repo_dir, "list.yaml"))
        )

      Parallel.each(official_schemes) do |name, url|
        Base16::Repo.new(
          name: name,
          type: "schemes",
          url: url
        ).update
      end
    end

    def build(dir = DEFAULT_BUILD_DIR)
      FileUtils.mkdir_p(dir)

      Base16::Scheme
        .load_all(File.join(Dir.pwd, DATA_ROOT, "schemes"))
        .each { |scheme| scheme.build(dir) }
    end
  end
end
