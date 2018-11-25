if [ "$1" = "install" ]; then
    cd ~/Downloads/

    # chrome
    sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install google-chrome-stable
    /usr/bin/google-chrome-stable

    # necessary softwares
    sudo apt-get install vim git cmake zsh 

    # zsh 
    chsh -s /bin/zsh
    echo "when failed to chsh: PAM认证 -> sudo vim /etc/passwd, not change first line"
    # oh my zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  
    # pip 
    # mkdir -p ~/.pip
    # vim ~/.pip/pip/conf
    # add the content:
    # [global]
    # index-url = https://pypi.tuna.tsinghua.edu.cn/simple/
   
    # pycharm
    wget https://download.jetbrains.8686c.com/python/pycharm-professional-2018.3.tar.gz
    echo "tar -zxvf of it, find the shell in bin" 

    # clion 
    wget https://download.jetbrains.8686c.com/cpp/CLion-2018.2.6.tar.gz
    echo "tar -zxvf of it, find the shell in bin" 

    # anaconda 
    wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
    bash Anaconda3-5.3.1-Linux-x86_64.sh
    sudo echo export PATH=$PATH:~/anaconda3/bin >> ~/.bashrc
    sudo echo export PATH=$PATH:~/anaconda3/bin >> ~/.zshrc
    source ~/.bashrc
    source ~/.zshrc
    conda create -n yl python=3.5
    
    # python
    source activate yl
    conda install tensorflow=1.3.0 keras matplotlib scikit-learn scikit-image pandas 
    pip install opencv-python
fi

# change xrandr
xrandr --newmode "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
xrandr --addmode DVI-I-1 "1920x1080_60.00"
