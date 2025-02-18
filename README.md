<h1 align="center">

Gerenciamento de visitas

</h1>

<p align="center">
  Implementação de um sistema monilitico em ruby on rails para gerenciamento de visitas 
</p>

## Primeiros passos

Esse projeto foi construido com postgresql portanto configure no arquivo config/database.yml seu user e password do postgres

```bash
# criar o banco de dados
  rails db:create

# realizar as migracoes para criar as tabelas
  rails db:migrate

# cadastrar 3 usuarios iniciais 
  rails db:seeds

# instalando as dependencias do projeto
  bundle install

#roadando servidor no localhost:3000
  bin/rails server

```
## Usuarios default

O sistema permite a criacao de outros usuarios mas ele precisa comecar com um banco povoado por pelo menos um admin rodando a seed vc tem acesso as 3 usuarios, um para cada role do sistema 

```bash
#Usuario Admin
  email: 'admin@exemplo.com',
  password: '123123', 
  role: 3,

#Usuario Atendente
  email: 'atendente@exemplo.com',
  password: '123123', 
  role: 2,

#Usuario Funcionario
  email: 'funcionario@exemplo.com',
  password: '123123', 
  role: 1,

```
