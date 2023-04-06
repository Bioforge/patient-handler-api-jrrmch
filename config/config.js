require("dotenv").config();

const config = {
    ENV: process.env.NODE_ENV || "development",
    PORT: process.env.PORT || 5000,
    JWT_SECRET: process.env.JWT_SECRET || "Your_secret_key",
    ACCESS_TOKEN_SECRET: process.env.ACCESS_TOKEN_SECRET || "Your_action_token",
};

module.exports = config;
