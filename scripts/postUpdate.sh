set -o allexport; source .env; set +o allexport;

docker-compose down;
rm -r ./storage/dist
docker-compose up -d


echo "Waiting for software to be ready ..."
echo "It will take a bit of time ..."
sleep 100s;
echo "Working ..."
sleep 100s;
echo "Still working ..."
sleep 100s;
echo "Almost done ..."
sleep 100s;
echo "A few more seconds ..."
sleep 100s;

echo "Pipeline deployed at ${DOMAIN}"