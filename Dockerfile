FROM ubuntu:18.04

WORKDIR /code

# install OS
RUN apt-get -y update && apt-get -y --no-install-recommends install build-essential

# give dummy names for the environment variables that will be overwritten when running
ENV MODEL model.uai
ENV EVID evid.uai
ENV QUERY query.uai
ENV RESULT result.uai
ENV TIMESEC 20
ENV MEMKB 8000000

COPY . /code

CMD ["bash", "-c", "echo $MODEL; /code/limit.sh $TIMESEC $MEMKB /code/daoopt-static --input-file $MODEL --evid-file $EVID --sol-file $RESULT --ibound 15 --rotate --mplps 2 --slsX 2 --slsT 2 --cvo --orderIter 500 --orderTime 3 --memlimit 8000"]

#CMD ["bash", "-c", "echo $MODEL; /code/daoopt-static --input-file $MODEL --evid-file $EVID --sol-file $RESULT --ibound 15 --rotate --mplps 2 --slsX 2 --slsT 2 --cvo --orderIter 500 --orderTime 3 --memlimit 8000; basefile=$(basename $MODEL); mv $basefile.MPE $RESULT"]

