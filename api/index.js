//express library 
const express = require ('express')
const app = express()

//set the port to use the environment variable or port 80
const port = process.env.PORT || 80

//route for HTTP GET requests to the root URL
app.get('/', (req,res) => {
    const data = {
        message:"My name is Reuben",
        timestamp: Date.now(),
    };

    //send object as JSON to the client
    res.json(data)

});

//start the server and listen to the specified port 
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});