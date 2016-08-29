repo_folder=$1
app_name=$2
rails_env=$3
apps_folder=$4
app_folder=$5
repos_folder=$6

nginx_file="/etc/nginx/sites-available/${app_name}"
nginx_file_enabled="/etc/nginx/sites-enabled/${app_name}"
sock_file="/tmp/puma.${app_name}.sock"

echo app_name $app_name
echo repos_folder $repos_folder
echo repo_folder $repo_folder
echo apps_folder $apps_folder
echo app_folder $app_folder
echo rails_env $rails_env
echo nginx_file $nginx_file
echo nginx_file_enabled $nginx_file_enabled

# Install RVM
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
\curl -sSL https://get.rvm.io | bash -s stable --ruby
echo 'source /usr/local/rvm/scripts/rvm' >> ~/.bashrc

# Install bundler
gem i bundler

# Install git and nginx, see below how to config
apt-get install -y git nginx nodejs

mkdir -p "${repo_folder}"
mkdir -p "${app_folder}"

# Create git bare repository
cd "${repo_folder}"
git init --bare
echo "erb app_folder=$app_folder repo_folder=$repo_folder sock_file=$sock_file rails_env=$rails_env ~/deploy/post-receive.erb > hooks/post-receive"
erb app_folder="${app_folder}" repo_folder="${repo_folder}" sock_file="${sock_file}" rails_env="${rails_env}" ~/deploy/post-receive.erb > hooks/post-receive
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
