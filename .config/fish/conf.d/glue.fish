function glue-get-tables -a db_name
    aws glue get-tables --database-name $db_name | jq -r '.TableList[] | [.Name,.StorageDescriptor.Location] | join(" | ")' | sed 's/$/ |/' | sed 's/^/| /' | column -t
end

function glue-delete-tables -a db_name
    aws glue  get-tables --database-name $db_name| jq -r '.TableList[].Name' | awk '{printf("%s ",$1)}' | \
        xargs aws glue  batch-delete-table  --database-name $db_name --tables-to-delete
end

function glue-get-job-runs -a job_name
    aws glue get-job-runs --job-name $job_name |  jq -r '.JobRuns[] | [.Id, .JobRunState, .StartedOn, .CompletedOn] | @csv'
end

function glue-start-job-run -a job_name
    aws glue start-job-run --job-name $job_name
end

function glue-delete-jobs-by-pattern -a pattern
    aws glue get-jobs | jq '.Jobs[].Name' | rg $pattern | xargs -d '\n' wc -l
    xargs -d '\n' aws glue delete-job --job-name
end
