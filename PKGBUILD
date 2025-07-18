pkgname=quicknotex
pkgver=1.1.0
pkgrel=1
pkgdesc="A fast, rofi-based note-taking application for Hyprland"
arch=('x86_64')
url="https://github.com/yourusername/QuickNoteX"
license=('MIT')
depends=('rofi')
makedepends=('gcc')

source=("quicknotex-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir"
  make -C Backend
}

package() {
  cd "$srcdir"

  install -D -m755 Backend/quicknote "$pkgdir/usr/local/bin/quicknote"

  install -D -m755 launch_quicknotex.sh "$pkgdir/usr/local/bin/quicknotex-launcher"

  install -D -m644 rofi_themes/quicknote.rasi "$pkgdir/usr/share/rofi/themes/quicknote.rasi"
  install -D -m644 rofi_themes/quicknote_display.rasi "$pkgdir/usr/share/rofi/themes/quicknote_display.rasi"

  install -D -m644 notes.txt "$pkgdir/usr/share/quicknotex/notes.txt"
}
