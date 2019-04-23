/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var ctx_path = "/ConferenciaUrp";

$(document).ready(function () {

    $('#example2').DataTable({
        "scrollY": "140px",
        //"scrollCollapse": true,
        //"paging": false,
        pageLength: 10,
        lengthMenu: [[10, 20, -1], [10, 20, 'Todos']],
        "language": {
            "url": "js/Spanish.json"
        }
    });
});

function f_InsertarTipoConferencia() {

    var tipoConferencia = document.frmInsertarTC.textTipoConferencia.value;
    if (tipoConferencia === "") {
        alert('Ingrese tipo de conferencia !!! ');
    } else {
        var reporte = "01";
        tipoConferencia = encodeURIComponent(tipoConferencia);
        var ruta = ctx_path.concat("/conferencia/menu/conferencia/tipo/tipoConferencia_ajax.jsp?pasacache=",
                new Date().getTime(),
                "&reporte=", reporte,
                "&tipoConferencia=", tipoConferencia
                );
        $('#error').load(ruta, function (status, xhr) {
            if (xhr === "error") {
                var msg = "Error! algo ha sucedido: ";
                $('#error').html(msg, status);
            } else {
                var msg = document.all.retMsj.value;
                alert(msg);
                $('#error').text(msg);
            }
        });
    }
}