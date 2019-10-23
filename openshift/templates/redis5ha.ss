apiVersion: apps/v1
kind: StatefulSet
metadata:
  creationTimestamp: null
  generation: 1
  labels:
    app: redis5ha
  name: redis5ha
  selfLink: /apis/apps/v1/namespaces/redis-test/statefulsets/redis5ha
spec:
  podManagementPolicy: OrderedReady
  replicas: 0
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: redis5ha
  serviceName: redis
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: redis5ha
    spec:
      containers:
      - image: docker-registry.default.svc:5000/redis-test/redis-5-rhel7-ha:latest
        imagePullPolicy: Always
        name: redis5ha
        ports:
        - containerPort: 6379
          name: redis
          protocol: TCP
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
        volumeMounts:
        - mountPath: /var/lib/redis/data
          name: redis
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 30
  updateStrategy:
    rollingUpdate:
      partition: 0
    type: RollingUpdate
  volumeClaimTemplates:
  - metadata:
      creationTimestamp: null
      name: redis
    spec:
      accessModes:
      - ReadWriteOnce
      resources:
        requests:
          storage: 1Gi
    status:
      phase: Pending
status:
  replicas: 0
