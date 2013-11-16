free_disk_space
===============

Simple class that shows free disk space for directory. Return free disk space as float.


Usage
-----

gem install free_disk_space

OR in Gemfile:

gem 'free_disk_space'


FreeDiskSpace.terabytes('/')
FreeDiskSpace.gigabytes('/')
FreeDiskSpace.megabytes('/')
FreeDiskSpace.kilobytes('/')
FreeDiskSpace.bytes('/')

OR:

free_disk_space = FreeDiskSpace.new
free_disk_space.terabytes
free_disk_space.gigabytes
free_disk_space.megabytes
free_disk_space.kilobytes
free_disk_space.terabytes
