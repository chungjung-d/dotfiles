macOS용 Dotfiles (Kitty + Zsh + Starship)

구성
- Kitty: `~/.config/kitty/kitty.conf`, `~/.config/kitty/dracula.conf`
- Starship: `~/.config/starship.toml`
- Zsh: `~/.zshrc` (zinit 플러그인 매니저, starship, kitty shell integration)
- 설치 스크립트: `install.sh` (심볼릭 링크 생성)
- 패키지: `Brewfile` (kitty, starship, zsh 도구들)

사전 준비
- Homebrew 설치가 필요합니다.
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

새 맥에서 설치(빠른 시작)
```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
brew bundle
./install.sh           # 기존 파일이 있으면 건너뜀
# 또는 강제 덮어쓰기: FORCE=1 ./install.sh
```

이 맥(현재 머신)도 심볼릭 링크 전환
```bash
cd ~/dotfiles
brew bundle
FORCE=1 ./install.sh
```

업데이트 흐름
1) `~/dotfiles` 안의 파일(kitty, zshrc, starship 등)을 수정
2) Git 커밋/푸시
3) 다른 머신에서 `git pull` 후 `./install.sh` (필요시 `FORCE=1`)

참고 사항
- `install.sh`는 대상 경로에 심볼릭 링크를 만들며, `FORCE=1`일 때 기존 파일/링크를 대체합니다.
- zinit은 최초 셸 시작 시 자동으로 플러그인을 설치/로드합니다.
- Kitty 커서 트레일 기능을 사용하려면 `kitty.conf`의 `cursor_trail 3`이 필요합니다. 최신 빌드에서 동작합니다.
  - Homebrew: `brew install --cask kitty` (안정판)
  - 또는 최신/nightly를 직접 설치해 사용하세요.

선택 사항
- Nerd Font 등 예쁜 글리프 폰트 설치를 원하면 `Brewfile`에서 주석을 해제하세요.
  ```
  # cask "font-jetbrains-mono-nerd-font"
  ```

원격 저장소로 푸시
```bash
cd ~/dotfiles
git remote add origin <your-repo-url>
git push -u origin master
```
