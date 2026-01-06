<template>
  <div class="min-h-screen flex items-center justify-center bg-gray-100">

    <div class="w-full max-w-md bg-white rounded-xl shadow-lg p-8">
      <!-- TITLE -->
      <div class="text-center mb-8">
        <h1 class="text-2xl font-bold text-indigo-600">
          HỆ THỐNG QUẢN LÝ LUẬN VĂN
        </h1>
        <p class="text-sm text-gray-500 mt-1">
          Khoa Công Nghệ Thông Tin
        </p>
      </div>

      <!-- ACTIONS -->
      <div class="space-y-4">
        <Link
          :href="route('login')"
          class="block w-full text-center bg-indigo-600 text-white py-2.5 rounded-lg font-semibold hover:bg-indigo-700 transition"
        >
          Đăng nhập
        </Link>

      </div>

      <!-- FOOTER -->
      <p class="text-center text-xs text-gray-400 mt-8">
        © {{ new Date().getFullYear() }} Khoa CNTT · Quản lý luận văn
      </p>
    </div>

  </div>
</template>

<script setup>
import { Link } from '@inertiajs/vue3'
</script>
