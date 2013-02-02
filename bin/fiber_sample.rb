#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'fiber_sample'

FiberSample.start(PlayerFiber.new)
