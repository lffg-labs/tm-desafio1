# Manually deploy a Cloud Function

Primeiro desafio.

## Observações

Atualmente eu não tenho as permissões necessárias para criar Cloud Functions no projeto FIDES (ou qualquer outro dentro da organização da TM no GCP).

Como eu não estou de fato certo sobre onde devo fazer o _deploy_ desta Cloud Function, ao invés de abrir uma PR para dar um _role_ como `roles/cloudfunctions.developer` ao meu usuário no GCP, optei por apenas escrever este documento e amanhã (7 de abril) perguntar onde, de fato, devo subir a função que aqui desenvolveremos.

## Passo a passo

De acordo com [este documento](https://cloud.google.com/functions/docs/writing#types_of_cloud_functions), existem dois tipos principais de _trigger_ para Cloud Functions:
- Event-driven functions
    - Background functions
    - CloudEvent functions
- HTTP functions

Neste exemplo, iremos criar uma HTTP function. Ela deve receber e processar requisições HTTP e então retornar uma resposta que contenha informações sobre a requisição.

Deve ser totalmente criada e _deployada_ manualmente. Entretanto, ao invés de realizar esses passos manualmente pelo GCP Console, vamos utilizar a CLI `gcloud`.

1. **Autenticar**

    Utilizar o comando `gcloud auth login`.

1. **Implementar a função**

    Código-fonte em `index.js`.

    - [Referência do runtime de Node.js.](https://cloud.google.com/functions/docs/concepts/nodejs-runtime)
    - [Como estruturar o código?](https://cloud.google.com/functions/docs/writing#functions-writing-file-structuring-nodejs)

1. **Deploy**

    Utilizar o comando [`gcloud functions deploy`](https://cloud.google.com/sdk/gcloud/reference/functions/deploy).

    Execute `./deploy.sh`.

    Note a flag _source_, que indica que o diretório atual irá conter o código-fonte da função. Este é o valor padrão, mas preferi deixar explícito. Aliás, existe, neste diretório, o arquivo `.gcloudignore` para evitar que arquivos irrelevantes sejam enviados.

    Outra flag interessante a se notar é `--allow-unauthenticated`, que permite que qualquer pessoa invoque a função, mesmo sem estar autorizada.
