set -x

# O nome do recurso (no GCP) associado à função
FN_NAME=my-first-function

gcloud functions delete $FN_NAME