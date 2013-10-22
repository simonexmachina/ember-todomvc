`import moment from 'moment'`

Em.Handlebars.registerBoundHelper 'dateFormat', (value, options)->
  moment(value).format(options.hash.format)
