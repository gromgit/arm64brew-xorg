class FontWinitzkiCyrillic < Formula
  desc "X.Org Fonts: font winitzki cyrillic"
  homepage "https://www.x.org/"
  ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7font.html
  url "https://www.x.org/pub/individual/font/font-winitzki-cyrillic-1.0.3.tar.bz2"
  mirror "https://xorg.freedesktop.org/archive/individual/font/font-winitzki-cyrillic-1.0.3.tar.bz2"
  mirror "https://ftp.x.org/archive/individual/font/font-winitzki-cyrillic-1.0.3.tar.bz2"
  sha256 "abd13b63d02fcaec488686c23683e5cf640b43bd32f8ca22eeae6f84df0a36a0"
  revision 1
  # tag "linuxbrew"

  bottle do
    sha256 "59c5fc648ee887898636805abd19f38d3662837c1921a646ec63a6e7201f43e2" => :x86_64_linux
  end

  depends_on "bzip2" => [:build, :recommended]
  depends_on "fontconfig" => :build
  depends_on "linuxbrew/xorg/bdftopcf" => :build
  depends_on "linuxbrew/xorg/font-util" => :build
  depends_on "linuxbrew/xorg/mkfontscale" => :build
  depends_on "pkg-config" => :build

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
      --with-fontrootdir=#{share}/fonts/X11
    ]
    args << "--with-compression=bzip2" if build.with? "bzip2"

    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
