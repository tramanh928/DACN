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
            @click="() => performAction('Chấm điểm 50%', () => setCurrentView('evaluation50'))"
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
                  <td class="p-3 text-center" >{{ idx + 1 }}</td>
                  <td class="p-3 text-center">{{ s.mssv }}</td>
                  <td class="p-3 text-center">{{ s.name }}</td>
                  <td class="p-3 text-center">{{ s.Lop || '-' }}</td>
                  <td class="p-3 text-center">{{ s.phone || '-' }}</td>
                  <td class="p-3 text-center">{{ s.email || '-' }}</td>
                  <td class="p-3 text-center"><input v-model="s.group" @keyup.enter="updateGroup(s)" class="border p-1 w-16 text-center"/></td>
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
              <button class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600">Xuất file Excel</button>
            </div>
          </div>

          <div class="bg-white rounded shadow overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center">MSSV</th>
                  <th class="p-3 text-center">Họ và tên</th>
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
                  <td class="p-3 text-center">{{ t.name }}</td>
                  <td class="p-3 text-center">{{ t.group || '-' }}</td>
                  <td class="p-3 text-center">{{ t.topic || '-' }}</td>
                  <td class="p-3 text-center">{{ t.description || '-' }}</td>
                  <td class="p-3 text-center">{{ t.status || '-' }}</td>
                  <td class="p-3 text-center">
                    <div class="flex gap-2 justify-center">
                      <button @click="openAssignForm(t)" type="button" class="bg-blue-500 text-white px-3 py-1 rounded text-sm opacity-90" >
                        Phân công
                      </button>
                      <button @click="downloadTemplate(t.code)" type="button" class="bg-indigo-500 text-white px-3 py-1 rounded text-sm opacity-90" >
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
                  <td class="p-3 text-center">{{ s.Lop   || '-' }}</td>
                  <td class="p-3 text-center">{{ s.group || '-' }}</td>
                  <td class="p-3 text-center">{{ s.topic || s.title || '-' }}</td>
                  <td class="p-3 text-center">
                    <div class="flex items-center justify-center gap-2">
                      <input
                        @keyup.enter="updateScore(s)"
                        v-model="s.score"
                        type="text"
                        class="w-20 px-1 py-1 border rounded text-sm"
                        placeholder="0 - 100"
                      />
                      <span class="text-sm text-gray-600">%</span>
                    </div>
                  </td>
                  <td class="p-3 text-center">
                    <input
                      @keyup.enter="updateNote(s)"
                      v-model="s.note"
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
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">ĐIỂM PHẢN BIỆN - HƯỚNG DẪN</h2>
            <div>
              <input v-model="reviewScoreSearch" type="text" placeholder="Tìm mã hoặc tên đề tài..." class="border rounded px-3 py-2 text-sm w-64" />
            </div>
          </div>

          <div class="bg-white rounded shadow overflow-x-auto">
            <table class="min-w-full text-sm divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center">STT</th>
                  <th class="p-3 text-center">Mã đề tài</th>
                  <th class="p-3 text-center">Tên đề tài</th>
                  <th class="p-3 text-center">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(t, idx) in reviewScoreList" :key="t.MaDT || t.id || idx" class="hover:bg-indigo-50">
                  <td class="p-3 text-center">{{ idx + 1 }}</td>
                  <td class="p-3 text-center">{{ t.MaDT || t.id || '-' }}</td>
                  <td class="p-3 text-center">{{ t.TenDeTai || '-' }}</td>
                  <td class="p-3 text-center">
                    <div class="flex justify-center gap-2">
                      <button type="button" @click="openReviewScoreModal(t)" class="bg-yellow-400 text-black px-3 py-1 rounded hover:bg-yellow-500 transition">
                        Chấm điểm
                      </button>
                    </div>
                  </td>
                </tr>
                <tr v-if="(reviewScoreList || []).length === 0">
                  <td colspan="4" class="p-4 text-center text-gray-500">Không có đề tài</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </main>
    </div>

    <!-- Simple Form Modal (placeholder dùng cho Thêm/Sửa) -->
    <div v-if="showForm" class="fixed inset-0 bg-black bg-opacity-40 flex items-center justify-center z-50">
      <div class="bg-white rounded shadow-lg w-[90%] max-w-2xl p-6">
        <div class="flex justify-between items-center mb-4">
          <h3 class="text-lg font-semibold">{{ formMode === 'add' ? 'Phân công đề tài' : 'Sửa' }}</h3>
        </div>

        <!-- Form content placeholder -->
       <div class="space-y-4 text-sm text-gray-700">
          <!-- TenDT -->
          <div>
            <label class="block font-medium mb-1">Tên đề tài</label>
            <input
              v-model="formData.TenDT"
              type="text"
              class="w-full border rounded px-3 py-2"
              placeholder="Nhập tên đề tài"
            />
          </div>

          <!-- MoTa -->
          <div>
            <label class="block font-medium mb-1">Mô tả</label>
            <textarea
              v-model="formData.MoTa"
              class="w-full border rounded px-3 py-2"
              rows="4"
              placeholder="Nhập mô tả đề tài"
            ></textarea>
          </div>

          <!-- TrangThai -->
          <div>
            <label class="block font-medium mb-1">Trạng thái</label>
            <select
              v-model="formData.TrangThai"
              class="w-full border rounded px-3 py-2"
            >
              <option value="">-- Chọn trạng thái --</option>
              <option value="Được tiếp tục">Được tiếp tục</option>
              <option value="Bị đình chỉ">Bị đình chỉ</option>
            </select>
          </div>

          <!-- Save Button -->
          <div class="flex justify-end mt-4 gap-x-3">
            <button @click="saveForm" class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600"> Lưu </button>
            <button @click="closeForm" class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600">Đóng</button>
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
const formData = ref({
  MSSV: '',
  MaGV: '',
  TenDT: '',
  MoTa: '',
  TrangThai: '',
})

