// Generated by CoffeeScript 1.3.3
(function() {
  var $, SocialCrunch;

  window.SC || (window.SC = {});

  $ = jQuery;

  SocialCrunch = (function() {

    function SocialCrunch(opts) {
      var _this = this;
      $('.main-nav').find('a').on('click', function(e) {
        var id, options;
        e.preventDefault();
        id = $(e.target).attr('href');
        return _this.scrollTo(id, options = {
          offset: 150,
          speed: 500,
          callback: function() {
            return $(window.location).attr('hash', id);
          }
        });
      });
      $(window).bind('hashchange', function(e) {
        var id, options;
        id = $(window.location).attr('hash');
        return _this.scrollTo(id, options = {
          offset: 150,
          speed: 0,
          callback: function() {}
        });
      });
      $('.main-nav li').on('activate', function(e) {
        var id;
        return id = $(e.target).find('a').attr('href');
      });
    }

    SocialCrunch.prototype.scrollTo = function(id, options) {
      var callback, yPos;
      callback = callback || function() {};
      yPos = $(id).position().top - options.offset;
      return $(document.body).scrollTo(yPos, options.speed, {
        onAfter: function() {
          return options.callback();
        }
      });
    };

    return SocialCrunch;

  })();

  window.SC = new SocialCrunch();

  $(document).ready(function() {
    var id;
    if ($(window.location).attr('href').indexOf("#") !== -1) {
      id = $(window.location).attr('hash');
      return $('.main-nav li').find('a').each(function(index, el) {
        if ($(el).attr('href') === id) {
          return $($(el)[0]).trigger('click');
        }
      });
    }
  });

  $(window).load(function() {
    return $('.chzn-select').chosen();
  });

}).call(this);
