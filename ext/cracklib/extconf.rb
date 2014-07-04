require 'mkmf'
$:.push File.expand_path("../../../lib", __FILE__)
require 'cracklib/root'

vendor_path = File.join(Cracklib.root, 'vendor/cracklib')
puts "Vendor path: %s" % vendor_path

`cd #{vendor_path} && ./configure && make`

$LDFLAGS << ' -lcrack'
LIBDIR      = RbConfig::CONFIG['libdir']
INCLUDEDIR  = RbConfig::CONFIG['includedir']

HEADER_DIRS = [
  "#{vendor_path}/lib",
  '/opt/local/include',
  '/usr/local/include',
  INCLUDEDIR,
  '/usr/include',
  '/include'
]

LIB_DIRS = [
  "#{vendor_path}/lib/.libs",
  '/usr/local/lib',
  LIBDIR,
  '/usr/lib',
]
LIB_DIRS << '/lib' if File.exist?("/lib")
LIB_DIRS << '/opt/local/lib' if File.exist?("/opt/local/lib")

dir_config('cracklib', HEADER_DIRS, LIB_DIRS)

find_header("sys/types.h")
find_header("errno.h")
find_header("limits.h")
find_header("string.h")
find_header("pwd.h")
find_header("stdlib.h")
find_header("crack.h")

find_library("crack", "FascistCheck")


create_makefile('cracklib')
