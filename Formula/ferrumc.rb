class Ferrumc < Formula
  desc "Ferrum-language compiler — systems programming with compile-time memory safety"
  homepage "https://ferrum-language.github.io/Ferrum/"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Ferrum-Language/Ferrum/releases/download/v0.3.0/ferrumc-v0.3.0-macos-arm64.tar.gz"
      # sha256 will be updated when macOS CI produces the binary
      sha256 :no_check
    end
    on_intel do
      url "https://github.com/Ferrum-Language/Ferrum/releases/download/v0.3.0/ferrumc-v0.3.0-macos-x86_64.tar.gz"
      sha256 :no_check
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Ferrum-Language/Ferrum/releases/download/v0.3.0/ferrumc-v0.3.0-linux-aarch64.tar.gz"
      sha256 "9284560230b179cfa7d78dea6af1d1d3abd5379279e7aa8ecb2be8262e236fca"
    end
    on_intel do
      url "https://github.com/Ferrum-Language/Ferrum/releases/download/v0.3.0/ferrumc-v0.3.0-linux-x86_64.tar.gz"
      sha256 "1cea7ef7eb58426fe8ec5942d16bee985e218a5997028fc05f137a0c31dd405b"
    end
  end

  depends_on "llvm@18"

  def install
    bin.install "ferrumc"
  end

  test do
    (testpath/"hello.fe").write <<~FE
      #include <stdio.h>
      int main() {
        printf("Hello from Ferrum-language!\\n");
        return 0;
      }
    FE
    system bin/"ferrumc", "hello.fe", "-o", "hello"
    assert_equal "Hello from Ferrum-language!\n", shell_output("./hello")
  end
end
