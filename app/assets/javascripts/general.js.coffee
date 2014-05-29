$(document).ready ->
  $("form#categories select").change ->
    $(this).closest("form").submit()
    return

