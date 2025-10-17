<template>
  <div class="min-h-screen bg-gray-50 font-sans text-gray-800">
    <!-- Header -->
    <header class="flex justify-between items-center bg-gradient-to-r from-indigo-400 to-indigo-600 text-white px-6 py-4 shadow-md">
      <div>
        <h1 class="text-xl font-bold tracking-wide">HỆ THỐNG QUẢN LÝ LUẬN VĂN TỐT NGHIỆP</h1>
        <p class="text-sm mt-1">KHOA CÔNG NGHỆ THÔNG TIN</p>
      </div>
      <div class="relative">
        <div @click="toggleMenu" class="flex items-center space-x-3 cursor-pointer">
          <div class="w-10 h-10 bg-white text-indigo-600 font-bold rounded-full flex items-center justify-center">
            {{ user.name.charAt(0).toUpperCase() }}
          </div>
          <div class="text-right">
            <div class="font-semibold text-sm text-white">{{ user.name }}</div>
            <div class="text-xs opacity-80">Admin</div>
          </div>
        </div>
        <div v-if="showMenu" class="absolute right-0 top-full mt-2 w-40 bg-white text-black rounded shadow z-50">
          <button @click="goProfile" class="w-full text-left px-4 py-2 hover:bg-gray-100">Trang cá nhân</button>
          <button @click="logout" class="w-full text-left px-4 py-2 hover:bg-gray-100 text-red-600">Đăng xuất</button>
        </div>
      </div>
    </header>

    <!-- Body -->
    <div class="flex">
      <!-- Sidebar -->
      <aside class="w-64 bg-white border-r p-6">
        <nav class="flex flex-col space-y-4 text-indigo-700 font-medium">
          <button class="text-left hover:text-indigo-900">Trang chủ</button>
          <button class="text-left hover:text-indigo-900">Bảng phân công</button>
          <button class="text-left hover:text-indigo-900">Quản lý giảng viên</button>
          <button class="text-left hover:text-indigo-900">Quản lý sinh viên</button>
          <button class="text-left hover:text-indigo-900">Quản lý đề tài</button>
        </nav>
      </aside>

      <!-- Main content -->
      <main class="flex-1 p-8">
        <h2 class="text-2xl font-bold text-indigo-600 mb-6 text-center">BẢNG PHÂN CÔNG LUẬN VĂN</h2>

        <!-- Import + Search -->
        <div class="flex justify-between items-center mb-6">
          <button class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600 transition">
            Import Excel
          </button>
          <input
            type="text"
            placeholder="Tìm kiếm theo tên GVHD hoặc đề tài..."
            class="w-1/3 p-2 border rounded bg-white"
          />
        </div>

        <!-- Table -->
        <div class="overflow-x-auto">
          <table class="min-w-full bg-white rounded shadow text-sm divide-y divide-gray-200">
            <thead class="bg-indigo-100 text-indigo-700">
              <tr>
                <th class="p-3 text-left">MSSV</th>
                <th class="p-3 text-left">Họ và tên SV</th>
                <th class="p-3 text-left">Nhóm</th>
                <th class="p-3 text-left">Đề tài LVTN</th>
                <th class="p-3 text-left">Giảng viên HD</th>
                <th class="p-3 text-left">Trạng thái gặp GV</th>
                <th class="p-3 text-left">Ghi chú</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(item, i) in assignments" :key="i" class="hover:bg-indigo-50">
                <td class="p-3">{{ item.mssv }}</td>
                <td class="p-3">{{ item.name }}</td>
                <td class="p-3">{{ item.group }}</td>
                <td class="p-3">{{ item.topic }}</td>
                <td class="p-3">{{ item.lecturer }}</td>
                <td class="p-3">
                  <span
                    :class="{
                      'bg-green-100 text-green-700 px-2 py-1 rounded-full text-xs font-semibold': item.status === 'Đã gặp',
                      'bg-red-100 text-red-700 px-2 py-1 rounded-full text-xs font-semibold': item.status === 'Chưa gặp'
                    }"
                  >
                    {{ item.status }}
                  </span>
                </td>
                <td class="p-3 text-gray-600 italic">{{ item.note }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { router } from '@inertiajs/vue3'

const showMenu = ref(false)
function toggleMenu() {
  showMenu.value = !showMenu.value
}
function goProfile() {
  router.visit('/profile')
}
function logout() {
  router.post(route('logout'))
}

defineProps({
  user: Object,
})

const assignments = ref([
])
</script>
