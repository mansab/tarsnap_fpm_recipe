# class Tarsnap < FPM::Cookery::Recipe
# AUTHOR Mansab Uppal
# Official site: http://mansab.upp.al
# Official git repository: https://github.com/mansab/puppet-tarsnap
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
# See README.md for more information.
#
class Tarsnap < FPM::Cookery::Recipe
  description 'Tarsnap is a secure online backup service for BSD, Linux, OS X, Minix, OpenIndiana, Cygwin, and probably many other UNIX-like operating systems.'

  name     'tarsnap'
  version  ENV['BUILD_VERSION']
  revision ENV['BUILD_REV'] || 0
  homepage 'https://tarsnap.com'
  source   "https://www.tarsnap.com/download/tarsnap-autoconf-#{version}.tgz"
  sha256   '6c9f6756bc43bc225b842f7e3a0ec7204e0cf606e10559d27704e1cc33098c9a'

  section  'backup-tools'

  case FPM::Cookery::Facts.platform
    when :ubuntu
      arch    'amd64'
      depends 'openssl'
      depends 'zlib1g'
      depends 'e2fslibs'
      build_depends 'libssl-dev'
      build_depends 'zlib1g-dev'
      build_depends 'e2fslibs-dev'
    when :centos
      arch    'x86_64'
      depends 'openssl'
      depends 'zlib'
      depends 'e2fsprogs'
      build_depends 'glibc-devel'
      build_depends 'openssl-devel'
      build_depends 'zlib-devel'
      build_depends 'e2fsprogs-devel'
    else
      raise "unrecognized platform #{FPM::Cookery::Facts.platform}"
  end

  def build
    # calling "configure" with no option breaks fpm-cookery, see https://github.com/bernd/fpm-cookery/issues/92
    safesystem './configure'
    make
  end

  def install
     with_trueprefix do
       make :install, 'DESTDIR' => destdir, 'PREFIX' => prefix
     end
  end
end
