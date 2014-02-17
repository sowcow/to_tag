require 'to_tag/data'

describe ToTag::Data do

  describe '.extract' do
    def subj(*a) described_class.extract *a end

    it 'or takes a dir' do
      :assume_it_works_or_use_mocks?
    end


    def check input, output
      temp_file { |temp|
        temp.write input
        temp.flush
        expect(
          subj(file: temp.path)
        ).to eq output
      }
    end

    it 'or takes a file' do
      expect {
        check "raise 'abc'", [['water', [:h, :o]]]
      }.to raise_error
      check "'water'.tag :h, :o", [['water', [:h, :o]]]
      check "'water'.tag [:h, [:o]]", [['water', [:h, :o]]]
    end
  end
end
