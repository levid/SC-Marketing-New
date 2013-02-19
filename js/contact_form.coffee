class ContactForm extends window.SC
  constructor: (opts) ->
    @initContactForm()

  initContactForm: () ->
    $('[data-behavior~=contact-form]').submit (e) ->
      e.preventDefault()
      
      $form     = $(this)
      name      = $form.find("#name").val()
      phone     = $form.find("#number").val()
      email     = $form.find("#email").val()
      subject   = $form.find("#subject").val()
      message   = $form.find("#message").val()
      url       = $form.attr("action")
      
      $.post url,
        name: name
        number: phone
        email: email
        subject: subject
        message: message

      $('.contact-form').hide()
      $('.thanks').removeClass('hide')

window.SC.SearchForm = new ContactForm()