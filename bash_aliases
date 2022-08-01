# ls
# puts slash after directory names
alias ls='ls -F'

# show hidden files but not parent directory
alias la='ls -A'

# list files with additional information and human readable sizes.
alias ll='ls -lh'

# same as above but includes hidden files
alias lla='ls -lha'

# directories only
alias lsd='ls /'

# directories only
alias lasd='ls -A /'

alias grep='grep -i --color=auto'

# network utilities
alias ping5='ping -c 5 '
alias netq='networkQuality -v'

# https://youtube-dl.org/
alias ytdl='youtube-dl'
alias cwtv='youtube-dl -o "%(series)s - s%(season_number)se%(episode_number)s - %(title)s.%(ext)s" --all-subs'
alias ytdl-t='youtube-dl -o "%(title)s.%(ext)s"'
alias ytdl-audio='youtube-dl -f "bestaudio[ext=m4a]"'

# https://brew.sh/
alias buo='brew update && brew outdated'
alias bup='brew upgrade'

#node installed with brew
alias node17='export PATH="/usr/local/opt/node@17/bin:$PATH"'
alias node16='export PATH="/usr/local/opt/node@16/bin:$PATH"'
alias node14='export PATH="/usr/local/opt/node@14/bin:$PATH"'

# mongodb installed with brew
alias mongod-start='brew services start mongodb-community'
alias mongod-stop='brew services stop mongodb-community'
alias mongod-restart='brew services restart mongodb-community'

#mysql installed with brew
alias mysql-start='brew services start mysql'
alias mysql-stop='brew services stop mysql'
alias mysql-restart='brew services restart mysql'

#postgre installed with brew
alias postgre-start='brew services start postgresql'
alias postgre-stop='brew services stop postgresql'
alias postgre-restart='brew services restart postgresql'

#php installed with brew
alias php-start='brew services start php'
alias php-stop='brew services stop php'
alias php-restart='brew services restart php'
alias php-here='php -S 0.0.0.0:8888 -t . && echo http://0.0.0.0:8888 | pbcopy'

#apache
alias edit-apache='open /etc/apache2/httpd.conf'
alias restore-apache-permissions='chmod +a "_www allow execute" ~'
alias code-sign-php='codesign --sign "custom certificate authority" --force --keychain ~/Library/Keychains/login.keychain-db /usr/local/opt/php/lib/httpd/modules/libphp.so'
# name of custom certificate authority ^^^^^^^^^^^^^^^^^^^^^^^^^^^