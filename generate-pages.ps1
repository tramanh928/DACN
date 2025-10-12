# --- Create folder structure ---
$pages = @("Students", "Teachers", "Assistants", "Events")
foreach ($page in $pages) {
    $folder = "resources/js/Pages/$page"
    if (!(Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder | Out-Null
        Write-Host "Created folder: $folder"
    }

    # --- Create the four Vue files ---
    $files = @("Index.vue", "Create.vue", "Edit.vue", "Show.vue")
    foreach ($file in $files) {
        $path = "$folder/$file"
        $content = @"
<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-4">$page - ${file -replace '.vue',''} Page</h1>
    <p class="text-gray-600">This is the $file page for $page.</p>
  </div>
</template>

<script setup>
// Example placeholder component
</script>

<style scoped>
</style>
"@
        Set-Content -Path $path -Value $content -Encoding UTF8
        Write-Host "✅ Created: $path"
    }
}
