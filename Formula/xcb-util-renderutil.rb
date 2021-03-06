class XcbUtilRenderutil < Formula
  desc "Additional extensions to the XCB library"
  homepage "https://xcb.freedesktop.org"
  url "https://xcb.freedesktop.org/dist/xcb-util-renderutil-0.3.9.tar.bz2"
  sha256 "c6e97e48fb1286d6394dddb1c1732f00227c70bd1bedb7d1acabefdd340bea5b"

  bottle do
    root_url "https://linuxbrew.bintray.com/bottles-xorg"
    cellar :any_skip_relocation
    sha256 "e6452ef548b8135234cbea14e8105432c414eb4099db2483803456109d93398b" => :x86_64_linux
  end

  option "with-docs", "Regenerate documentation (requires doxygen)"

  depends_on "doxygen" => :build if build.with? "docs"
  depends_on "linuxbrew/xorg/util-macros" => :build
  depends_on "pkg-config" => :build
  depends_on "linuxbrew/xorg/libxcb"

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
      --enable-devel-docs=#{build.with?("docs") ? "yes" : "no"}
      --with-doxygen=#{build.with?("docs") ? "yes" : "no"}
    ]

    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
