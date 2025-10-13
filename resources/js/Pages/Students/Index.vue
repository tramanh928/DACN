<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-4">Xin chào sinh viên {{ user.name }}</h1>
    <p class="text-gray-600">Đây là giao diện dành cho sinh viên.</p>
  </div>
</template>

<script setup>
defineProps({
  user: Object,
});
</script>