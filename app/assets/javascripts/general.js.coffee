
$(document).ready ->
  $("select").selectBoxIt();
  $("form#categories select").change ->
    $(this).closest("form").submit()
    return

