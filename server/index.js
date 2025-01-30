// // post
// // set
// // get
// // update
// // delete
// // console.log("Hello World");
// // console.log("Hello World");
// const name = "ayush";
// console.log(name);


// IMPORTS
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');
const Game = require("./models/Game");  // Game.js bhi chalega...
const getSentence = require('./api/getSentence');

// CREATING A SERVER
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
var io = require('socket.io')(server);

// middle ware
app.use(express.json()); // whatever data is stored/ received is in the json format.

// FRONTEND -> MIDDLEWARE -> BACKEND. MIDDLEWARE IS USED FOR MANIPULATING THE DATA

// CONNECT TO MONGODB
const DB = "mongodb+srv://ayush91003:Ayush123@cluster0.rmic8.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
mongoose.connect(DB).then(() => {
  console.log("Connection successful!");
}).catch((e) => {
  console.log(e);
})


io.on("connection", (socket) => {
  // console.log(socket.id);
  // socket.on('test',(data)=>{
  //     console.log(data);
  // })

  socket.on('create-game', async ({ nickname }) => {
    try {
      let game = new Game();
      const sentence = await getSentence();
      game.words = sentence
      let player = {
        socketID: socket.id,
        // nickname = nickname;
        nickname,
        isPartyLeader: true,
      };
      game.players.push(player);
      game = await game.save();

      const gameId = game._id.toString();
      socket.join(gameId);
      io.to(gameId).emit('updateGame', game);
    } catch (e) {
      console.log(e);
    }
  })

  socket.on("join-game", async ({ nickname, gameId }) => {
    try {
      if (!gameId.match(/^[0-9a-fA-F]{24}$/)) {
        socket.emit("notCorrectGame", "Please enter a valid game ID");
        return;
      }
      let game = await Game.findById(gameId);

      if (game.isJoin) {
        const id = game._id.toString();
        let player = {
          nickname,
          socketID: socket.id,
        };
        socket.join(id);
        game.players.push(player);
        game = await game.save();
        io.to(gameId).emit("updateGame", game);
      } else {
        socket.emit(
          "notCorrectGame",
          "The game is in progress, please try again later!"
        );
      }
    } catch (e) {
      console.log(e);
    }
  });

  // timer listener
  socket.on('timer', async ({ playerId, gameID }) => {
    // console.log('timer started!');
    let countDown = 5;
    let game = await Game.findById(gameID);
    let player = game.players.id(playerId);

    if (player.isPartyLeader) {
      let timerId = setInterval(async () => {
        if (countDown >= 0) {
          io.to(gameID).emit('timer', {
            countDown,
            msg: 'Game Starting',
          })
          console.log(countDown);
          countDown--;
        } else {
          // console.log('game START!');
          game.isJoin = false;
          game = await game.save();
          io.to(gameId).emit('updateGame', game);
          startGameClock(gameID);
          clearInterval(timerId);
        }
      }, 1000)
    }

  })
})

// const startGameClock = async (gameID) =>{
//   let game = await Game.findById(gameID);
// }


// LISTEN TO SERVER
server.listen(port, "0.0.0.0", () => {
  console.log(`Server started and running on port ${port}`);
})


// EVERYTING IN JS IS AN OBJECT

