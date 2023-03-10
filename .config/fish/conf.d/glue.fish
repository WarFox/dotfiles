# These functions need aws-cli v2

function glue-get-tables -a db_name
    aws glue get-tables --database-name $db_name --query 'TableList[].{Name:Name,Location:StorageDescriptor.Location}' --output table
end

function glue-delete-tables -a db_name
    aws glue  get-tables --database-name $db_name| jq -r '.TableList[].Name' | awk '{printf("%s ",$1)}' | \
        xargs aws glue  batch-delete-table  --database-name $db_name --tables-to-delete
end

function glue-get-job-runs -a job_name
    aws glue get-job-runs --job-name $job_name --query 'JobRuns[].[Id,JobRunState,StartedOn,CompletedOn]' --output table
end

function glue-start-job-run -a job_name
    aws glue start-job-run --job-name $job_name
end

function glue-delete-jobs-by-pattern -a pattern
    aws glue get-jobs | jq '.Jobs.Name' | rg $pattern | xargs -d '\n' wc -l
    xargs -d '\n' aws glue delete-job --job-name
end

function glue-get-table-partitions -a database table max-items
    set -q max-items[1]; or set max-items 100
    aws glue get-partitions --database-name $database --table-name $table --max-items $max-items | jq -r '.Partitions[] | [.Values[],.StorageDescriptor.Location]'
end

function glue-outdated-etls
  echo "* Glue ETL Jobs"
  for region in eu-west-1 us-east-1 eu-central-1;
    echo "** Region: $region"
    aws glue get-jobs --query 'Jobs[? (GlueVersion==`"0.9"` || GlueVersion==null) && (Command.Name==`"glueetl"` || Command.Name==`"gluestreaming"`) || Command.PythonVersion==`"2"`].{JobName:Name,JobType:Command.Name,GlueVersion:GlueVersion,PythonVersion:Command.PythonVersion}' --region $region --output table --max-items 3000
  end
end

function glue-outdated-pythonshell-jobs
    echo "* Python Shell Jobs"
    for region in eu-west-1 us-east-1 eu-central-1;
        echo "** Region: $region"
        aws glue get-jobs --query 'Jobs[? (GlueVersion==`"0.9"` || GlueVersion==null) && (Command.Name==`"pythonshell"`)].{JobName:Name,JobType:Command.Name,GlueVersion:GlueVersion,PythonVersion:Command.PythonVersion}' --output table --region $region --max-items 3000
    end
end

function glue-outdated-etls-all
    echo "* Glue ETL Jobs"
    for region in eu-west-1 us-east-1 eu-central-1;
        echo "** Region: $region"
        aws glue get-jobs --query 'Jobs[? (GlueVersion==`"0.9"` || GlueVersion==null)].{JobName:Name,JobType:Command.Name,GlueVersion:GlueVersion,PythonVersion:Command.PythonVersion}' --region $region --output table --max-items 3000
    end
end
