repo_folder=$1
app_path=$2
app_name=$3
rails_env=$4
apps_folder=$5
app_folder=$6
repos_folder=$7

nginx_file="/etc/nginx/sites-available/${app_name}"
nginx_file_enabled="/etc/nginx/sites-enabled/${app_name}"
sock_file="/tmp/puma.${app_name}.sock"

echo app_path $app_path
echo app_name $app_name
echo repos_folder $repos_folder
echo repo_folder $repo_folder
echo apps_folder $apps_folder
echo app_folder $app_folder
echo rails_env $rails_env
echo nginx_file $nginx_file
echo nginx_file_enabled $nginx_file_enabled

# Install RVM
if [ ! $(command -v rvm) ]; then
  command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
  echo 'source /usr/local/rvm/scripts/rvm' >> ~/.bashrc
fi

# Install bundler
if [ ! $(command -v bundler) ]; then gem i bundler; fi

# Install git and nginx, see below how to config
if [ ! $(command -v git) ]; then apt-get install -y git; fi
if [ ! $(command -v nginx) ]; then apt-get install -y nginx; fi
if [ ! $(command -v nodejs) ]; then apt-get install -y nodejs; fi
ln -s $(which nodejs) /usr/bin/node
if [ ! $(command -v npm) ]; then apt-get install -y npm; fi
if [ ! $(command -v bower) ]; then npm install bower -g; fi

mkdir -p "${repo_folder}"
mkdir -p "${app_folder}"

# Create git bare repository
cd "${repo_folder}"
git init --bare
echo "erb app_folder=$app_folder repo_folder=$repo_folder sock_file=$sock_file rails_env=$rails_env ~/deploy/post-receive.erb > hooks/post-receive"
erb app_path="${app_path}" app_folder="${app_folder}" repo_folder="${repo_folder}" sock_file="${sock_file}" rails_env="${rails_env}" ~/deploy/post-receive.erb > hooks/post-receive
chmod +x hooks/post-receive
chown -R www-data:www-data "${apps_folder}"
chown -R www-data:www-data "${repos_folder}"

# nginx file
erb sock_file="${sock_file}" app_folder="${app_folder}" ~/deploy/nginx_site.erb > "${nginx_file}"
sudo ln -s "${nginx_file}" "${nginx_file_enabled}"
rm /etc/nginx/sites-enabled/default
service nginx restart

# git allow force delete
git config receive.denyDeleteCurrent warn
