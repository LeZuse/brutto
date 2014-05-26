jQuery ->
  $(document).on 'submit', 'form', ->
    $(this).find('input[type=submit], button[type=submit]').button('loading')
