const express = require ('express')
const app = express()
const port = 3000

app.get('/api', (req,res) => {
    const data = {
        message:"My name is Reuben",
        timestamp: Date.now()
    };
    res.json(data);
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});