/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var ctx_path = "/ConferenciaUrp";
$(document).ready(function () {
    $('#example1').DataTable({
        //"scrollY": "135px",
        //"scrollCollapse": true,
        //"paging": false,
        pageLength: 5,
        lengthMenu: [[5, 10, 20, -1], [5, 10, 20, 'Todos']],
        "language": {
            "url": "js/Spanish.json"
        }
    });
    $('#example2').DataTable({
        //"scrollY": "135px",
        //"scrollCollapse": true,
        //"paging": false,
        pageLength: 5,
        lengthMenu: [[5, 10, 20, -1], [5, 10, 20, 'Todos']],
        "language": {
            "url": "js/Spanish.json"
        }
    });
    $('#example3').DataTable({
        //"scrollY": "135px",
        //"scrollCollapse": true,
        //"paging": false,
        pageLength: 5,
        lengthMenu: [[5, 10, 20, -1], [5, 10, 20, 'Todos']],
        "language": {
            "url": "js/Spanish.json"
        }
    });
});

function MasInformacionTC() {

    $("#mostrarPanel").collapse({
        collapsible: false,
        active: true
    });

}

function f_MostrarTabla() {
    var reporte = "01";
    var ruta = ctx_path.concat("/conferencia/menu/conferencia/conferencia_ajax.jsp?pasacache=",
            new Date().getTime(),
            "&reporte=", reporte);
    $('#work-space').load(ruta, function (status, xhr) {
        if (xhr === "error") {
            var msg = "Error! algo ha sucedido: ";
            $('#work-space').html(msg, status);
        }
    });
}

function f_MostrarRegistroTC() {
    var reporte = "02";
    var ruta = ctx_path.concat("/conferencia/menu/conferencia/conferencia_ajax.jsp?pasacache=",
            new Date().getTime(),
            "&reporte=", reporte);
    $('#form-tc').load(ruta, function (status, xhr) {
        if (xhr === "error") {
            var msg = "Error! algo ha sucedido: ";
            $('#form-tc').html(msg, status);
        }
    });
}


function f_openModal() {
    // $("#basicModal").modal({backdrop: 'static'});
    $("#modal-success").modal({backdrop: 'static', keyboard: false});
    f_MostrarRegistroTC();
}

function f_InsertarTipoEncuesta() {
    var tipoConferencia = document.frm_TC.insertarTC.value;
    if (tipoConferencia === "") {
        alert('Ingrese tipo de conferencia !!! ');
    } else {
        var reporte = "03";
        tipoConferencia = encodeURIComponent(tipoConferencia);
        var ruta = ctx_path.concat("/conferencia/menu/conferencia/conferencia_ajax.jsp?pasacache=",
                new Date().getTime(),
                "&reporte=", reporte,
                "&tipoConferencia=", tipoConferencia
                );
        $('#modal-success').load(ruta, function (status, xhr) {
            if (xhr === "error") {
                var msg = "Error! algo ha sucedido: ";
                $('#modal-success').html(msg, status);
            } else{
                var msg = document.all.retMsj.value;
                alert(msg);
            }
        });
    }
}