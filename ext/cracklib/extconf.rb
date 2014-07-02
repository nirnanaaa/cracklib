require 'mkmf'

vendor_path = File.expand_path('../../../vendor/cracklib',__FILE__)

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
]

LIB_DIRS = [
  "#{vendor_path}/lib",
  '/opt/local/lib',
  '/usr/local/lib',
  LIBDIR,
  '/usr/lib',
]


#find_header("sys/types.h")
#find_header("errno.h")
#find_header("limits.h")
#find_header("string.h")
#find_header("pwd.h")
#find_header("stdlib.h")
find_header("crack.h")

find_library("crack", "FascistCheck")


dir_config('cracklib', HEADER_DIRS, LIB_DIRS)
create_makefile('cracklib')
