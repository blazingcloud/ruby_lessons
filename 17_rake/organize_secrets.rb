class OrganizeSecrets
  attr_reader :current_dir

  def initialize(dir = nil)
    @current_dir = dir || File.dirname(__FILE__)
    @current_dir = File.expand_path(@current_dir)
  end

  def secrets_dir
    return File.join(current_dir, "secrets")
  end

  def source_dir
    return File.join(current_dir, "plain_text")
  end

  def shred
    FileUtils.rm_rf(secrets_dir)
  end

  def make_secrets_directory
    FileUtils.mkdir(secrets_dir)
  end

  def file_names_to_encode
    Dir.entries(source_dir) - ['.', '..']
  end

  def encode_file(filename)
    source_name = File.join(source_dir, filename)
    target_name = File.join(secrets_dir, filename)
    File.open(source_name, 'r') do |f|
      File.open(target_name, 'w+') do |secret_file|
        secret_file.write(f.read.reverse)
      end
    end
  end

  def encode_files
    file_names_to_encode.each do |filename|
      encode_file(filename)
    end
  end

  def number_files(dir=nil)
    dir ||= secrets_dir
    filenames = Dir.entries(dir) - ['.', '..']
    filenames.sort.each_with_index do |f, i|
      original_name = File.join(dir, f)
      prefix = i >  8 ? "" : "0"
      new_name = File.join(dir, prefix + "#{i+1}_#{f}")
      FileUtils.mv(original_name, new_name) 
    end
  end
end
