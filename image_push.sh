#!/bin/bash

IMAGE="testingoperations"

docker login -u bharadwaj1995 -p R@m@r@m@123


docker tage $IMAGE:sampleprojectmaven bharadwaj1995/$IMAGE:sampleprojectmaven

docker push bharadwaj1995/$IMAGE:sampleprojectmaven
