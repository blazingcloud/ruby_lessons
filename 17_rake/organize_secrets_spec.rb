require 'fileutils'
require 'organize_secrets'
describe OrganizeSecrets do
  before do
    @current_dir = File.dirname(File.expand_path(__FILE__))
    @encoder = OrganizeSecrets.new(@current_dir)
    @secrets_dir = @encoder.secrets_dir
    @source_dir = File.join(@current_dir, "plain_text")
  end

  describe "#secrets_dir" do
    it "should know the name of the secret directory" do
      @encoder.secrets_dir.should == File.join(@current_dir, "secrets")
    end
  end

  describe "#shred" do
    it "should remove the secret directory" do
      removed_dir = nil
      FileUtils.stub(:rm_rf).and_return do |dir|
        removed_dir = dir
      end
      @encoder.shred
      removed_dir.should == @secrets_dir
    end
  end

  describe "#make_secrets_directory" do
    it "should make a new directory if one doesn't exist" do
      created_dir = nil
      FileUtils.stub(:mkdir).and_return do |dir|
        created_dir = dir
      end
      @encoder.make_secrets_directory
      created_dir.should == @secrets_dir
    end
  end

  describe ".file_names_to_encode" do
    it "should return the list of files to be encoded" do
      @encoder.file_names_to_encode.should =~ %w( arrived.txt johnny_appleseed.txt row_row_row_your_boat.txt)
    end
  end
  
  describe "encoding files" do
    before do
      @encoder.shred
      @encoder.make_secrets_directory
      File.exist?(@secrets_dir).should be_true
    end

    after do
      @encoder.shred
      File.exist?(@secrets_dir).should be_false
    end

    describe "#encode_file" do
      before do
        song = 'row_row_row_your_boat.txt'
        source_file_name = File.join(@source_dir, song)
        encoded_file_name = File.join(@secrets_dir, song)
        @encoder.encode_file(song)
        File.open(source_file_name) {|f| @source = f.read }
        File.open(encoded_file_name) {|f| @encoded = f.read }
      end

      it "should put encode our files into our secrets directory" do
        @encoded.should == @source.reverse
      end 
    end

    describe "#encode_files" do
      before do
        @encoded_files = []
        @encoder.stub(:encode_file).and_return do |filename|
          @encoded_files << filename
        end
        @encoder.encode_files
      end

      it "should encode the files in source dir" do
        @encoded_files.should == %w( arrived.txt johnny_appleseed.txt row_row_row_your_boat.txt)
      end
    end

    describe ".number_files" do
      before do
        @test_dir = File.join(@current_dir, 'test')
        FileUtils.rm_rf(@test_dir)
        FileUtils.mkdir(@test_dir)
        ("A".."Z").each do |f|
          FileUtils.touch(File.join(@test_dir, f * 10))
        end
      end

      after do
        FileUtils.rm_rf(@test_dir)
      end

      it "should number the files with two digit prefixes" do
        @encoder.number_files(@test_dir)
        (Dir.entries(@test_dir) - ['.', '..']).should =~ %w(
          01_AAAAAAAAAA
          02_BBBBBBBBBB
          03_CCCCCCCCCC
          04_DDDDDDDDDD
          05_EEEEEEEEEE
          06_FFFFFFFFFF
          07_GGGGGGGGGG
          08_HHHHHHHHHH
          09_IIIIIIIIII
          10_JJJJJJJJJJ
          11_KKKKKKKKKK
          12_LLLLLLLLLL
          13_MMMMMMMMMM
          14_NNNNNNNNNN
          15_OOOOOOOOOO
          16_PPPPPPPPPP
          17_QQQQQQQQQQ
          18_RRRRRRRRRR
          19_SSSSSSSSSS
          20_TTTTTTTTTT
          21_UUUUUUUUUU
          22_VVVVVVVVVV
          23_WWWWWWWWWW
          24_XXXXXXXXXX
          25_YYYYYYYYYY
          26_ZZZZZZZZZZ
        )
      end
    end

  end
end
