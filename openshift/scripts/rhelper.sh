#!/bin/bash

PORT=6379
CLUSTER_NAME=rcluster
PASSWORD=red5phy739

case "$1" in
"create")
    PODS=$(oc get pods -lrediscluster=$CLUSTER_NAME -o custom-columns=IP:.status.podIP --no-headers)
    CLUSTER_NODES=""
    for POD in $PODS; do
        CLUSTER_NODES+="$POD:$PORT " 
    done
    CLUSTER_CREATE="redis-cli -a $PASSWORD --cluster create $CLUSTER_NODES --cluster-replicas 1"
    echo $CLUSTER_CREATE
    ;;
"rsh")
    PODS=$(oc get pods -lrediscluster=$CLUSTER_NAME -o custom-columns=NAME:.metadata.name --no-headers)
    FIRST_NODE=$(echo $PODS |awk '{print $1;}')
    echo "oc rsh $FIRST_NODE"
    ;;
"cli")
    PODS=$(oc get pods -lrediscluster=$CLUSTER_NAME -o custom-columns=NAME:.metadata.name --no-headers)
    FIRST_NODE=$(echo $PODS |awk '{print $1;}')
    oc rsh $FIRST_NODE /bin/bash -c redis-cli -a $PASSWORD
    ;;
*)
    echo "Bad command!"
    ;;
esac

