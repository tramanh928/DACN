<template>
  <div class="min-h-screen bg-gray-50 font-vietnamese text-gray-800">
    <!-- Header -->
    <header class="flex justify-between items-center bg-gradient-to-r from-indigo-400 to-indigo-600 text-white px-6 py-4 shadow-md">
      <div>
        <h1 class="text-xl font-bold tracking-wide">HỆ THỐNG QUẢN LÝ LUẬN VĂN TỐT NGHIỆP</h1>
        <p class="text-sm mt-1">KHOA CÔNG NGHỆ THÔNG TIN</p>
      </div>
      <div class="relative">
        <div @click="toggleMenu" class="flex items-center space-x-3 cursor-pointer">
          <div class="w-10 h-10 bg-white text-indigo-600 font-bold rounded-full flex items-center justify-center">
            {{ user.name && user.name.length ? user.name.charAt(0).toUpperCase() : 'U' }}
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

    <!-- Body: đảm bảo chiều cao đầy đủ để nền trắng của sidebar không bị cắt -->
    <div class="flex h-[calc(100vh-4rem)]"> <!-- trừ chiều cao header (py-4 ≈ 4rem) -->
      <!-- Sidebar  -->
      <aside class="w-64 bg-white border-r p-6 min-h-full">
        <nav class="flex flex-col space-y-4 text-indigo-700 font-medium">
          <button 
            @click="setCurrentView('dashboard')" 
            :class="currentView === 'dashboard' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Trang chủ
          </button>

          <button 
            @click="setCurrentView('students')" 
            :class="currentView === 'students' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Danh sách sinh viên
          </button>

          <button 
            @click="setCurrentView('assignTopic')" 
            :class="currentView === 'assignTopic' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Phân công đề tài
          </button>

          <button 
            @click="setCurrentView('evaluation50')" 
            :class="currentView === 'evaluation50' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Đánh giá 50%
          </button>

          <button 
            @click="setCurrentView('reviewScore')" 
            :class="currentView === 'reviewScore' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Điểm phản biện - hướng dẫn
          </button>
        </nav>
      </aside>

      <!-- Main content - added overflow-auto to handle content overflow -->
      <main class="flex-1 p-8 overflow-auto">
        <!-- Dashboard View -->
        <div v-if="currentView === 'dashboard'" class="min-h-[50vh] flex items-center justify-center">
          <div class="text-center">
            <h2 class="text-3xl font-bold text-indigo-600">Xin chào, {{ user.name }}</h2>
            <p class="text-gray-600 mt-2">Chúc bạn một ngày làm việc hiệu quả.</p>
          </div>
        </div>

        <!-- Students view -->
        <div v-if="currentView === 'students'">
          <div class="flex items-center justify-between mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">QUẢN LÝ SINH VIÊN</h2>

            <div class="flex items-center space-x-2">
              <input
                type="text"
                placeholder="Tìm kiếm sinh viên..."
                class="border rounded px-3 py-2 text-sm w-64"
              />
              <button class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">Thêm</button>
              <button class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600">Xuất file Excel</button>
            </div>
          </div>

          <div class="bg-white rounded shadow overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center">STT</th>
                  <th class="p-3 text-center">MSSV</th>
                  <th class="p-3 text-center">Họ và tên</th>
                  <th class="p-3 text-center">Lớp</th>
                  <th class="p-3 text-center">SĐT</th>
                  <th class="p-3 text-center">Email</th>
                  <th class="p-3 text-center">Nhóm</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(s, idx) in students" :key="s.mssv || s.id || idx" class="hover:bg-indigo-50">
                  <td class="p-3">{{ idx + 1 }}</td>
                  <td class="p-3">{{ s.mssv }}</td>
                  <td class="p-3 ">{{ s.name }}</td>
                  <td class="p-3 ">{{ s.Lop || '-' }}</td>
                  <td class="p-3 ">{{ s.phone || '-' }}</td>
                  <td class="p-3 ">{{ s.email || '-' }}</td>
                  <td class="p-3 ">{{ s.group || '-' }}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Assign Topic view -->
        <div v-if="currentView === 'assignTopic'">
          <div class="flex items-center justify-between mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">PHÂN CÔNG ĐỀ TÀI</h2>

            <div class="flex items-center space-x-2">
              <input
                type="text"
                placeholder="Tìm theo MSGV / MSSV / tên đề tài"
                class="border rounded px-3 py-2 text-sm w-64"
              />
              <button class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">Thêm</button>
              <button class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600">Xuất file Excel</button>
            </div>
          </div>

          <div class="bg-white rounded shadow overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center">MSSV</th>
                  <th class="p-3 text-center">Nhóm</th>
                  <th class="p-3 text-center">Tên đề tài</th>
                  <th class="p-3 text-center">Mô tả đề tài</th>
                  <th class="p-3 text-center">Trạng thái</th>
                  <th class="p-3 text-center">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr v-if="displayedTopics.length === 0">
                  <td colspan="6" class="p-4 text-center text-gray-500">
                    Chưa có phân công đề tài
                  </td>
                </tr>
                <tr v-for="(t, idx) in displayedTopics" :key="t.id || idx" class="hover:bg-indigo-50">
                  <td class="p-3 text-center">{{ t.mssv || '-' }}</td>
                  <td class="p-3 text-center">{{ t.group || '-' }}</td>
                  <td class="p-3 text-center">{{ t.title || t.ten_de_tai || '-' }}</td>
                  <td class="p-3 text-center">{{ t.description || '-' }}</td>
                  <td class="p-3 text-center">{{ t.status || '-' }}</td>
                  <td class="p-3 text-center">
                    <div class="flex gap-2 justify-center">
                      <button type="button" class="bg-blue-500 text-white px-3 py-1 rounded text-sm opacity-90" >
                        Phân công
                      </button>
                      <button type="button" class="bg-indigo-500 text-white px-3 py-1 rounded text-sm opacity-90" >
                        Xuất nhiệm vụ
                      </button>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Evaluation 50% view -->
        <div v-if="currentView === 'evaluation50'">
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">ĐÁNH GIÁ 50%</h2>
            <div class="flex items-center gap-4">
              <input
                v-model="evaluationSearch"
                type="text"
                placeholder="Tìm MSSV / tên..."
                class="w-80 px-3 py-2 border rounded shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-300"
              />
              <button class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600 transition">
                Lưu
              </button>
            </div>
          </div>
          <div class="bg-white rounded shadow overflow-x-auto">
            <table class="min-w-full text-sm divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center">STT</th>
                  <th class="p-3 text-center">MSSV</th>
                  <th class="p-3 text-center">Họ và tên</th>
                  <th class="p-3 text-center">Lớp</th>
                  <th class="p-3 text-center">Nhóm</th>
                  <th class="p-3 text-center">Tên đề tài</th>
                  <th class="p-3 text-center">Điểm</th>
                  <th class="p-3 text-center">Ghi chú</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(s, idx) in students" :key="s.mssv || s.id || idx" class="hover:bg-indigo-50">
                  <td class="p-3 text-center">{{ idx + 1 }}</td>
                  <td class="p-3 text-center">{{ s.mssv }}</td>
                  <td class="p-3 text-center">{{ s.name }}</td>
                  <td class="p-3 text-center">{{ s.Lop || s.class || '-' }}</td>
                  <td class="p-3 text-center">{{ s.group || '-' }}</td>
                  <td class="p-3 text-center">{{ s.topic || s.title || '-' }}</td>
                  <td class="p-3 w-40 text-center">
                    <div class="inline-block">
                      <input
                        v-model="evaluationMap[s.mssv].score"
                        type="text"
                        class="w-28 px-2 py-1 border rounded text-sm mx-auto block"
                        placeholder="0 - 100"
                      />
                      <div class="text-sm text-gray-600 mt-1">%</div>
                    </div>
                  </td>
                  <td class="p-3 text-center">
                    <input
                      v-model="evaluationMap[s.mssv].note"
                      type="text"
                      class="w-full px-2 py-1 border rounded text-sm mx-auto block"
                      placeholder="Ghi chú..."
                    />
                  </td>
                </tr>

                <tr v-if="filteredEvaluationList.length === 0">
                  <td colspan="8" class="p-4 text-center text-gray-500">Không có sinh viên để đánh giá</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <!-- Review Score view placeholder -->
        <div v-if="currentView === 'reviewScore'">
          <h2 class="text-2xl font-bold text-indigo-600 mb-6">ĐIỂM PHẢN BIỆN - HƯỚNG DẪN</h2>
          <div class="bg-white rounded shadow p-6 text-gray-600">Chưa có dữ liệu.</div>
        </div>
      </main>
    </div>

    <!-- Simple Form Modal (placeholder dùng cho Thêm/Sửa) -->
    <div v-if="showForm" class="fixed inset-0 bg-black bg-opacity-40 flex items-center justify-center z-50">
      <div class="bg-white rounded shadow-lg w-[90%] max-w-2xl p-6">
        <div class="flex justify-between items-center mb-4">
          <h3 class="text-lg font-semibold">{{ formMode === 'add' ? 'Thêm' : 'Sửa' }}</h3>
          <button @click="closeForm" class="text-gray-600 hover:text-gray-800">Đóng</button>
        </div>

        <!-- Form content placeholder -->
        <div class="space-y-3 text-sm text-gray-700">
          <p>Form (điền chi tiết ở đây). Chọn lưu để gửi đến backend.</p>
          <div class="flex justify-end mt-4">
            <button @click="saveForm" class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600">Lưu</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, reactive, watch } from 'vue'
