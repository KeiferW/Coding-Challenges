const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const Tree = require('./models/tree');
const Node = require('./models/node');
app.use(bodyParser.json());

app.get('/api/tree/', (req, res) => {
    //send the tree of nodes
    res.send(tree.Nodes)
})

app.post('/api/tree/',(req, res) => {
    //create new node
    var newId = map.length
    const newNode = new Node(newId.toString(), req.body.label);
    //add new node to map
    map[map.length]= newNode;
    //put new node at the end of parent's children arrray
    var newParent = map[req.body.parent];
    newParent.children.push(newNode);
    res.send("added")
})

//create tree
const tree = new Tree();

//create nodes
const node1 = new Node("1","root");
const node2 = new Node("2","ant");
const node3 = new Node("3","bear");
const node4 = new Node("4","cat");
const node5 = new Node("5","dog");
const node6 = new Node("6","elephant");
const node7 = new Node("7","frog");

//put children in children array
node1.children.push(node2);
node1.children.push(node3);
node1.children.push(node7);
node3.children.push(node4);
node3.children.push(node5);
node5.children.push(node6);

//push root to the tree
tree.Nodes.push(node1)

//map to access nodes
var map=[];
map[1]=node1;
map[2]=node2;
map[3]=node3;
map[4]=node4;
map[5]=node5;
map[6]=node6;
map[7]=node7;

app.listen(3001, () => console.log('up and running on port 3001'));