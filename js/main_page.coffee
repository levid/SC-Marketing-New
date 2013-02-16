$('.main-nav').find('a').on 'click', (e) =>
  e.preventDefault()
  id = $(e.target).attr('href')
  @scrollTo id, options =
    offset: 150
    speed: 500
    callback: ->
      $(window.location).attr('hash', id)

$(window).bind 'hashchange', (e) ->
  id = $(window.location).attr('hash')
  @scrollTo id, options =
    offset: 150
    speed: 0
    callback: ->

$('.main-nav li').on 'activate', (e) =>
  id = $(e.target).find('a').attr('href')
  # $(window.location).attr('hash', id)

@scrollTo = (id, options) ->
  callback = callback or ->
  yPos = $(id).position().top - options.offset
  $(document.body).scrollTo yPos, options.speed,
    onAfter: ->
      options.callback()

$(document).ready ->
  # $('.main-nav').scrollspy(
  #   offset: 170
  # ) 

  if ($(window.location).attr('href').indexOf("#") != -1) 
    id = $(window.location).attr('hash')
    $('.main-nav li').find('a').each (index, el) ->
      if $(el).attr('href') == id
        $($(el)[0]).trigger('click')