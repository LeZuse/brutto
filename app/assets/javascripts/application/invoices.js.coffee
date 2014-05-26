jQuery ->
  $('.invoices .lines').each ->
    $lines = $(this)
    $submitBtn = $lines.find('.submit [type=submit]')
    $costEditForms = $lines.find('.cost-edit')
    $costShow = $lines.find('.cost-show')

    # Unobtrussive JS - hide only with JS, not by CSS
    $submitBtn.hide()
    $costEditForms.hide()
    $costShow.removeClass('hidden')

    $toggleEditBtn = $('<span class="btn btn-default">Upravit náklady</span>').insertBefore($submitBtn)

    $toggleEditBtn.on 'click', ->
      $toggleEditBtn.hide()
      $costShow.hide()
      $costEditForms.fadeIn()
      $submitBtn.fadeIn()