import { router } from '@inertiajs/vue3'
import axios from 'axios'

const showMenu = ref(false)
function toggleMenu() { showMenu.value = !showMenu.value }
function goProfile() { router.visit('/profile') }
function logout() { router.post(route('logout')) }

const props = defineProps({
  user: { type: Object, default: () => ({ name: 'Giảng viên' }) },
})

// Sidebar view state
const currentView = ref('dashboard')
function setCurrentView(view) { currentView.value = view }

// Stats default 0
const totalStudents = ref(0)
const totalTopics = ref(0)

// Students & topics data
const students = ref([])
const topics = ref([])

// Evaluation 50% map 
const evaluationMap = reactive({})

// Khởi tạo entry cho mỗi sinh viên khi danh sách students thay đổi
watch(students, (list) => {
  (list || []).forEach(s => {
    const id = (s.mssv ?? s.student_id ?? '')
    if (id && !evaluationMap[id]) evaluationMap[id] = { score: '', note: '' }
  })
}, { immediate: true })

// Search models
const studentSearch = ref('')
const topicSearch = ref('')

// Simple form modal state
const showForm = ref(false)
const formMode = ref('add') // 'add'|'edit'
const editingItem = ref(null)
const editingIndex = ref(null)

// --- Đánh giá 50%: state và helpers ---
const evaluationSearch = ref('')

