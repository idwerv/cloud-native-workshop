##########################
# web-nodejs Solution #
##########################

DIRECTORY=`dirname $0`

oc project my-project${CHE_WORKSPACE_NAMESPACE#user}
oc new-app nodejs~https://github.com/mcouliba/cloud-native-workshop#ocp4.5 \
        --context-dir=labs/web-nodejs \
        --name=web-coolstore \
        --labels=app=coolstore,app.kubernetes.io/instance=web,app.kubernetes.io/part-of=coolstore,app.kubernetes.io/name=nodejs

oc expose svc/web-coolstore
oc annotate --overwrite deployment/web-coolstore app.kubernetes.io/component-source-type=git
oc annotate --overwrite deployment/web-coolstore app.openshift.io/connects-to=gateway