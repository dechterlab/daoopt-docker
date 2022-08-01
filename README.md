# Example docker project 

In this docker project,
we show what **environment variables** will be passed to the solver through environmnet variables.
In addition, we show how to limit the time and memory limit using **ulimit** with limit.sh.
We will use **problems** folder to read and write UAI files, so please don't change this name.


To simplify example, we will copy a statically complied executable
inside the project and call it using bash command.


$ docker login
$ docker build -t junkyul/daooptbin .
$ docker push junkyul/daooptbin


## Environmnet variables and the default values
* ENV MODEL model.uai
* ENV EVID evid.uai
* ENV QUERY query.uai
* ENV RESULT result.uai
* ENV TIMESEC 20
* ENV MEMKB 8000000


## bash command example
```
CMD ["bash", "-c", "echo $MODEL; /code/limit.sh $TIMESEC $MEMKB /code/daoopt-static --input-file $MODEL --evid-file $EVID --sol-file $RESULT --ibound 15 --rotate --mplps 2 --slsX 2 --slsT 2 --cvo --orderIter 500 --orderTime 3 --memlimit 8000"]
```
This bash command will **execute limit.sh copied under /code with given time and memory limit**,
and **passing other environment variables** to the solver with additional options that are specific to the solver.


## basic steps for submission
* creat a docker hub account and follow Step 1 to Step 3 in Quickstart https://docs.docker.com/docker-hub/ 
(create an account, install docker desktop, and login)
* commands to login, build, push an image to docker hub
```
$ docker login
$ docker build -t junkyul/daooptbin .
$ docker push junkyul/daooptbin
```
* please send us your docker hub repo, something like junkyul/daooptbin, while submiting your solver.
