// Generated by CoffeeScript 1.3.3
(function() {
  var ContactForm,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ContactForm = (function(_super) {

    __extends(ContactForm, _super);

    function ContactForm(opts) {
      this.initContactForm();
    }

    ContactForm.prototype.initContactForm = function() {
      return $('[data-behavior~=contact-form]').submit(function(e) {
        var $form, email, message, name, phone, subject, url;
        e.preventDefault();
        $form = $(this);
        name = $form.find("#name").val();
        phone = $form.find("#number").val();
        email = $form.find("#email").val();
        subject = $form.find("#subject").val();
        message = $form.find("#message").val();
        url = $form.attr("action");
        $.post(url, {
          name: name,
          number: phone,
          email: email,
          subject: subject,
          message: message
        });
        $('.contact-form').hide();
        return $('.thanks').removeClass('hide');
      });
    };

    return ContactForm;

  })(window.SC);

  window.SC.SearchForm = new ContactForm();

}).call(this);
