#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

=begin
#<
Install the Postgis binaries and create the template.

Note: this includes the postgresql::server after installing the postgis binaries.
#>
=end

case node['platform_family']
when 'fedora', 'rhel', 'centos', 'debian'
  # Already in the default repositories
  package 'postgis'
end

include_recipe 'postgresql::server'

if node['postgis']['template_name']
  include_recipe 'postgis::_init_database_template'
end

