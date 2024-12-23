import express from 'express';

const app = express(); 

app.use(express.json());

// listen server 
app.listen(3077,'127.0.0.1', () => {

    console.log('Server is running on http://127.0.0.1:3076');
});