const filteredEvaluationList = computed(() => {
  const q = (evaluationSearch.value || '').toString().toLowerCase().trim()
  return (students.value || []).filter(s => {
    if (!q) return true
    return ((s.mssv || '') + ' ' + (s.name || '')).toLowerCase().includes(q)
  })
})

// khởi tạo evaluationMap khi students thay đổi
watch(students, (list) => {
  (list || []).forEach(s => {
    const id = s.mssv ?? s.MSSV ?? ''
    if (!evaluationMap[id]) evaluationMap[id] = { score: s.evaluation50?.score ?? '', note: s.evaluation50?.note ?? '' }
  })
}, { immediate: true })

function openAddStudent() { formMode.value = 'add'; editingItem.value = null; showForm.value = true }
function openEditStudent(item, idx) { formMode.value = 'edit'; editingItem.value = item; editingIndex.value = idx; showForm.value = true }
async function deleteStudent(item) {
  if (!confirm('Xác nhận xóa sinh viên này?')) return
  try {
    // nếu có endpoint: await axios.delete(`/students/${item.id}`)
    // local remove for UI
    students.value = students.value.filter(s => (s.mssv ?? s.student_id) !== (item.mssv ?? item.student_id))
    totalStudents.value = students.value.length
  } catch (err) { /* handle */ }
}

function openAddTopic() { formMode.value = 'add'; editingItem.value = null; showForm.value = true }
function openEditTopic(item, idx) { formMode.value = 'edit'; editingItem.value = item; editingIndex.value = idx; showForm.value = true }
async function deleteTopic(item) {
  if (!confirm('Xác nhận xóa phân công này?')) return
  try {
    // nếu có endpoint: await axios.delete(`/topics/${item.id}`)
    topics.value = topics.value.filter(t => t !== item)
    totalTopics.value = topics.value.length
  } catch (err) { /* handle */ }
}

function closeForm() { showForm.value = false; editingItem.value = null; editingIndex.value = null }
function saveForm() {
  // placeholder: lưu dữ liệu -> gọi backend hoặc cập nhật local arrays
  // sau khi lưu, đóng modal
  showForm.value = false
}

// Export functions
function exportStudents() {
  try { window.open(route('students.export'), '_blank') } catch { /* fallback */ }
}
function exportTopics() {
  try { window.open(route('topics.export'), '_blank') } catch { /* fallback */ }
}

// Filtering/computed lists
const displayedStudents = computed(() => {
  const q = (studentSearch.value || '').toString().toLowerCase().trim()
  if (!q) return students.value
  return students.value.filter(s => {
    const mssv = (s.mssv ?? s.student_id ?? '').toString().toLowerCase()
    const name = (s.name ?? s.ho_ten ?? '').toString().toLowerCase()
    const cls = (s.class ?? s.lop ?? '').toString().toLowerCase()
    return mssv.includes(q) || name.includes(q) || cls.includes(q)
  })
})

const displayedTopics = computed(() => {
  const q = (topicSearch.value || '').toString().toLowerCase().trim()
  const base = topics.value
  if (!q) return base
  return base.filter(t => {
    const msgv = (t.msgv ?? t.teacher_id ?? '').toString().toLowerCase()
    const mssv = (t.mssv ?? t.student_id ?? '').toString().toLowerCase()
    const title = (t.title ?? t.ten_de_tai ?? '').toString().toLowerCase()
    return msgv.includes(q) || mssv.includes(q) || title.includes(q)
  })
})

// status options
const statusOptions = [
  'Chờ sinh viên chọn',
  'Đã được chọn',
  'Đã khóa'
]

// fetch students/topics if backend available (kept optional)
const fetchStudents = async () => {
  try {
    const res = await axios.post('/students/getAll')
    students.value = res.data.sort((a, b) => Number(a.group) - Number(b.group))
    totalStudents.value = students.value.length
  } catch (err) {}
}
const fetchTopics = async () => {
  try {
    const res = await axios.post('/topics/getAll')
    topics.value = res.data || []
    totalTopics.value = topics.value.length
  } catch (err) {}
}

onMounted(() => {
  fetchStudents()
  fetchTopics()
})
</script>
