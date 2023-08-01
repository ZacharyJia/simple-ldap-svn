mkdir -p /data/svn_repos

# 判断用户是否输入项目名
if [ ! -n "$1" ]; then
    echo "usage: create-repo.sh <project_name>"
    exit
fi
# 根据用户输入的项目名创建项目
svnadmin create /data/svn_repos/$1
chown -R www-data:www-data /data/svn_repos/$1