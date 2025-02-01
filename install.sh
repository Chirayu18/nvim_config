echo "================= Installing fzf ==========="
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "================ Installing zoxide ========="
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
echo "================ Installing nvim ========="
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
rm -rf ~/nvim
tar -C ~/ -xzf nvim-linux-x86_64.tar.gz
echo "export PATH=\"$PATH:/opt/nvim-linux-x86_64/bin\"" >> ~/.bashrc
echo "alias vi=nvim" >> ~/.bashrc
echo "================ Configuring nvim ========="
git clone https://github.com/Chirayu18/nvim_config ~/.config/nvim
