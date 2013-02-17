window.SC ||= {}
$ = jQuery

class SocialCrunch
  constructor: (opts) ->
    @initExpander()

    $('.main-nav').find('a').on 'click', (e) =>
      e.preventDefault()
      id = $(e.target).attr('href')
      @scrollTo id, options =
        offset: 150
        speed: 600
        callback: ->
          $(window.location).attr('hash', id)

    $(window).bind 'hashchange', (e) =>
      id = $(window.location).attr('hash')
      @scrollTo id, options =
        offset: 150
        speed: 0
        callback: ->

    $('.main-nav li').on 'activate', (e) =>
      id = $(e.target).find('a').attr('href')
      # $(window.location).attr('hash', id)

  scrollTo: (id, options) ->
    callback = callback or ->
    yPos = $(id).position().top - options.offset
    $(document.body).scrollTo yPos, options.speed,
      onAfter: ->
        options.callback()

  initExpander: () ->
    # you can override default options globally, so they apply to every .expander() call
    $.expander.defaults.slicePoint = 120

    $(document).ready ->
      $("div.expandable p").expander()
      $("div.expandable p").expander
        slicePoint: 80 # default is 100
        expandPrefix: " " # default is '... '
        expandText: "[...]" # default is 'read more'
        collapseTimer: 5000 # re-collapses after 5 seconds; default is 0, so no re-collapsing
        userCollapseText: "[^]" # default is 'read less'

window.SC = new SocialCrunch()

$(document).ready ->
  if ($(window.location).attr('href').indexOf("#") != -1) 
    id = $(window.location).attr('hash')
    $('.main-nav li').find('a').each (index, el) ->
      if $(el).attr('href') == id
        $($(el)[0]).trigger('click')

$(window).load ->
  $('.chzn-select').chosen()