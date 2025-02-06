# INSTRUÇÕES PARA O FUNCIONAMENTO DO SISTEMA

**BANCO DE DADOS UTILIZADO:** PostgreSQL 17rc1  
**Versão do Ruby On Rails:** 7.2.1
**Versão do Ruby:** 3.3.5

## Primeiro Passo: (Preparar a aplicação)
1. Iniciar o terminal na pasta raiz do programa (rh_system).
2. Utilizar o comando `bundle install` para instalar as gems necessárias.
3. Utilizar o comando `rake db:schema:load` para criar o banco de dados junto de suas colunas.
   3.1. Uma alternativa pode ser utilizar `rake db:create` e depois `rake db:migrate`.
4. Utilizar o comando `rails db:seed` para popular o banco de dados com algumas informações base.

## Segundo Passo: (Inicializar a aplicação)
1. Utilizar o comando `rails s`.

## Terceiro Passo: (Acessar a aplicação)
1. O acesso é feito pelo endereço do ambiente:
   - Ex.: [http://localhost:3000/](http://localhost:3000/)

