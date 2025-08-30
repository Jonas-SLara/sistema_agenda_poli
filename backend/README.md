# API REST do sistema

## Lista de dependencias e versões

- JDK 21
- Dependencias e Spring version no pom.xml
- maven gerenciado pelo própio spring
- postgres:16 em um container docker

## Estrutura de endpoints da API

## Fluxogramas de consultas

## Deploy da aplicação

O seguinte arquivo contém todos os serviços a serem executados em desenvolvimento

**/docker-compose-api.yml**

Neste arquivo contém os seguintes Serviços em containers apartir das imagens

- postgres:16
um container para o banco de dados postgres na versão 16

- dpage/pgadmin4:8
interface gráfica do pgadmin para navegador


Existe um arquivo .env com variáveis de ambiente na raiz do projeto, deve ser
usado quando iniciar os serviços com o docker


## instruções para executar a aplicação
Na pasta raiz do projeto execute:

```bash
docker compose --env-file ../.env -f docker-compose-dev.yml up -d
```

Ainda No terminal execute:
```bash
docker ps
```

verifique se a sáida gerou os container com os devidos nomes e com as portas mapeadas

```bash
docker logs dbAgenda
```

verifica os logs do serviço dbAgenda se o banco começou, de uma verificada

No navegador digite o host e a porta que o pg admin usa

```url
http://localhost:5050
```

Você verá uma tela de login do pgAdmin, insira as credenciais

Depois clique em add New Server e de um nome para ele e use os seguintes dados:
- host/name address -> nome do container do banco ou endereço ip dele
- port -> porta onde esta rodando o banco
- username -> nome do usuario do banco
- password -> senha do banco

Por fim confira se o banco foi criado com o nome agenda

Descrição do comando:
--env-file -> diz ao docker onde esta o arquivo com as variaveis de ambiente para serem setadas
-f -> diz exatamente qual arquivo deve ser lido



