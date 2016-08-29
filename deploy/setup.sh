ssh_host=$1
app_name=$2
git_remote=${3:-live}
repos_folder=${4:-$HOME/repos}

repo_folder="${repos_folder}/${app_name}.git"


scp -r deploy "${ssh_host}:~"
ssh "${ssh_host}" 'bash -s' < deploy/remote_setup.sh $repo_folder $app_name
git remote add "${git_remote}" "${ssh_host}:${repo_folder}"
