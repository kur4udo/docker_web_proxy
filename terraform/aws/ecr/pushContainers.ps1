# Parameters
param (
    [Parameter(Mandatory = $true)]
    [String]
    $account,

    [Parameter(Mandatory = $true)]
    [String]
    $region
)

# Get temporary token for ECR
Invoke-Expression -Command (Get-ECRLoginCommand -Region eu-west-1).Command

# Push Docker images
docker.exe push "${account}.dkr.ecr.${region}.amazonaws.com/web_static:latest"
docker.exe push "${account}.dkr.ecr.${region}.amazonaws.com/web-ui:latest"

exit