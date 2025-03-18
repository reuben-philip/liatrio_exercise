const express = require ('express')
const app = express()
const port = 80


app.get('/', (req,res) => {
    const data = {
        message:"My name is Reuben",
        timestamp: Date.now()
    };
    res.send(JSON.stringify(data))
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});