SC_INFO_URL="https://sc-info.rtplab.nimblestorage.com"
CLUSTER_NAME="\"hcipoc-us-west-2\""
SHELL_VERSION="\"shell\""
SC_TUNNEL_CONNECTOR="\"sc-tunnel-connector\""
TASKS_VERSION="\"tasks\""
STORAGE_CONSOLE_TASKS="\"storage-console-tasks\""
SECRETS_VERSION="\"secrets\""
STORAGE_CONSOLE_SECRETS="\"storage-console-secrets\""
AUDIT_VERSION="\"audit\""
STORAGE_CONSOLE_AUDIT="\"storage-console-audit\""
AGENT_AUTH_VERSION="\"agent-auth\""
ISSUES_VERSION="\"issues\""
STORAGE_CONSOLE_ISSUES="\"storage-console-issues\""
GROUPS_VERSION="\"groups\""
STORAGE_CONSOLE_GROUPS="\"storage-console-groups\""
CADENCE_JOB="\"cadence-job\""
CADENCE="\"cadence\""
GROUPS_DB="\"groups-db\""
TASK_DB="\"tasks-createdb\""
METERING="\"metering\""


SHELL_VERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${SHELL_VERSION}'}]'| jq -r '.dbObjects[]  | select(.application == "shell") | .["hcipoc-us-west-2"]')
SC_TUNNEL_CONNECTOR_VERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${SC_TUNNEL_CONNECTOR}'}]'| jq -r '.dbObjects[]  | select(.application == "sc-tunnel-connector") | .["hcipoc-us-west-2"]')
TASK_VERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${TASKS_VERSION}'}]'| jq -r '.dbObjects[]  | select(.application == "tasks") | .["hcipoc-us-west-2"]')
TASK_UI_VERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${STORAGE_CONSOLE_TASKS}'}]'| jq -r '.dbObjects[0]['${CLUSTER_NAME}']')
TASK_DB_VERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${TASK_DB}'}]'|jq -r '.dbObjects[] | select(.application == "tasks-createdb") | .["hcipoc-us-west-2"]')
SECRETS_SC_VERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${SECRETS_VERSION}'}]'| jq -r '.dbObjects[] | select(.application == "secrets") | .["hcipoc-us-west-2"]')
SECRETS_UI=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${STORAGE_CONSOLE_SECRETS}'}]'| jq -r '.dbObjects[0]['${CLUSTER_NAME}']')
AUDIT_SC_VERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${AUDIT_VERSION}'}]'| jq -r '.dbObjects[]  | select(.application == "audit") | .["hcipoc-us-west-2"]')
AUDIT_UI_VERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${STORAGE_CONSOLE_AUDIT}'}]'| jq -r '.dbObjects[0]['${CLUSTER_NAME}']')
AGENT_AUTH_SC_VERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${AGENT_AUTH_VERSION}'}]'| jq -r '.dbObjects[0]['${CLUSTER_NAME}']')
ISSUES_SCVERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${ISSUES_VERSION}'}]'| jq -r '.dbObjects[] | select(.application == "issues") | .["hcipoc-us-west-2"]')
ISSUES_UI_VERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${STORAGE_CONSOLE_ISSUES}'}]'| jq -r '.dbObjects[] | select(.application == "storage-console-issues") | .["hcipoc-us-west-2"]')
GROUPS_SCVERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${GROUPS_VERSION}'}]'| jq -r '.dbObjects[] | select(.application == "groups") | .["hcipoc-us-west-2"]')
GROUPSUI=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${STORAGE_CONSOLE_GROUPS}'}]'|jq -r '.dbObjects[] | select(.application == "storage-console-groups") | .["hcipoc-us-west-2"]')
GROUPS_DB_SC=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${GROUPS_DB}'}]'|jq -r '.dbObjects[] | select(.application == "groups-db") | .["hcipoc-us-west-2"]')
CADENCE_JOB_SC=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${CADENCE_JOB}'}]'|jq -r '.dbObjects[] | select(.application == "cadence-job") | .["hcipoc-us-west-2"]')
CADENCE_VERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${CADENCE}'}]'| jq -r '.dbObjects[] | select(.application == "cadence") | .["hcipoc-us-west-2"]')
METERING_VERSION=$(curl -g ''${SC_INFO_URL}'/api/latest?clusters=['${CLUSTER_NAME}']&filters=[{"columnName":"application","type":"search","value":'${METERING}'}]'| jq -r '.dbObjects[] | select(.application == "metering") | .["hcipoc-us-west-2"]')
echo "SHELL_VERSION                 $SHELL_VERSION"
echo "SC_TUNNEL_CONNECTOR_VERSION   $SC_TUNNEL_CONNECTOR_VERSION"
echo "TASK_VERSION                  $TASK_VERSION"
echo "TASK_UI_VERSION               $TASK_UI_VERSION"
echo "TASKS_DB_VERSION              $TASK_DB_VERSION"
echo "SECRETS_SC_VERSION            $SECRETS_SC_VERSION"
echo "SECRETS_UI                    $SECRETS_UI "
echo "AUDIT_SC_VERSION              $AUDIT_SC_VERSION "
echo "AUDIT_UI_VERSION              $AUDIT_UI_VERSION "
echo "AGENT_AUTH_SC_VERSION         $AGENT_AUTH_SC_VERSION "
echo "ISSUE_VERSION                 $ISSUES_SCVERSION "
echo "ISSUES_UI_VERSION             $ISSUES_UI_VERSION "
echo "GROUPS_SCVERSION              $GROUPS_SCVERSION "
echo "GROUPSUI                      $GROUPSUI "
echo "GROUPS_DB_SC                  $GROUPS_DB_SC "
echo "CADANCE_JOB_VERSION           $CADENCE_JOB_SC "
echo "CADANCE_VERSION               $CADENCE_VERSION "
echo "METERING_VERSION              $METERING_VERSION "

