# Gravitee.io - API Management - Drive api definition settings action

This action allows to perform GitOps approach with Gravitee's configuration.
The api definition configuration is defined in template and value files. This action allows to automate the modifications and deployment of API definition configuration in Gravitee's API Management tool.
This action is based on [graviteeio-cli](https://github.com/gravitee-io/graviteeio-cli "graviteeio-cli")

## Inputs

| Argument | Description | Default | Values
| --- | --- | --- | --- |
command (`Required`) | api definition command | `diff`| `diff`, `apply`, `verion`
api (`Required`)| api id |
gio_workspaces | folder path containing template and values files for api definition| `gio`
options | Option parameters for command |


## Commands

| Command | Description |
| --- | --- |
`verion` | Display Gravitee CLI version.
`diff` | Compare api definition configuration in repository with api defintion configuration on the remote server.
`apply` | Apply api definition configuration in repository on the remote server.


## Options

### Command: diff

```shell
-s, --set TEXT      Overload the value(s) of value file eg: `--set
                      proxy.groups[0].name=mynewtest`
```

### Command: apply

```shell
-s, --set TEXT      Overload the value(s) of value file eg: `--set
                      proxy.groups[0].name=mynewtest`
--with-deploy       Deploy api after applying
```

## Environment variables 
| variable | Description |
| --- | --- |
`GIO_TOKEN` | Personnal acces token Api Management gravitee
`GIO_APIM_URL` | Api Management URL.
`GIO_APIM_ORG` | Organisation. Add `GIO_APIM_ORG: DEFAULT` only higher version 3.x.
`GIO_APIM_ENV` | Environment. Add `GIO_APIM_ENV: DEFAULT` only higher version 3.x.

## Example usage

For api management below verion 3.x, remove environment variable GIO_APIM_ORG and GIO_APIM_ENV

```yaml
on: [push]

jobs:
  gio_job:
    runs-on: ubuntu-latest
    name: job gio diff
    steps:
      - uses: actions/checkout@v2
        name: "checkout"
      - name: gio apim apis diff
        id: gio_apim_apis_diff
        uses: GGui/graviteeio-apim-api-definition-action@v0.1
        env:
          GIO_TOKEN: ${{ secrets.GIO_TOKEN }}
          GIO_APIM_URL: ${{ secrets.GIO_APIM_URL }}
          GIO_APIM_ORG: DEFAULT
          GIO_APIM_ENV: DEFAULT
        with:
            command: "diff"
            api: ${{ secrets.GIO_API_ID }}
            gio_workspaces: "gio"
      - name: gio apim apis apply
        id: gio_apim_apis_apply
        uses: GGui/graviteeio-apim-api-definition-action@v0.1
        env:
          GIO_TOKEN: ${{ secrets.GIO_TOKEN }}
          GIO_APIM_URL: ${{ secrets.GIO_APIM_URL }}
          GIO_APIM_ORG: DEFAULT
          GIO_APIM_ENV: DEFAULT
        with:
            command: "apply"
            api: ${{ secrets.GIO_API_ID }}
            gio_workspaces: "gio"
```


