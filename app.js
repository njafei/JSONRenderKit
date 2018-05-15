const http = require('http');
var fs = require("fs");

const hostname = '127.0.0.1';
const port = 5000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'application/json; charset=utf-8');

  let jsonPath = `./js/modules${req.url}.json`;
  let data = fs.readFile(jsonPath, 'utf-8', (err, data) => {
  		if (!err){
  			res.write(data);
  			res.end();
  		} else {//todo 处理读取文件的失败情况还要考虑下怎么处理异常，暂时只返回个简单的错误
  			// throw(error);
  			res.end(`readFile fail, jsonPath: ${jsonPath}`);
  		}
  });
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});