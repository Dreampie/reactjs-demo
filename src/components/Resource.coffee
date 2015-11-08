Constant = require "../layouts/Constant"

build = (async, headers, method, url, params, success, error)->
  request = new XMLHttpRequest()
  pattern = /(:[^\/]+)/
  while url.contains(":")
    name = url.match(pattern).replace(":", "")
    url.replace(":" + name, params[name])
    delete params[name]

  paramsInUrl = method == 'GET'
  headers['ContentType'] = 'application/x-www-form-urlencoded; charset=UTF-8'
  if paramsInUrl && params
    for param in params
      key = Object.keys(header)[0]
      value = header[key]
      if value != null
        if typeof value == 'object'
          paramsUrl += key + "=" + JSON.stringify(value) + "&"
        else
          paramsUrl += key + "=" + value + "&"
    if paramsUrl
      url += "?" + paramsUrl
  else
    headers['ContentType'] = 'application/json; charset=UTF-8'
  # Header
  for header in headers
    key = Object.keys(header)[0]
    value = header[key]
    request.setRequestHeader key, value

  request.open method, url, async
  if success
    request.onload = success
  if error
    request.onerror = error

  if !paramsInUrl
    request.send(JSON.stringify(params))
  else
    request.send()

Resource =
  get: (resources, success, error)->
    build(Constant.HTTP.ASYNC, Constant.HTTP.HEADERS, 'GET', Constant.HTTP.API + resources, null, success, error)
  get: (resources, params, success, error)->
    build(Constant.HTTP.ASYNC, Constant.HTTP.HEADERS, 'GET', Constant.HTTP.API + resources, params, success, error)
  post: (resources, params, success, error)->
    build(Constant.HTTP.ASYNC, Constant.HTTP.HEADERS, 'POST', Constant.HTTP.API + resources, params, success, error)
  delete: (resources, success, error)->
    build(Constant.HTTP.ASYNC, Constant.HTTP.HEADERS, 'DELETE', Constant.HTTP.API + resources, null, success, error)
  delete: (resources, params, success, error)->
    build(Constant.HTTP.ASYNC, Constant.HTTP.HEADERS, 'DELETE', Constant.HTTP.API + resources, params, success, error)
  put: (resources, params, success, error)->
    build(Constant.HTTP.ASYNC, Constant.HTTP.HEADERS, 'PUT', Constant.HTTP.API + resources, params, success, error)

module.exports = Resource

