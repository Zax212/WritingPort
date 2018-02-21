$(document).ready(function() {
    $(".delete-confirm").click(function() {
        return confirm("Are you sure you want to delete this?")
    });

    $("#filter").keyup(function() {
        var rex = new RegExp($(this).val(), 'i');
        $('.searchable tr').hide();
        $('.searchable tr').filter(function () {
            return rex.test($(this).text());
        }).show();
    });
});