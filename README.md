# React + Django app deployed with Helm

## Deploy

Deploy the **Chat App** on Okteto by clicking the following button:

[![Develop on Okteto](https://okteto.com/develop-okteto.svg)](https://cloud.okteto.com/deploy)

Or alternatively, execute the following command:

```console
$ kubectl apply -f ingress.yml
ingress.extensions/flowers created
```

```console
$ okteto stack deploy --build
...
 ✓  Successfully deployed stack 'flowers'
```

from the root of this repo.

## Develop

Once your app is **Running**, execute the following command to activate your **frontend** development container:

```command
$ okteto up -f forntend/okteto.yml
```

```
 ✓  Development container activated
 ✓  Files synchronized
    Namespace: cindy
    Name:      frontend

>
```

Or execute the following command to activate your **api** development container:

```command
$ okteto up -f api/okteto.yml
```

```
 ✓  Development container activated
 ✓  Files synchronized
    Namespace: cindy
    Name:      api

>
```