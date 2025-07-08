//npx nodemon server.js

//http://localhost/phpmyadmin/

const express = require("express");

const app = express();
app.use(express.urlencoded());
app.use(express.json());

const swaggerUi = require("swagger-ui-express");
const swaggerSpec = require("./swagger");
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));

const cors = require('cors');
app.use(cors());

const mysql = require("mysql");


//rutes
app.get("/", (req, res) => {
    res.send("Good day.");
});

let dataBase = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "watchitlater"
});

dataBase.connect(function(error){
    if(error) throw error;

    console.log("Connected to database.");

    app.get("/watchitlater/all", (req, res) => {
        dataBase.query("SELECT * FROM watchitlater", function(err, result, fields){
            res.json(result);
        });
    });

    app.get("/watchitlater/:id", (req, res) => {
        const id = req.params.id;
        dataBase.query(
            "SELECT id, type, name, season, date, description, image FROM watchitlater WHERE id = ?",
            [id],
            (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).send("Error fetching series");
            }
            if (results.length === 0) {
                return res.status(404).send("Series not found");
            }
            res.json(results[0]); // Vraća objekt sa svim poljima, uključujući id
            }
        );
    });

    app.post("/watchitlater/add", (req, res) => {
        let { type, name, season, date, description, image } = req.body;

        dataBase.query("INSERT INTO watchitlater (type, name, season, date, description, image) VALUES (?, ?, ?, ?, ?, ?)",
        [type, name, season, date, description, image],
        function(err, result, fields){
            if(err){
                console.error(err);
                return res.status(500).send("Error inserting item.");
            } 
            res.send("Item Added.");
        });
    });

    app.put("/watchitlater/edit/:id", (req, res) => {
        let id = req.params.id;
        let { type, name, season, date, description, image } = req.body;

        dataBase.query("UPDATE watchitlater SET type = ?, name = ?, season = ?, date = ?, description = ?, image = ? WHERE id = ?", 
            [type, name, season, date, description, image, id], (err, result) => {
            if (err) {
                console.error(err);
                return res.status(600).send("Error updating item.");
            }

            if (result.affectedRows === 0) {
                return res.status(404).send("Item not found.");
            }

            res.send("Item updated.");
        });
    });

    app.delete("/watchitlater/delete/:id", (req, res) => {
        let id = req.params.id;

        dataBase.query("DELETE FROM watchitlater WHERE id = ?;", [id], function(err, result, fields){
            res.send("Item removed.");
        });
    });

});

app.listen(4000, () => {
    console.log("express booted.")
});