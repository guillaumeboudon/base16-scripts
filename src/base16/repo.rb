require "git"

module Base16
  class Repo
    def initialize(name:, type:, url:)
      @name = name
      @url  = url
      @type = type
    end

    def update
      if Dir.exist?(repo_dir)
        puts "Pull #{@url}."
        Git.open(repo_dir).pull
      else
        puts "Clone #{@url}."
        Git.clone(@url, @name, path: type_dir)
      end

      self
    end

    def type_dir
      File.join(Dir.pwd, Base16::DATA_ROOT, @type)
    end

    def repo_dir
      File.join(type_dir, @name)
    end
  end
end
