pkgname=quicknotex
pkgver=1.1.0
pkgrel=1
pkgdesc="A fast, rofi-based note-taking application for Hyprland"
arch=('x86_64')
url="https://github.com/yourusername/QuickNoteX" # Replace with your repo URL
license=('MIT') # Or whatever license you choose
depends=('rofi')
makedepends=('gcc')

# Use a locally created tarball as the source
source=("quicknotex-$pkgver.tar.gz")
sha256sums=('SKIP') # Use SKIP for local development, replace with actual checksum for releases

build() {
  # makepkg will extract the tarball into $srcdir
  cd "$srcdir"

  # --- DEBUGGING START ---
  echo "Current directory during build:"
  pwd
  echo "Contents of current directory:"
  ls -F
  # --- DEBUGGING END ---

  make -C Backend
}

package() {
  cd "$srcdir"

  # Install backend executable
  install -D -m755 Backend/quicknote "$pkgdir/usr/local/bin/quicknote"

  # Install launch script
  install -D -m755 launch_quicknotex.sh "$pkgdir/usr/local/bin/quicknotex-launcher"

  # Install rofi themes (system-wide)
  install -D -m644 rofi_themes/quicknote.rasi "$pkgdir/usr/share/rofi/themes/quicknote.rasi"
  install -D -m644 rofi_themes/quicknote_display.rasi "$pkgdir/usr/share/rofi/themes/quicknote_display.rasi"

  # Install notes.txt (optional, for initial setup)
  install -D -m644 notes.txt "$pkgdir/usr/share/quicknotex/notes.txt"
}
