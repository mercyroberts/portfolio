function handler(event) {
  var request = event.request;
  var host = request.headers.host && request.headers.host.value;

  if (host && host.indexOf('www.') === 0) {
    return {
      statusCode: 301,
      statusDescription: 'Moved Permanently',
      headers: { location: { value: 'https://' + host.slice(4) + request.uri } }
    };
  }

  if (request.uri.endsWith('/')) {
    request.uri += 'index.html';
  } else if (request.uri.indexOf('.') === -1) {
    request.uri += '/index.html';
  }

  return request;
}
