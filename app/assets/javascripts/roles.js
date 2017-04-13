//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function () {
    $('#set-button').on('click', function () {
        var role_name = $("#roles").val();
        var userId = $('#user_table').data('id');
        console.log(role_name);
        $.ajax({
            url: "http://localhost:3000/users/set_role",
            type: 'post',
            data: {
                user_id: userId,
                role_id: role_name
            },
            success: function (data) {
                if (data.role_changed === 'true') {
                    alert("Роль успешно изменена");
                }

            },
            error: function (error) {
                console.log(error);
            }
        });
    });

    $('#remove_button').on('click', function () {
        var role_name = $("#roles").val();
        var userId = $('#user_table').data('id');
        console.log(role_name);
        console.log(userId);
        $.ajax({
            url: "http://localhost:3000/users/remove_role",
            type: 'post',
            data: {
                user_id: userId,
                role_id: role_name
            },
            success: function (data) {

            },
            error: function (error) {
                console.log(error);
            }
        });
    });
});

