const express = require("express");
const cookieParser = require("cookie-parser");
const config = require("./config/config");
const bodyParser = require("body-parser");
const compress = require("compression");
const morgan = require("morgan");
const helmet = require("helmet");
const multer = require("multer");
const upload = multer();
const cors = require("cors");
const winston = require("./config/winston");
const app = express();

const patientRoutes = require("./routes/patient.routes");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(upload.any());
app.use(morgan("combined", { stream: winston.stream }));
app.use(cookieParser());
app.use(compress());
app.use(helmet());
app.use(cors());

//mounting the routes
app.use("/api/patients", patientRoutes);

// Home
app.get("/", function (req, res) {
    res.status(200).json({ success: true, message: "Welcome to API page" });
});

// Listen to PORT
const PORT = config.ENV === "test" ? 0 : config.PORT;
app.listen(PORT, config.HOST, () => {
    console.log(`Example app listening at http://${config.HOST}:${PORT}`);
});

app.use(function (err, req, res, next) {
    // include winston logging
    winston.error(`${err.status || 500} - ${err.message} - ${req.originalUrl} - ${req.method} - ${req.ip}`);
});
