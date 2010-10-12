# Install hook code here

require 'ftools'

# keep everything in this scope
class InstallOpenIdActiveRecordStore

  def initialize
    show_banner
    check_system_consistency
    copy_migration_files
  end

  def here
    File.dirname(__FILE__)
  end

  def sources
    Dir.glob(File.join([here, 'migrations', '*.*']))
  end

  def target
    File.join([here, '..', '..', '..', 'db', 'migrate'])
  end

  def validate_file_existence(file)
    abort "File not found: #{target}" unless File.exist? file
  end

  def show_banner
    puts '
      ** Copying migrations to your application
    '
  end

  def check_system_consistency
    validate_file_existence(target)
    sources.each { |file| validate_file_existence(file) }
  end

  def copy_migration_files
    sources.each do |file|
      File.copy(file, target)
      puts "
      Source : #{file}
      Target : #{target}
      "
    end
  end

end

InstallOpenIdActiveRecordStore.new
