FROM node:14-slim

ENV NODE_OPTIONS="--unhandled-rejections=strict"

WORKDIR /code
COPY . .

RUN cd client && npm install && cd ../server && npm install
RUN npm run prepareSettings


RUN echo -e "\nBuilding the UI. This might take a couple of minutes...\n"
RUN cd client && npm run build && mkdir -p dist && cp -rf build/* dist/

EXPOSE 4018
EXPOSE 4019

ENTRYPOINT ["./entrypoint.sh"]
