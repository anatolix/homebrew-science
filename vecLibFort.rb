require 'formula'

class Veclibfort < Formula
  homepage 'https://github.com/mcg1969/vecLibFort'
  url 'https://github.com/mcg1969/vecLibFort/archive/v0.2.0.tar.gz'
  sha1 '4c00633376b212bd83490d1fa99cc32bfa7da891'
  head 'https://github.com/mcg1969/vecLibFort.git'

  def install
    ENV.m64 if MacOS.prefer_64_bit?
    system "make PREFIX=#{prefix} install"
  end

  def caveats
    caveats = <<-EOS.undent
      Installs the following files:
        * libvecLibFort.a: static library; link with -framework vecLib
        * libvecLibFort.dylib: dynamic library; *replaces* -framework vecLib
        * libvecLibFortI.dylib: preload (interpose) library.
      Please see the home page for usage details.
    EOS
  end
end
