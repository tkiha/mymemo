window.Mymemo = {}
Mymemo.textComplete = ($target) ->
  emojis = {}
  $('[data-emoji]').each ->
    key = $(@).data().emoji
    src = $(@).data().src
    emojis[key] = src

  strategies = [
    {
      match: /(^|\s):([\w\+\-]*)$/
      search: (term, callback) ->
        regexp = new RegExp('^' + term.replace(/[\\\.\+\*\?\^\$\[\]\(\)\{\}\/\'\#\:\!\=\|]/ig, "\\$&"))
        callback(
          $.grep(Object.keys(emojis), (emoji) ->
            regexp.test(emoji)
          )
        )
      replace: (value) ->
        '$1:' + value + ': '
      template: (value) ->
        "<img alt='#{value}' height=20 width=20 src='#{emojis[value]}'> #{value}"
    }
  ]
  $target.textcomplete(strategies, { zIndex: '2000'})
  Post.setPostClipboard()

$ ->
  if $('.js-textcomplete').is('*')
   Mymemo.textComplete($('.js-textcomplete'))
