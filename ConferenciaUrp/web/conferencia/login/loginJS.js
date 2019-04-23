/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var contexPath = "/ConferenciaURP";

function abrirLogin(){
    $('#modal-success').modal({backdrop: 'static', keyboard: false});
}


var usuario;
var contraseña;

function f_session() {
    usuario = document.frm_acceso.txtUsuario.value;
    contraseña = document.frm_acceso.txtClave.value;
    if (usuario === "") {
        alert("Ingrese Usuario");
    } else if (contraseña === "") {
        alert("Ingrese Contraseña");
    } else {
        document.frm_acceso.action = 'login';
        document.frm_acceso.submit();
    }
}

function f_submit() {
    document.frm_acceso.action = 'login';
    document.frm_acceso.submit();
}
