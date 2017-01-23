#!/usr/bin/env ruby
# Copyright IBM Corporation 2017
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'env_profile_applier'

begin
  build_dir = ARGV[0]
  build_dir += '/' if build_dir[-1] != '/'
  if !ENV['BP_LOG'].nil? &&  'true'.casecmp(ENV['BP_LOG']) == 0
    log_env = true
  else
    log_env = false
  end
  EnvProfileApplier.new(build_dir, log_env).apply_env_profile
rescue => e
  puts "-----> WARN: Failed to apply Bluemix environment profiles"
end
