class Xkeyboardconfig < Formula
  desc "Keyboard configuration database for the X Window System"
  homepage "https://xorg.freedesktop.org"
  url "https://xorg.freedesktop.org/archive/individual/data/xkeyboard-config/xkeyboard-config-2.28.tar.bz2"
  sha256 "69adb25b0fc64e4075f8ec0eab8d869892419f474f91fb69db1713de2062bdce"

  bottle do
    cellar :any_skip_relocation
    sha256 "6abf9e8fc92ee379b7adf698492852d3d794189564f06976371ff63fd6c17a0a" => :x86_64_linux
  end

  depends_on "gettext" => :build
  depends_on "intltool" => :build
  depends_on "libxslt" => :build
  depends_on "pkg-config" => :build

  def install
    # Needed by intltool (xml::parser)
    ENV.prepend_path "PERL5LIB", "#{Formula["intltool"].libexec}/lib/perl5"

    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
      --with-xkb-rules-symlink=xorg
      --disable-runtime-deps
    ]

    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
