isUser = (user, cb)->
  console.log 'isUser', user
  cb null, user

module.exports = 
  isUser: isUser
