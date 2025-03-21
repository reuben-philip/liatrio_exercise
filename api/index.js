const express = require ('express')
const app = express()
const port =process.env.PORT || 80


app.get('/', (req,res) => {
    res.json({
        message:"My name is Reuben",
        timestamp: Date.now(),
        test:"test",
        color: "red"
    });

});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});