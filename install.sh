if [ "$1" = "install" ]; then
    cd ~/Downloads/

    # chrome
    sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install google-chrome-stable
    /usr/bin/google-chrome-stable

    # necessary softwares
    sudo apt-get install vim git cmake zsh curl
    sudo echo "set nu" >> ~/.vimrc
    sudo echo "set expandtab" >> ~/.vimrc
    sudo echo "set ts=4" >> ~/.vimrc
    sudo echo "set autoindent" >> ~/.vimrc

    # terminal theme
    git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
    bash gome-terminal-colors-solarized/set_dark.sh
    echo "input 1 YES 2"

    # zsh 
    chsh -s /bin/zsh
    echo "when failed to chsh: PAM认证 -> sudo vim /etc/passwd, not change first line"
    # oh my zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  
    # pycharm
    wget https://download.jetbrains.8686c.com/python/pycharm-professional-2018.3.tar.gz
    tar -xzvf pycharm-professional-2018.3.tar.gz
    sh pycharm-2018.3/pycharm.sh

    # anaconda 
    wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
    bash Anaconda3-5.3.1-Linux-x86_64.sh
    sudo echo export PATH=$PATH:~/anaconda3/bin >> ~/.bashrc
    source ~/.bashrc
    conda config --add channels 'https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/'
    conda config --set show_channel_urls yes
    conda create -n yl python=3.5
    
    # python
    source activate yl
    conda install tensorflow=1.3.0 keras matplotlib scikit-learn scikit-image pandas 
    pip install opencv-python
    
    # clion 
    wget https://download.jetbrains.8686c.com/cpp/CLion-2018.2.6.tar.gz
    echo "tar -zxvf of it, find the shell in bin" 
else
    # change xrandr
    xrandr --newmode "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
    xrandr --addmode DVI-I-1 "1920x1080_60.00"
fi
