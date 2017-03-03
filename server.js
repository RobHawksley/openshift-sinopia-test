'use strict';

const express = require('express');
const sinopia = require('sinopia');


// Constants

const PORT = 4873;

// App
const app = sinopia();



app.listen(PORT);
console.log('Running on http://localhost:' + PORT);
