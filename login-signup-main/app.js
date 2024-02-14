require('dotenv').config();
const express = require('express');
const app = express();
const userRouter = require('./api/users/user.router');

const bodyParser = require('body-parser');


app.use(bodyParser.json());

app.use("/api/users", userRouter);

const PORT = process.env.APP_PORT || 3000; 
app.listen(PORT, () => {
  console.log(`Server up and running on port: ${PORT}`);
});