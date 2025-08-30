# Projeto Agenda Pol

> [!NOTE]
> Um sistema de agendamento para salas para professores agendarem horários e alunos visualizarem o agendamento de salas, com um administrador geral para o sistema

## Sumário

1. **dependencias**
   1. [dependencias](#dependencias)

2. **Deploy**
   1. [deploy do backend](#deploy-backend)

3. **Backend**
   1. [modeloER](#modelo-er)
   2. [Funcionalidades](#funcionalidades)
   3. [Arquitetura da API](#arquitetura-da-api)
   4. [regras de negocio](#regras-de-negócio)

4. **Frontend**
   1. [figma](#link-figma)
   2. [protótipos](#protótipos)
   3. [funcionalidades](#funcionalidades)

## dependências
> [!NOTE]
> Todas as dependencias serão gerenciadas pelo docker em ambientes isolados cabendo ao desenvolvedor ter o docker devidamente instalado no seu sistema

- JDK21
- docker
- npm
- nodejs
- visual studio / intellij
- ambiente linux (wsl, ou maquina virtual)

## deploy

### deploy backend

Estando na pasta /backed execute:

```bash
docker compose up -d
```

>[!NOTE]
>Verifique os serviços:

>```bash
>docker ps
>docker logs dbAgenda
>docker logs adminAgenda
>```

Neste ponto a API já esta sendo executada se preferir acesse a interface grafica do pgadmin
com o seguinte link na url do seu navegador

```bash
http://localhost:5050
```

![interface grafica do pgadmin web](/docs/adminAgenda.png)

insira as credencias do pgadmin definido nas variaveis de ambiente e configure um servidor novo
colocando o nome do host como o nome do container do banco ou seu endereço ip, senha usuario e nome do banco

![interface gráfica do pgadmin web](/docs/adminAgendaServer.png.png)

## Backend do sistema

### modelo ER
![modelo er](/docs/modeloER.png)

### funcionalidades

### arquitetura da API

### regras de negócio

## Frontend do sistema

### link figma

- [link para o figma](https://www.figma.com/design/cZoiSPsSOjAio7jQksXsnF/Marca%C3%A7%C3%A3o-de-sala--Eng-De-Software-?node-id=0-1&t=VGR2Ehy1dGJEXv2G-1)

### protótipos

### funcionalidades