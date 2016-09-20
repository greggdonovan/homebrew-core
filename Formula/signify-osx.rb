class SignifyOsx < Formula
  desc "Cryptographically sign and verify files"
  homepage "http://man.openbsd.org/OpenBSD-current/man1/signify.1"
  url "https://github.com/jpouellet/signify-osx/archive/1.3.tar.gz"
  sha256 "c67090135a55478a6a6c11d507d9c3865a11de665c010a8a5f2457737f277f89"
  head "https://github.com/jpouellet/signify-osx.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "e7ab392d6bd66b7fc2f4d69226cabb867c73b98a496746b0cb32ba2b258defe4" => :el_capitan
    sha256 "5731f0ed4d6870d29fdcd0d040ba1c011a568b97618e6e752c09fe06ad712384" => :yosemite
    sha256 "6ff9987d91649052b39b06ccf3b8aa2c70c12e31d96477d0c1542775a8304e77" => :mavericks
    sha256 "d483a3522a976b1eb3152f549028afe0b57be262c07a354d60567d62aea657c8" => :mountain_lion
  end

  def install
    system "make"
    system "make", "test"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/signify", "-G", "-n", "-p", "pubkey", "-s", "seckey"
  end
end
