require 'fileutils'
require 'json'


module ToTag
  class FrontEnd
    def self.build params
      data = params.fetch :data
      dir =  params.fetch :dir
      data_file = File.join dir, 'data.json'

      FileUtils.cp_r Dir["#{built_dir}/*"], dir
      File.write data_file, JSON.dump(data)
    end

    def self.built_dir
      this = Gem::Specification.find_by_name 'to_tag'
      root = this.gem_dir
      front = File.join root, 'front-end/dist'
      #raise root #front = root
      #gem_lib = gem_root + "/lib"
    end
  end
end
