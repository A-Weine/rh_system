$(document).ready(function() {
    $('#cpf').on('input', function() {
        var input = $(this);
        input.val(input.val().replace(/\D/g, '').replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4'));
    });
});
