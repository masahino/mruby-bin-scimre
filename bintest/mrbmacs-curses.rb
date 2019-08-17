require 'open3'
$script_dir = File.dirname(__FILE__) + "/scripts/"
assert('init buffer') do
  stdout, stderr, status = Open3.capture3("#{cmd('mrbmacs-curses')} -l #{$script_dir}init_buffer")
  assert_equal 0, status.to_i
  lines = stderr.split("\n")
  assert_equal "*scratch*", lines[0]
end
