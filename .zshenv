# Automatically add argcomplete to fpath from active kube virtualenv (dynamic python version)
for _d in ~/work/core/kube/.venv/lib/python*/site-packages/argcomplete/bash_completion.d(N) \
          ~/work/core/kube/venv/lib/python*/site-packages/argcomplete/bash_completion.d(N); do
  fpath=( "$_d" "${fpath[@]}" )
  break
done
unset _d