const allowedActions = ref([]);

const performAction = (actionName, callback) => {
  if (!isActionAllowed(actionName)) {
    alert(`Bạn không thể thực hiện hành động "${actionName}" vào thời điểm này!`);
    return;
  }
  callback();
};

// Async function to check access for a specific event
const isActionAllowed = async (TenSuKien) => {
  try {
    const response = await fetch(`/check-access/${encodeURIComponent(TenSuKien)}`);
    if (!response.ok) throw new Error('Network response was not ok');

    const data = await response.json();

    // Returns true or false based on server response
    return data.access === true;
  } catch (error) {
    console.error('Error checking access:', error);
    return false;
  }
};

// Example usage
(async () => {
  const allowed = await isActionAllowed("Chấm điểm 50%");
  console.log('Allowed?', allowed);
})(); 



// Evaluation 50% map 
const evaluationMap = reactive({})

async function downloadTemplate(MaDT) {
  const res = await axios.get(`/nhiem-vu-template/${MaDT}`, {
    responseType: 'blob'
  });

  const url = window.URL.createObjectURL(new Blob([res.data]));

  // Extract filename from content-disposition header
  let filename = 'download.docx'; // fallback
  const disposition = res.headers['content-disposition'];
  if (disposition && disposition.indexOf('filename=') !== -1) {
    const match = disposition.match(/filename\*=UTF-8''(.+)$/);
    if (match && match[1]) {
      filename = decodeURIComponent(match[1]);
    } else {
      // fallback for older browsers
      const match2 = disposition.match(/filename="(.+)"/);
      if (match2 && match2[1]) {
        filename = match2[1];
      }
    }
  }

  const a = document.createElement('a');
  a.href = url;
  a.download = filename;
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
  window.URL.revokeObjectURL(url);
}



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

function closeForm() { showForm.value = false; editingItem.value = null; editingIndex.value = null }
async function saveForm() {
  try {
    const res = await axios.post('/save-topic', {
      MSSV: formData.value.MSSV,
      TenDT: formData.value.TenDT,
      MoTa: formData.value.MoTa,
      TrangThai: formData.value.TrangThai,
      MaGV: formData.value.MaGV
    });

    alert("Lưu đề tài & cập nhật sinh viên thành công!");
    showForm.value = false;
    fetchStudents();
    fetchTopics();

  } catch (err) {
    alert(err.response?.data?.error || "Lỗi khi lưu form");
  }
}



