git_folder=$1
app_name=$2
repo_folder="${git_folder}/${app_name}.git"


nginx_file="/etc/nginx/sites-available/${app_name}"
nginx_file_enabled="/etc/nginx/sites-enabled/${app_name}"


# Install RVM
\curl -sSL https://get.rvm.io | bash -s stable --ruby
echo 'source /usr/local/rmv/scripts/rvm' >> ~/.bashrc

# Install bundler
gem i bundler

# Install git and nginx, see below how to config
apt-get install git nginx

# Create git bare repository
mkdir -p "${repo_folder}"
cd "${repo_folder}"
git init --bare
cp ~/deploy/post-receive hooks/post-receive
chmod +x hooks/post-receive
erb app_name="${app_name}" deploy/nginx_site.erb > "${nginx_file}"
sudo ln -s "${nginx_file}" "${nginx_file_enabled}"
service nginx restart

git config receive.denyDeleteCurrent warn
