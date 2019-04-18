#!/bin/bash

if [[ $OKD_MASTERS -gt 1 ]]; then
  MASTERS=$(eval echo "master-{$(seq -s ',' 0 $((OKD_MASTERS - 1)))}")
elif [[ $OKD_MASTERS -eq 1 ]]; then
  MASTERS="master-0"
else
  MASTERS=$(eval echo master-{0,1,2})
fi

if [[ $OKD_INFRAS -gt 1 ]]; then
  INFRAS=$(eval echo "infra-{$(seq -s ',' 0 $((OKD_INFRAS - 1)))}")
elif [[ $OKD_INFRAS -eq 1 ]]; then
  INFRAS="infra-0"
else
  INFRAS=$(eval echo infra-{0,1,2})
fi

if [[ $OKD_NODES -gt 1 ]]; then
  NODES=$(eval echo "node-{$(seq -s ',' 0 $((OKD_NODES - 1)))}")
elif [[ $OKD_NODES -eq 1 ]]; then
  NODES="node-0"
else
  NODES=$(eval echo node-{0,1,2})
fi

for node in $INFRAS $MASTERS $NODES proxy; do
  vagrant destroy ${node}
  vagrant up ${node}
done
