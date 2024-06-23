# Define an array of environments
$environments = @("staging", "production", "testing")

# Start a new pipeline configuration
$pipelineConfig = @"
steps:
"@

# Loop through each environment and append a step to the pipeline configuration
foreach ($env in $environments) {
    $step = @"
  - label: `":rocket: Deploy to $env`"
    command:
      - `"echo 'Deploying to $env environment'`"
      - `"./deploy.sh --env $env`"
"@
    $pipelineConfig += $step
}

# Write the dynamic pipeline configuration to a file
$pipelineConfig | Out-File -FilePath "dynamic-pipeline.yml" -Encoding utf8

# Upload the dynamic pipeline configuration
& buildkite-agent pipeline upload "dynamic-pipeline.yml"
