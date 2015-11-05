port = 9001
mime =
  'htm': 'text/html',
  'html': 'text/html',
  'css': 'text/css',
  'gif': 'image/gif',
  'ico': 'image/x-icon',
  'jpg': 'image/jpeg',
  'js': 'text/javascript',
  'png': 'image/png',
  'rar': 'application/x-rar-compressed',
  'txt': 'text/plain',
  'json': 'text/plain',
  'jar': 'application/java-archive'

dir = process.argv[2]
root = if dir then dir else process.cwd()

http = require('http')
url = require('url')
fs = require('fs')
path = require('path')

index = './index.html'

http.createServer(
  (req, res)->
    pathname = url.parse(req.url).pathname
    realpath = if pathname != '/' then root + pathname else index
    extname = path.extname(realpath).slice(1)

    if extname && mime[extname]
      contentType = mime[extname]

    fs.exists realpath, (exists) ->
      if exists
        if contentType
          res.writeHead(200, 'Content-Type': contentType)
        else
          res.writeHead(200)
        fs.createReadStream(realpath).pipe(res)
      else
        res.writeHead(200, 'Content-Type': 'text/html')
        fs.createReadStream(index).pipe(res)
).listen(port)

console.log 'simple static file server runing at port: ' + port + '.'
