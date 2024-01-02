param (
  [string[]]$FileNames,
  [string]$DestinationDirectory
)

# Ensure that file names and destination directory are provided
if (-not $FileNames)
{
  throw "No file names provided. Please provide a list of file names."
}
if (-not $DestinationDirectory)
{
  throw "No destination directory provided. Please provide a destination directory."
}

# Escape special regex characters in file paths and expand the tilde '~' if present
$escapedFileNames = $FileNames | ForEach-Object {
  # Expand tilde to user's home directory
  $expandedPath = $_ -replace '^~', $HOME

  # Escape backslashes for regex
  $expandedPath -replace '\\', '\\\\'
}

# Build the search pattern to match any of the file names
$searchPattern = ($escapedFileNames -join "|")

# Use ripgrep to find files. -l will list file paths that match the search pattern.
$foundFiles = rg -l $searchPattern -g "*"

# Iterate over each found file and copy it to the destination directory
foreach ($filePath in $foundFiles)
{
  if (Test-Path $filePath)
  {
    # Copy the file to the destination directory
    $destinationPath = Join-Path -Path $DestinationDirectory -ChildPath (Split-Path -Path $filePath -Leaf)
    Copy-Item $filePath -Destination $destinationPath
  } else
  {
    Write-Warning "File not found: $filePath"
  }
}

# Output completion message
Write-Host "Files copied to $DestinationDirectory"



