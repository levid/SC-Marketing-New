$('.main-nav').scrollspy(
  offset: 200
) 

$('.main-nav').find('a').on 'click', (e) =>
  e.preventDefault()
  id = $(e.target).attr('href')
  @scrollTo(id, 150)

  # $(window.location).attr('hash', id)

# $(window).bind 'hashchange', (e) ->
#   hash = $(window.location).attr('hash').slice(1)
#   # console.log "hash"
#   $(hash).scrollspy('refresh')

$('.main-nav li').on 'activate', (e) =>
  id = $(e.target).find('a').attr('href')
  @scrollTo(id, 150)

@scrollTo = (id, offset) ->
  yPos = $(id).position().top - offset
  $(document.body).scrollTo yPos, 500

# if ($(window.location).attr('href').indexOf("#") != -1) 
#   id = $(window.location).attr('hash')
#   offset = 150
#   yPos = $(id).position().top - offset
#   $(document.body).scrollTo yPos, 500