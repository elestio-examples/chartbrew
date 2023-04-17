#set env vars
set -o allexport; source .env; set +o allexport;

# apt install jq -y

# mkdir -p ./data
# chown -R 1000:1000 ./data

cat <<EOT > ./settings.js

module.exports = {
  port: process.env.CB_API_PORT,
  secret: process.env.CB_SECRET,
  client: process.env.REACT_APP_CLIENT_HOST,
  api: process.env.CB_API_HOST,
  adminMail: "$ADMIN_EMAIL",
  mailSettings: {
    host: "$CB_MAIL_HOST",
    port: "$CB_MAIL_PORT",
    secure: "$CB_MAIL_SECURE",
    auth: {
      user: "",
      pass: "",
    },
    tls: {rejectUnauthorized: false},
  },
  google: {
    client_id: process.env.CB_GOOGLE_CLIENT_ID,
    client_secret: process.env.CB_GOOGLE_CLIENT_SECRET,
    redirect_url: "/google-auth",
  },
  teamRestricted: "false",
  signupRestricted: "false",
  chartbrewMainAPI: "https://api.chartbrew.com",
};

EOT