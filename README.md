Using this terraform script, you can provision a kubernetes dashboard for your kubernetes cluster.

Note: Starting from Kubernetes 1.24, they have changed the association between a service account and secrets. This terraform script generates a non-expiring secret and associate it with the service account that will be used to access the dashboard. 
