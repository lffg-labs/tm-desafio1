set -x

# O nome do recurso (no GCP) associado à função
FN_NAME=my-first-function

# Identificador da função no código-fonte
FN_ENTRY_POINT=myFirstFn

gcloud functions deploy $FN_NAME \
    --entry-point=$FN_ENTRY_POINT \
    --runtime=nodejs16 \
    --source=. \
    --region=us-central1 \
    --trigger-http \
    --allow-unauthenticated