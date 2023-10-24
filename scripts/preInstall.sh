#set env vars
set -o allexport; source .env; set +o allexport;


cat <<EOT > ./settings.js

module.exports = {
  port: process.env.CB_API_PORT,
  secret: process.env.CB_SECRET,
  client: process.env.REACT_APP_CLIENT_HOST,
  api: process.env.CB_API_HOST,
  adminMail: "$CB_ADMIN_MAIL",
  mailSettings: {
    host: "$CB_MAIL_HOST",
    port: "$CB_MAIL_PORT",
    secure: $CB_MAIL_SECURE,
    auth: {
      user: "",
      pass: "",
    },
  },
  google: {
    client_id: process.env.CB_GOOGLE_CLIENT_ID,
    client_secret: process.env.CB_GOOGLE_CLIENT_SECRET,
    redirect_url: "/google-auth",
  },
  teamRestricted: 0,
  signupRestricted: 0,
  chartbrewMainAPI: "https://api.chartbrew.com",
};

EOT