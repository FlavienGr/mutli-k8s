docker build -t zencles/multi-client:latest -t zencles/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t zencles/multi-server:latest -t zencles/multi-server:$GIT_SHA  -f ./server/Dockerfile ./server
docker build -t zencles/multi-worker:latest -t zencles/multi-worker:$GIT_SHA  -f ./worker/Dockerfile ./worker
docker push zencles/multi-client:latest
docker push zencles/multi-server:latest
docker push zencles/multi-worker:latest 

docker push zencles/multi-client:$GIT_SHA
docker push zencles/multi-server:$GIT_SHA
docker push zencles/multi-worker:$GIT_SHA

kubectl set image deployments/server-deployment server=zencles/multi-server:$GIT_SHA
kubectl set image deployments/client-deployment client=zencles/multi-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=zencles/worker:$GIT_SHA