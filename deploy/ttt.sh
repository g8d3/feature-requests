server=$1
remote=$2

app_name=$3
git_folder=${4:-/var/repos}
repo_folder="${git_folder}/${app_name}.git"

# scp -r deploy "${server}:~"

ssh "${server}" 'bash -s' < deploy/remo.sh $app_name $git_folder
# git remote add "${remote}" "${server}:${repo_folder}"
