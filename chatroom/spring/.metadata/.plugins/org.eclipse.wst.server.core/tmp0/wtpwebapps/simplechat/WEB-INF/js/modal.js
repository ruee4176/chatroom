var create = $("#modal-create");
var join = $("#modal-join");
var setting = $("#modal-setting");
var roomSetting = $("#modal-room-setting");


function modalCreate() {
    create.toggleClass('on');
}

function modalRoomSetting() {
    roomSetting.toggleClass('on');
}

function modalSetting() {
    setting.toggleClass('on');
}

function modalJoin(bool) {

    if (bool) {
        join.addClass('on');
    }else{
        join.removeClass('on');
        $("#join-form").find("#room_title").val("");
        $("#join-form").find("#room_info").val("");
        $("#join-form").find("#join-pwd").hide();
    }
}

function joinBtnToggle(bool) {

    if ( bool ) {
        // btn-on + sumbit
        $("#join-btn").removeClass("btn-off");
        $("#join-btn").addClass("btn-on");
        $("#join-btn").removeAttr("disabled");
        $("#join-btn").attr("type", "sumbit");
    }else{
        // btn-off + button
        $("#join-btn").removeClass("btn-on");
        $("#join-btn").addClass("btn-off");
        $("#join-btn").attr("disabled");
        $("#join-btn").attr("type", "button");
    }
}



function getRoomCode(btn) {
    $(btn).siblings("#room_code").val(Math.random().toString(36).substr(2,11));
}

function pwd_on(box) {

    var room_pwd = $(box).siblings("#room_pwd");

    if ($(box).is(":checked")) {
        room_pwd.attr("disabled", false);
    }else {
        room_pwd.attr("disabled", true);
    }
    room_pwd.toggleClass("off");
}


function roomExit(params) {

    if (params) {
        location.replace('roomExit');
    }
}
