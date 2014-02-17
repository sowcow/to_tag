# mmm?
class String
  @@omg = nil
  def self.tag_to(who) @@omg = who end

  def tag *tags, &block
    @@omg.tag self, *tags, &block
  end
end

module ToTag
  class Data
    def self.extract given
      data = new
      String.tag_to data
      case
      when dir = given[:dir]
        Dir[dir + '/**/*'].each { |file|
          data.extract_file file
        }.flatten 1
      when file = given[:file]
        data.extract_file file
      end
      String.tag_to nil
      data.extract
    end


    def initialize
      @known = []
    end

    def extract_file file
      eval_script file
    end

    def extract
      @known # to_hash or so
    end

    def tag what, *tags, &block
      if block
        raise 'wtf?' if tags.any?
        raise 'implement me!'
      end
      tags = prepare_tags tags
      @known << [what, tags]
    end

    def prepare_tags tags
      # case array / string / multiline / block!
      tags.flatten
    end

    private
    def eval_script filename, arguments = {}
      proc = Proc.new {}
      eval File.read(filename), proc.binding, filename
    end
  end
end
