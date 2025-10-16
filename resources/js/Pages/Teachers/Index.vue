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
            <div class="text-xs opacity-80">Giảng viên</div>
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
          <button class="text-left hover:text-indigo-900"> Trang chủ</button>
          <button class="text-left hover:text-indigo-900"> Quản lý đề tài</button>
          <button class="text-left hover:text-indigo-900">Danh sách sinh viên</button>
        </nav>
      </aside>

      <!-- Main content -->
      <main class="flex-1 p-8">
        <h2 class="text-2xl font-bold text-indigo-600 mb-6 text-center">QUẢN LÝ ĐỀ TÀI LUẬN VĂN</h2>

        <!-- Nút chức năng -->
        <div class="flex justify-end mb-6">
          <button class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600 transition">
            Import đề tài
          </button>
        </div>

        <!-- Bảng danh sách đề tài -->
        <div class="overflow-x-auto">
          <table class="min-w-full bg-white rounded shadow text-sm divide-y divide-gray-200">
            <thead class="bg-indigo-100 text-indigo-700">
              <tr>
                <th class="p-3 text-left">Mã đề tài</th>
                <th class="p-3 text-left">Tên đề tài</th>
                <th class="p-3 text-left">Mô tả</th>
                <th class="p-3 text-left">Số lượng tối đa</th>
                <th class="p-3 text-left">Trạng thái</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(topic, i) in filteredTopics" :key="i" class="hover:bg-indigo-50">
                <td class="p-3">{{ topic.code }}</td>
                <td class="p-3">{{ topic.title }}</td>
                <td class="p-3">{{ topic.description }}</td>
                <td class="p-3">{{ topic.limit }}</td>
                <td class="p-3">
                  <div v-if="editingIndex === i">
                    <select
                      v-model="topics[i].status"
                      @change="finishEdit(i)"
                      class="border p-1 rounded text-sm"
                    >
                      <option v-for="option in statusOptions" :key="option" :value="option">
                        {{ option }}
                      </option>
                    </select>
                  </div>
                  <div
                    v-else
                    @click="editingIndex = i"
                    class="cursor-pointer inline-block px-2 py-1 rounded-full text-xs font-semibold"
                    :class="{
                      'bg-green-100 text-green-700': topic.status === 'Chờ sinh viên chọn',
                      'bg-yellow-100 text-yellow-700': topic.status === 'Đã được chọn',
                      'bg-red-100 text-red-700': topic.status === 'Đã khóa'
                    }"
                  >
                    {{ topic.status }}
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
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

const selectedStatus = ref('')
const editingIndex = ref(null)

const statusOptions = [
  'Chờ sinh viên chọn',
  'Đã được chọn',
  'Đã khóa'
]

const topics = ref([
])

const filteredTopics = computed(() => {
  if (!selectedStatus.value) return topics.value
  return topics.value.filter(t => t.status === selectedStatus.value)
})

function finishEdit(index) {
  editingIndex.value = null
}
</script>
