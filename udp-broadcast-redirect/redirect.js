let dgram = require("dgram");
let server = dgram.createSocket("udp4");

console.log("broadcast redirector started");

// console.log("on host");
// var os = require('os');
// console.log(os.hostname());

server.on("message", function (msg, rinfo) {
	console.log("REDIRECTED UDP MESSAGE TO BROADCAST - ");
	console.log(JSON.parse(msg));
    server.send(msg, 0, msg.length, 6666, "255.255.255.255");
});

server.on("listening", function () {
    server.setBroadcast(true);
    var address = server.address();
    console.log("broadcast redirector listening " + address.address + ":" + address.port);
});
 
server.on("error", function (e) {
    console.error("broadcast redirector error - ", e);
});
 
server.bind(6665);