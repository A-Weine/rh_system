
//Espera a página carregar antes de realizar funções
document.addEventListener('DOMContentLoaded', function() {
    //Função feita para limitar quantidade de digitos colocados no campo CPF no momento de cadastrar/editar um funcionário.
    //Percebe o campo cpf por meio do id do formulário.
    document.querySelector('#cpf').addEventListener('input', function(event) {
        var input = event.target;
        var value = input.value.replace(/\D/g, ''); // Remove caracteres não númericos

        // Limita o número de dígitos a 11
        if (value.length > 11) {
            value = value.substring(0, 11);
        }

        //Aplica a formatação de CPF após o usuário colocar os 11 digitos: xxx.xxx.xxx-xx
        value = value.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4');
        
        //Atualiza o campo do formulário com a formatação
        input.value = value;
    });
    document.querySelector('#rg').addEventListener('input', function(event) {
        //Função identica a anterior, mas para o campo do RG, também identifica o formulário através do ID.
        var input = event.target;
        var value = input.value.replace(/\D/g, ''); //Remove caracteres não númericos

        //Limita o número de dígitos a 9
        if (value.length > 9) {
            value = value.substring(0, 9);
        }

        //Aplica a formatação de RG: xxx.xxx.xxx
        value = value.replace(/(\d{3})(\d{3})(\d{3})/, '$1.$2.$3');
        
        //Atualiza o campo do formulário com a formatação
        input.value = value;
    });
    document.querySelector('#phone').addEventListener('input', function(event) {
        //Função identica a anterior, mas para o campo do Nº de Celular, também identifica o formulário através do ID
        var input = event.target;
        var value = input.value.replace(/\D/g, ''); //Remove caracteres não númericos

        //Limita o número de dígitos a 11
        if (value.length > 11) {
            value = value.substring(0, 11);
        }

        //Aplica a formatação de Celular: (xx) x xxxx-xxxx
        value = value.replace(/(\d{2})(\d{1})(\d{4})(\d{4})/, '($1) $2 $3-$4');
        
        //Atualiza o campo do formulário com a formatação
        input.value = value;
    });
    document.querySelector('#cep').addEventListener('input', function(event) {
        //Função identica a anterior, mas para o campo do CEP, também identifica o formulário através do ID
        var input = event.target;
        var value = input.value.replace(/\D/g, ''); //Remove caracteres não númericos

        //Limita o número de dígitos a 8
        if (value.length > 8) {
            value = value.substring(0, 8);
        }

        //Aplica a formatação de CEP: xxxxx-xxx
        value = value.replace(/(\d{5})(\d{3})/, '$1-$2');
        
        //Atualiza o campo de input com a formatação
        input.value = value;
    });
});

//Espera página carregar para aplicar funções
document.addEventListener("DOMContentLoaded", function() {
    const deleteForms = document.querySelectorAll('.delete-form');
    //Identifica botão de deletar pela classe

    deleteForms.forEach(function(form) {
        form.addEventListener('submit', function(event) {
        //Mostra caixa de confirmação para quando é pressionado o botão de deletar algum registro (funcionário, cargo, departamento, usuário)
        const confirmation = confirm('Você tem certeza de que deseja remover este item?');

        if (!confirmation) {
            event.preventDefault();  //Impede o envio se a confirmação for cancelada
        }
        });
    });
});

