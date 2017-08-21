function github
  set url 'https://github.com'
  set repository (git remote show -n origin ^ /dev/null | grep "Fetch URL" | perl -ne 'print $1 if /(\w+[\.\/]\w+)(?=\.git)/')
  set branch (git symbolic-ref HEAD ^ /dev/null | sed -e 's|^refs/heads/||')

  if test (count $repository) -eq 0
    echo 'Not a GitHub repository'
    return 127
  end

  set url "$url/$repository"

  if test (count $argv) -gt 0
    pushd (dirname $argv[1])
      set pwd (pwd)
      set git_dir (git rev-parse --show-toplevel)
      set file (echo $pwd | sed 's#'$git_dir'##')
      set file $file'/'(basename $argv[1])
      set file (echo $file | sed 's/:\([0-9]*\)$/#L\1/')
      set url (echo "$url/blob/$branch/$file" | sed 's#//#/#g')
    popd
  else
    set url "$url/tree/$branch"
  end

  open $url
end
