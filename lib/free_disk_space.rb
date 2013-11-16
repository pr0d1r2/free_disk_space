require 'sys/filesystem'

class FreeDiskSpace

  attr_reader :dir

  def initialize(dir)
    @dir = dir
  end

  def self.terabytes(dir)
    new(dir).terabytes
  end

  def self.gigabytes(dir)
    new(dir).gigabytes
  end

  def self.megabytes(dir)
    new(dir).megabytes
  end

  def self.kilobytes(dir)
    new(dir).kilobytes
  end

  def self.bytes(dir)
    new(dir).bytes
  end

  def terabytes
    gigabytes / 1024
  end

  def gigabytes
    megabytes / 1024
  end

  def megabytes
    kilobytes / 1024
  end

  def kilobytes
    bytes.to_f / 1024
  end

  def bytes
    filesystem_stat.block_size * filesystem_stat.blocks_available
  end

  private

  def filesystem_stat
    @filesystem_stat ||= Sys::Filesystem.stat(dir)
  end

end
