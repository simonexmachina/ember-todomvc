`import moment from 'moment'`

# provides moment.js formatting using {{dateFormat property format="ll"}}
# @see http://momentjs.com/docs/#/displaying/format/
Em.Handlebars.registerBoundHelper 'dateFormat', (value, options)->
  moment(value).format(options.hash.format)