// Export functions
function exportStudents() {
  try { window.open(route('students.export'), '_blank') } catch { /* fallback */ }
}
function exportTopics() {
  try { window.open(route('topics.export'), '_blank') } catch { /* fallback */ }
}
function updateScore(student) {
  axios.post('/update-score', {
    MSSV: student.mssv,
    Diem: student.score
  })
  .then(res => {
    alert('Cập nhật điểm thành công!');
  })
  .catch(err => {
    alert(err.response.data.error || 'Cập nhật điểm thất bại!');
  });
  fetchStudents();
}
function updateNote(student) {
  axios.post('/update-note', {
    MSSV: student.mssv,
    GhiChu: student.note
  })
  .then(res => {
    alert('Cập nhật ghi chú thành công!');
  })
  .catch(err => {
    alert(err.response.data.error || 'Cập nhật ghi chú thất bại!');
  });
  fetchStudents();
}
function updateGroup(student) {
  axios.post('/update-student-group', {
    mssv: student.mssv,
    group_number: student.group
  })
  .then(res => {
    alert('Cập nhật nhóm thành công!');
  })
  .catch(err => {
    alert(err.response.data.error || 'Cập nhật nhóm thất bại!');
  });
  fetchStudents();
}

async function openAssignForm(student){
  formMode.value = 'add'
  const teacher = await axios.post('/teacher-by-id/' + props.user.id);
  formData.value = {
    MSSV: student ? student.mssv || '' : '',
    MaGV: teacher.data.MaGV || '',
    TenDT: student ? student.topic || '' : '',
    MoTa: student ? student.description || '' : '',
    TrangThai: student ? student.status || '' : '',
  }
  showForm.value = true
}

const displayedTopics = computed(() => {
  const q = (topicSearch.value || '').toString().toLowerCase().trim()
  const base = students.value
  if (!q) return base
  return base.filter(t => {
    const msgv = (t.msgv ?? t.teacher_id ?? '').toString().toLowerCase()
    const mssv = (t.mssv ?? t.student_id ?? '').toString().toLowerCase()
    const title = (t.title ?? t.ten_de_tai ?? '').toString().toLowerCase()
    return msgv.includes(q) || mssv.includes(q) || title.includes(q)
  })
})

const fetchStudents = async () => {
  try {
    const teacher = await axios.post('/teacher-by-id/' + props.user.id);
    const res = await axios.post('/students-by-teacher/' + teacher.data.MaGV);

    students.value = res.data.map(s => {
      let rawGroup = s.group ?? s.Nhom ?? null;

      let displayGroup = rawGroup;

      if (typeof rawGroup === 'string' && rawGroup.includes('-')) {
        displayGroup = rawGroup.split('-')[1];
      }

      return {
        ...s,
        group: displayGroup    
      };
    }).sort((a, b) => Number(a.group) - Number(b.group));

    totalStudents.value = students.value.length;

  } catch (err) {}
};



const fetchTopics = async () => {
  try {
    const teacher = await axios.post('/teacher-by-id/' + props.user.id);
    const res = await axios.get('/topics-by-teacher/' + teacher.data.MaGV);
    topics.value = res.data || []
    totalTopics.value = topics.value.length
  } catch (err) {}
}

// --- Điểm phản biện - hướng dẫn ---
const reviewScoreSearch = ref('')
const showReviewScoreModal = ref(false)
const reviewScoreForm = ref({
  MaDT: '',
  TenDeTai: '',
  Diem: ''
})

const reviewScoreList = computed(() => {
  const q = (reviewScoreSearch.value || '').toString().toLowerCase().trim()
  return (topics.value || []).filter(t => {
    if (!q) return true
    return ((t.MaDT || t.id || '').toString().toLowerCase().includes(q) ||
            (t.TenDT || '').toString().toLowerCase().includes(q))
  })
})

function openReviewScoreModal(topic) {
  reviewScoreForm.value.MaDT = topic.MaDT ?? topic.id ?? ''
  reviewScoreForm.value.TenDeTai = topic.TenDT ?? ''
  reviewScoreForm.value.Diem = topic.review_score ?? topic.Diem ?? ''
  reviewScoreForm.value.GhiChu = topic.review_note ?? topic.GhiChu ?? ''
  showReviewScoreModal.value = true
}

onMounted(() => {
  fetchStudents()
  fetchTopics()
})
</script>