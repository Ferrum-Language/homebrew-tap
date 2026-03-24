class Ferrumc < Formula
  desc "Ferrum-language compiler — systems programming with compile-time memory safety"
  homepage "https://ferrum-language.github.io/Ferrum/"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Ferrum-Language/Ferrum/releases/download/v0.3.0/ferrumc-v0.3.0-macos-arm64.tar.gz"
      sha256 "dd299666b2f859ff1f07fc7494d8dffe4b9f568e132168531ab5636b9011f520"
    end
    on_intel do
      url "https://github.com/Ferrum-Language/Ferrum/releases/download/v0.3.0/ferrumc-v0.3.0-macos-x86_64.tar.gz"
      sha256 "bc22feaf923829d4c8f18ff2b69ab4ed369b52b2d84244301167be4801c5082f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Ferrum-Language/Ferrum/releases/download/v0.3.0/ferrumc-v0.3.0-linux-aarch64.tar.gz"
      sha256 "4324815376c13b8038705864805c4d5b0e44910b6cc52c3111ec311afcc4cf9c"
    end
    on_intel do
      url "https://github.com/Ferrum-Language/Ferrum/releases/download/v0.3.0/ferrumc-v0.3.0-linux-x86_64.tar.gz"
      sha256 "2735cf702ff9c3f3bf9ad95140bde211f3e642590e9222800f81969727ea6029"
    end
  end

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
