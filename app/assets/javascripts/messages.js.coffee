$(document).ready ->
    $("#new_message")
      .bind "ajax:success", (event, data) ->
        $("#message_body").val('')
        new_message = $(data.new_message)
        new_message.hide()
        new_message.prependTo($("#messages"))
        new_message.slideDown()