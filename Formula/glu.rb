class Glu < Formula
  desc "Mesa OpenGL Utility library"
  homepage "https://cgit.freedesktop.org/mesa/glu"
  url "ftp://ftp.freedesktop.org/pub/mesa/glu/glu-9.0.1.tar.xz"
  sha256 "fb5a4c2dd6ba6d1c21ab7c05129b0769544e1d68e1e3b0ffecb18e73c93055bc"

  bottle do
    root_url "https://linuxbrew.bintray.com/bottles-xorg"
    cellar :any_skip_relocation
    sha256 "4224f8bb39d9ee78f1959fae152bab7f1dba6b8bbe666bf9a423e88c143aacaa" => :x86_64_linux
  end

  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "linuxbrew/xorg/mesa"

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-dependency-tracking
      --disable-silent-rules
    ]

    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
