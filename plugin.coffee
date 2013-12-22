fs = require 'fs'

coffee = require 'coffee-script'

exports.compile = (file, flags, callback) ->
  fs.readFile file, 'utf8', (err, contents) ->
    return callback err if err
    try
      output = coffee.compile contents, bare: 'bare' in flags
    catch err
      return callback err
    callback null, output
