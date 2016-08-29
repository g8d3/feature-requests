ssh_host=$1
app_name=$2
rails_env=${3:-production}
git_remote=${4:-live}
repos_folder='/var/repos'
apps_folder='/var/www'

repo_folder="${repos_folder}/${app_name}.git"
app_folder="${apps_folder}/${app_name}"


scp -r deploy "${ssh_host}:~"
ssh "${ssh_host}" 'bash -sl' < deploy/remote_setup.sh $repo_folder $app_name $rails_env $apps_folder $app_folder $repos_folder
scp .env "${ssh_host}:${app_folder}"

git remote remove "${git_remote}"
git remote add "${git_remote}" "${ssh_host}:${repo_folder}"
