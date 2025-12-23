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
            {{ user.name ? user.name.charAt(0).toUpperCase() : '?' }}
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

    <!-- BODY -->
    <div class="flex h-[calc(100vh-4rem)]">
      <!-- Sidebar -->
      <aside class="w-64 bg-white border-r p-6 h-full">
        <nav class="flex flex-col space-y-4 text-indigo-700 font-medium">
          <button
            @click="setCurrentView('home')"
            :class="currentView === 'home' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Trang chủ
          </button>

          <button
            @click="setCurrentView('teachers')"
            :class="currentView === 'teachers' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Quản lý giảng viên
          </button>

          <button
            @click="setCurrentView('students')"
            :class="currentView === 'students' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Quản lý sinh viên
          </button>

          <button
            @click="setCurrentView('topics')"
            :class="currentView === 'topics' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Quản lý đề tài
          </button>

          <button
            @click="setCurrentView('assignments')"
            :class="currentView === 'assignments' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Bảng phân công
          </button>

          <button
            @click="setCurrentView('evaluation50')"
            :class="currentView === 'evaluation50' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Đánh giá 50%
          </button>

          <button
            @click="setCurrentView('reviewAssignment')"
            :class="currentView === 'reviewAssignment' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Phân công phản biện
          </button>

          <button
            @click="setCurrentView('grading')"
            :class="currentView === 'grading' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Chấm điểm
          </button>

          <button
            @click="setCurrentView('committee')"
            :class="currentView === 'committee' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Thành lập hội đồng
          </button>

          <button
            @click="setCurrentView('committeeAssignment')"
            :class="currentView === 'committeeAssignment' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Phân công hội đồng
          </button>

          <button
            @click="setCurrentView('timeAllocation')"
            :class="currentView === 'timeAllocation' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Phân bổ thời gian
          </button>
        </nav>
      </aside>

      <!-- Main content -->
      <main class="flex-1 p-8 overflow-auto">
        <!-- HOME -->
        <div v-if="currentView === 'home'">
          <h2 class="text-2xl font-bold text-indigo-600 mb-6 text-center">
            TRANG CHỦ - THỐNG KÊ TỔNG QUAN
          </h2>
          <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white p-6 rounded-lg shadow-md">
              <div class="flex items-center">
                <div class="p-3 rounded-full bg-blue-100 text-blue-600">
                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"
                    ></path>
                  </svg>
                </div>
                <div class="ml-4">
                  <p class="text-sm font-medium text-gray-600">Tổng số sinh viên</p>
                  <p class="text-2xl font-semibold text-gray-900">{{ totalStudents }}</p>
                </div>
              </div>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-md">
              <div class="flex items-center">
                <div class="p-3 rounded-full bg-green-100 text-green-600">
                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"
                    ></path>
                  </svg>
                </div>
                <div class="ml-4">
                  <p class="text-sm font-medium text-gray-600">Tổng số giảng viên</p>
                  <p class="text-2xl font-semibold text-gray-900">{{ totalTeachers }}</p>
                </div>
              </div>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-md">
              <div class="flex items-center">
                <div class="p-3 rounded-full bg-purple-100 text-purple-600">
                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
                    ></path>
                  </svg>
                </div>
                <div class="ml-4">
                  <p class="text-sm font-medium text-gray-600">Tổng số đề tài</p>
                  <p class="text-2xl font-semibold text-gray-900">{{ totalTopics }}</p>
                </div>
              </div>
            </div>
          </div>

          <div class="bg-white rounded-lg shadow-md p-6">
            <h3 class="text-lg font-semibold text-gray-900 mb-4">Hoạt động gần đây</h3>
            <div class="space-y-3">
              <div class="flex items-center text-sm text-gray-600">
                <div class="w-2 h-2 bg-green-400 rounded-full mr-3"></div>
                <span>0 sinh viên đã gặp giảng viên hướng dẫn</span>
              </div>
              <div class="flex items-center text-sm text-gray-600">
                <div class="w-2 h-2 bg-yellow-400 rounded-full mr-3"></div>
                <span>0 sinh viên chưa gặp giảng viên hướng dẫn</span>
              </div>
            </div>
          </div>
        </div>

        <!-- QUẢN LÝ GIẢNG VIÊN -->
        <div v-if="currentView === 'teachers'">
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">QUẢN LÝ GIẢNG VIÊN</h2>
            <div class="flex items-center gap-4">
              <input
                v-model="teacherSearch"
                type="text"
                placeholder="Tìm kiếm giảng viên..."
                class="w-80 px-3 py-2 border rounded shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-300"
              />
              <button
                @click="openAddForm"
                class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 transition"
              >
                Thêm
              </button>
              <button class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600 transition">
                Xuất file Excel
              </button>
            </div>
          </div>

          <div class="overflow-x-auto">
            <table class="min-w-full bg-white rounded shadow text-sm divide-y divide-gray-200 text-center">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center">Mã GV</th>
                  <th class="p-3 text-center">Họ và tên</th>
                  <th class="p-3 text-center">Email</th>
                  <th class="p-3 text-center">Số điện thoại</th>
                  <th class="p-3 text-center">Số lượng sinh viên</th>
                  <th class="p-3 text-center">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(teacher, i) in teachers" :key="teacher.id" class="hover:bg-indigo-50">
                  <td class="p-3">{{ teacher.MaGV }}</td>
                  <td class="p-3">{{ teacher.name }}</td>
                  <td class="p-3">{{ teacher.email }}</td>
                  <td class="p-3">{{ teacher.sdt }}</td>
                  <td class="p-3">{{ teacher.So_luong_sinh_vien }}</td>
                  <td class="p-3">
                    <div class="flex gap-2 justify-center">
                      <button
                        @click="openEditForm(teacher)"
                        class="bg-blue-500 text-white px-2 py-1 rounded text-xs hover:bg-blue-600 transition"
                      >
                        Sửa
                      </button>
                      <button
                        @click="deleteItem(teacher.MaGV)"
                        class="bg-red-500 text-white px-2 py-1 rounded text-xs hover:bg-red-600 transition"
                      >
                        Xóa
                      </button>
                    </div>
                  </td>
                </tr>
                <tr v-if="teachers.length === 0">
                  <td class="p-3 italic text-sm text-gray-500" colspan="6">Không có dữ liệu từ database</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- QUẢN LÝ SINH VIÊN -->
        <div v-if="currentView === 'students'">
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">QUẢN LÝ SINH VIÊN</h2>
            <div class="flex items-center gap-4">
              <input
                v-model="studentSearch"
                @input="onStudentSearchInput"
                type="text"
                placeholder="Tìm kiếm sinh viên..."
                class="w-80 px-3 py-2 border rounded shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-300"
              />
              <button
                @click="openAddForm"
                class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 transition"
              >
                Thêm
              </button>
              <button
                @click="exportExcel"
                class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600 transition"
              >
                Xuất file Excel
              </button>
            </div>
          </div>

          <div class="overflow-x-auto">
            <table class="min-w-full bg-white rounded shadow text-sm divide-y divide-gray-200 text-center">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center">MSSV</th>
                  <th class="p-3 text-center">Họ và tên</th>
                  <th class="p-3 text-center">Nhóm</th>
                  <th class="p-3 text-center">Email</th>
                  <th class="p-3 text-center">Số điện thoại</th>
                  <th class="p-3 text-center">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(s, idx) in students"
                  :key="s.mssv || s.id || idx"
                  class="hover:bg-indigo-50"
                >
                  <td class="p-3">{{ s.mssv }}</td>
                  <td class="p-3">{{ s.name }}</td>
                  <td class="p-3">{{ s.group || '-' }}</td>
                  <td class="p-3">{{ s.email || '-' }}</td>
                  <td class="p-3">{{ s.phone || '-' }}</td>
                  <td class="p-3">
                    <div class="flex gap-2 justify-center">
                      <button
                        @click="openEditForm(s)"
                        class="bg-blue-500 text-white px-2 py-1 rounded text-xs hover:bg-blue-600 transition"
                      >
                        Sửa
                      </button>
                      <button
                        @click="deleteItem(s.mssv)"
                        class="bg-red-500 text-white px-2 py-1 rounded text-xs hover:bg-red-600 transition"
                      >
                        Xóa
                      </button>
                    </div>
                  </td>
                </tr>

                <tr v-if="students.length === 0">
                  <td class="p-3 italic text-sm text-gray-500" colspan="6">Không có dữ liệu từ database</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- QUẢN LÝ ĐỀ TÀI -->
        <div v-if="currentView === 'topics'">
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">QUẢN LÝ ĐỀ TÀI</h2>
            <div class="flex items-center gap-4">
              <input
                v-model="topicSearch"
                type="text"
                placeholder="Tìm kiếm đề tài..."
                class="w-80 px-3 py-2 border rounded shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-300"
              />
              <button
                @click="openAddForm"
                class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 transition"
              >
                Thêm
              </button>
              <button class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600 transition">
                Xuất file Excel
              </button>
            </div>
          </div>

          <div class="overflow-x-auto">
            <table class="min-w-full bg-white rounded shadow text-sm divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center">Mã đề tài</th>
                  <th class="p-3 text-center">Tên đề tài</th>
                  <th class="p-3 text-center">Giảng viên</th>
                  <th class="p-3 text-center">Trạng thái</th>
                  <th class="p-3 text-center">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(topic, i) in topics"
                  :key="topic.MaDT"
                  class="hover:bg-indigo-50"
                >
                  <td class="p-3 text-center">{{ topic.MaDT }}</td>
                  <td class="p-3 text-center">{{ topic.TenDeTai }}</td>
                  <td class="p-3 text-center">{{ topic.GiangVien }}</td>
                  <td class="p-3 text-center">
                    <span
                      :class="{
                        'bg-green-100 text-green-700 px-2 py-1 rounded-full text-xs font-semibold':
                          topic.status === 'Chờ sinh viên chọn',
                        'bg-yellow-100 text-yellow-700 px-2 py-1 rounded-full text-xs font-semibold':
                          topic.status === 'Đã được chọn',
                        'bg-red-100 text-red-700 px-2 py-1 rounded-full text-xs font-semibold':
                          topic.status === 'Đã khóa'
                      }"
                    >
                      {{ topic.TrangThai }}
                    </span>
                  </td>
                  <td class="p-3">
                    <div class="flex gap-2 justify-center">
                      <button
                        @click="openEditForm(topic)"
                        class="bg-blue-500 text-white px-2 py-1 rounded text-xs hover:bg-blue-600 transition"
                      >
                        Sửa
                      </button>
                      <button
                        @click="deleteItem(topic.MaDT)"
                        class="bg-red-500 text-white px-2 py-1 rounded text-xs hover:bg-red-600 transition"
                      >
                        Xóa
                      </button>
                    </div>
                  </td>
                </tr>
                <tr v-if="topics.length === 0">
                  <td class="p-3 italic text-sm text-gray-500" colspan="6">Không có dữ liệu từ database</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- FORM MODAL (GV/SV/Đề tài/Bảng phân công) -->
        <div
          v-if="showForm"
          class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50"
        >
          <div
            class="bg-white rounded-lg p-6 w-full max-w-2xl mx-4 max-h-[90vh] overflow-y-auto"
          >
            <div class="flex justify-between items-center mb-4">
              <h3 class="text-xl font-bold text-indigo-600">
                {{ formMode === 'add' ? 'THÊM MỚI' : 'CHỈNH SỬA' }} {{ getFormTitle() }}
              </h3>
              <button @click="closeForm" class="text-gray-500 hover:text-gray-700">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M6 18L18 6M6 6l12 12"
                  ></path>
                </svg>
              </button>
            </div>

            <div class="space-y-4">
              <!-- Assignment Form -->
              <div v-if="currentView === 'assignments'">
                <div class="grid grid-cols-2 gap-4">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">MSSV</label>
                    <input
                      v-model="formData.mssv"
                      type="text"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập MSSV"
                    />
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Họ và tên</label>
                    <input
                      v-model="formData.name"
                      type="text"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập họ và tên"
                    />
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Nhóm</label>
                    <input
                      v-model="formData.group"
                      type="text"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập nhóm"
                    />
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Đề tài LVTN</label>
                    <input
                      v-model="formData.topic"
                      type="text"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập đề tài"
                    />
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Giảng viên HD</label>
                    <input
                      v-model="formData.lecturer"
                      type="text"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập tên giảng viên"
                    />
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Trạng thái</label>
                    <select
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                    >
                      <option value="Chưa gặp">Chưa gặp</option>
                      <option value="Đã gặp">Đã gặp</option>
                    </select>
                  </div>
                </div>
                <div class="mt-4">
                  <label class="block text-sm font-medium text-gray-700 mb-1">Ghi chú</label>
                  <textarea
                    class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                    rows="3"
                    placeholder="Nhập ghi chú"
                  ></textarea>
                </div>
              </div>

              <!-- Teacher Form -->
              <div v-if="currentView === 'teachers'">
                <div class="grid grid-cols-2 gap-4">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Họ và tên</label>
                    <input
                      v-model="formData.teacher.name"
                      type="text"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập họ và tên"
                    />
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                    <input
                      v-model="formData.teacher.email"
                      type="email"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập email"
                    />
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Số điện thoại</label>
                    <input
                      v-model="formData.teacher.sdt"
                      type="tel"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập số điện thoại"
                    />
                  </div>
                </div>
              </div>

              <!-- Student Form -->
              <div v-if="currentView === 'students'">
                <div class="grid grid-cols-2 gap-4">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">MSSV</label>
                    <input
                      :disabled="formMode !== 'add'"
                      v-model="formData.student.MSSV"
                      type="text"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập MSSV"
                    />
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Họ và tên</label>
                    <input
                      v-model="formData.student.Ho_va_Ten"
                      type="text"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập họ và tên"
                    />
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Nhóm</label>
                    <input
                      v-model="formData.student.Nhom"
                      type="text"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập nhóm"
                    />
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                    <input
                      v-model="formData.student.email"
                      type="email"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập email"
                    />
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Số điện thoại</label>
                    <input
                      v-model="formData.student.sdt"
                      type="tel"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập số điện thoại"
                    />
                  </div>
                </div>
              </div>

              <!-- Topic Form -->
              <div v-if="currentView === 'topics'">
                <div class="grid grid-cols-2 gap-4">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Mã đề tài</label>
                    <input
                      :disabled="formMode !== 'add'"
                      v-model="formData.topic.MaDT"
                      type="text"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập mã đề tài"
                    />
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Tên đề tài</label>
                    <input
                      v-model="formData.topic.TenDeTai"
                      type="text"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                      placeholder="Nhập tên đề tài"
                    />
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Giảng viên</label>
                    <select
                      v-model="formData.topic.MaGV"
                      class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300"
                    >
                      <option value="">-- Chọn giảng viên --</option>
                      <option
                        v-for="teacher in teachers"
                        :key="teacher.MaGV"
                        :value="teacher.MaGV"
                      >
                        {{ teacher.name }}
                      </option>
                    </select>
                  </div>
                </div>
              </div>
            </div>

            <div class="flex justify-end gap-3 mt-6 pt-4 border-t">
              <button
                @click="closeForm"
                class="px-4 py-2 border border-gray-300 rounded hover:bg-gray-50 transition"
              >
                Hủy
              </button>
              <button
                @click="formMode === 'add' ? addItem() : updateItem()"
                class="px-4 py-2 bg-indigo-500 text-white rounded hover:bg-indigo-600 transition"
              >
                {{ formMode === 'add' ? 'Thêm' : 'Cập nhật' }}
              </button>
            </div>
          </div>
        </div>

        <!-- BẢNG PHÂN CÔNG -->
        <div v-if="currentView === 'assignments'">
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">BẢNG PHÂN CÔNG LUẬN VĂN</h2>
            <div class="flex items-center gap-4">
              <input
                v-model="assignmentSearch"
                type="text"
                placeholder="Tìm kiếm theo MSSV / tên / đề tài..."
                class="w-80 px-3 py-2 border rounded shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-300"
              />

              <button
                @click="$refs.excelInput.click()"
                class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 transition"
              >
                Import
              </button>

              <input
                ref="excelInput"
                type="file"
                accept=".xlsx,.xls"
                class="hidden"
                @change="handleExcelImport"
              />

              <button
                class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600 transition"
                @click="exportExcel"
              >
                Xuất file Excel
              </button>
            </div>
          </div>

          <div class="overflow-x-auto">
            <table class="min-w-full bg-white rounded shadow text-sm divide-y divide-gray-200 text-center">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center min-w-[90px]">MSSV</th>
                  <th class="p-3 text-center min-w-[150px]">Họ và tên SV</th>
                  <th class="p-3 text-center min-w-[70px]">Nhóm</th>
                  <th class="p-3 text-center min-w-[260px]">Đề tài LVTN</th>
                  <th class="p-3 text-center min-w-[200px]">Giảng viên HD</th>
                  <th class="p-3 text-center min-w-[120px]">Ghi chú</th>
                  <th class="p-3 text-center min-w-[120px]">Thao tác</th>
                </tr>
              </thead>

              <tbody>
                <tr
                  v-for="(item, i) in assignments"
                  :key="i"
                  class="hover:bg-indigo-50"
                >
                  <td class="p-3">{{ item.mssv }}</td>
                  <td class="p-3">{{ item.name }}</td>
                  <td class="p-3">{{ item.group }}</td>
                  <td class="p-3">{{ item.topic }}</td>
                  <td class="p-3">{{ item.lecturer }}</td>
                  <td class="p-3 text-gray-600 italic">{{ item.note }}</td>

                  <td class="p-3">
                    <div class="flex gap-2 justify-center">
                      <button
                        @click="openAssignPanel(item)"
                        class="bg-blue-500 text-white px-2 py-1 rounded text-xs hover:bg-blue-600 transition"
                      >
                        Phân công
                      </button>

                      <button
                        class="bg-red-500 text-white px-2 py-1 rounded text-xs hover:bg-red-600 transition"
                      >
                        Xóa
                      </button>
                    </div>
                  </td>
                </tr>

                <tr v-if="assignments.length === 0">
                  <td class="p-3 italic text-sm text-gray-500" colspan="8">
                    Không có dữ liệu từ database
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Modal: danh sách giảng viên -->
        <div
          v-if="showAssignModal"
          class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-40"
        >
          <div class="bg-white rounded-lg w-[95%] max-w-3xl p-4 max-h-[90vh] overflow-auto">
            <div class="flex justify-between items-center mb-4">
              <h3 class="text-lg font-semibold">Danh sách giảng viên</h3>
              <button
                @click="closeAssignPanel"
                class="bg-sky-500 text-white px-3 py-1 rounded text-sm hover:bg-sky-600 transition"
              >
                Đóng
              </button>
            </div>

            <div class="overflow-x-auto">
              <table class="min-w-full text-sm divide-y divide-gray-200">
                <thead class="bg-indigo-100 text-indigo-700">
                  <tr>
                    <th class="p-3 text-left">STT</th>
                    <th class="p-3 text-left">MSGV</th>
                    <th class="p-3 text-left">Họ và tên giảng viên</th>
                    <th class="p-3 text-left">Số lượng sinh viên</th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(gv, idx) in teachers"
                    :key="gv.MaGV || gv.id || idx"
                    class="hover:bg-indigo-50"
                  >
                    <td class="p-3">{{ idx + 1 }}</td>
                    <td class="p-3">{{ gv.MaGV ?? gv.id ?? '-' }}</td>
                    <td class="p-3 flex items-center justify-between">
                      <span>{{ gv.name ?? gv.HoTen ?? '-' }}</span>
                      <button
                        @click="openStudentModal(gv)"
                        class="ml-2 text-indigo-600 hover:text-indigo-800 text-lg"
                      >
                        ▶
                      </button>
                    </td>
                    <td class="p-3">{{ countAssignedTo(gv) }}</td>
                  </tr>
                  <tr v-if="teachers.length === 0">
                    <td class="p-3 italic text-sm text-gray-500" colspan="4">Không có giảng viên</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- Modal: danh sách sinh viên của giảng viên -->
        <div
          v-if="showStudentModal"
          class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-40"
        >
          <div class="bg-white rounded-lg w-[95%] max-w-3xl p-4 max-h-[90vh] overflow-auto">
            <div class="flex justify-between items-center mb-4">
              <h3 class="text-lg font-semibold text-indigo-700">
                Danh sách sinh viên của giảng viên:
                {{ selectedLecturer.name ?? selectedLecturer.HoTen ?? '-' }}
              </h3>
              <div class="flex gap-2">
                <button
                  @click="confirmAllAssignments(selectedLecturer)"
                  class="bg-green-500 text-white px-3 py-1 rounded text-sm hover:bg-green-600 transition"
                >
                  Xác nhận
                </button>
                <button
                  @click="closeStudentModal"
                  class="bg-sky-500 text-white px-3 py-1 rounded text-sm hover:bg-sky-600 transition"
                >
                  Đóng
                </button>
              </div>
            </div>
            <table class="min-w-full text-sm divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-left">MSSV</th>
                  <th class="p-3 text-left">Họ và tên SV</th>
                  <th class="p-3 text-left">Nhóm</th>
                  <th class="p-3 text-left">Đề tài</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="sv in studentsAssignedTo(selectedLecturer)"
                  :key="sv.mssv"
                  class="hover:bg-indigo-50"
                >
                  <td class="p-3">{{ sv.mssv }}</td>
                  <td class="p-3">{{ sv.name }}</td>
                  <td class="p-3">{{ sv.group }}</td>
                  <td class="p-3">{{ sv.topic }}</td>
                </tr>
                <tr v-if="studentsAssignedTo(selectedLecturer).length === 0">
                  <td colspan="4" class="p-3 italic text-sm text-gray-500">
                    Không có sinh viên được phân công
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- ĐÁNH GIÁ 50% -->
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
                Xuất file Excel
              </button>
            </div>
          </div>
          <div class="overflow-x-auto bg-white rounded shadow">
            <table class="min-w-full text-sm divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center">STT</th>
                  <th class="p-3 text-center">MSSV</th>
                  <th class="p-3 text-center">Họ và tên</th>
                  <th class="p-3 text-center">Giảng viên hướng dẫn</th>
                  <th class="p-3 text-center">Điểm</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(s, idx) in students"
                  :key="s.mssv || s.id || idx"
                  class="hover:bg-indigo-50"
                >
                  <td class="p-3 text-center">{{ idx + 1 }}</td>
                  <td class="p-3 text-center">{{ s.mssv || '-' }}</td>
                  <td class="p-3 text-center">{{ s.name || '-' }}</td>
                  <td class="p-3 text-center">{{ s.lecturer || '-' }}</td>
                  <td class="p-3 text-center">{{ s.score || '-' }}</td>
                </tr>
                <tr v-if="topics.length === 0">
                  <td colspan="8" class="p-4 text-center text-gray-500">
                    Không có đề tài để phân công phản biện
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- PHÂN CÔNG PHẢN BIỆN -->
        <div v-if="currentView === 'reviewAssignment'">
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">PHÂN CÔNG PHẢN BIỆN</h2>
            <div class="flex items-center gap-4">
              <input
                v-model="reviewSearch"
                type="text"
                placeholder="Tìm kiếm theo đề tài..."
                class="w-80 px-3 py-2 border rounded shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-300"
              />
              <button class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600 transition">
                Xuất file Excel
              </button>
            </div>
          </div>

          <div class="overflow-x-auto bg-white rounded shadow">
            <table class="min-w-full text-sm divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center">STT</th>
                  <th class="p-3 text-center">Mã đề tài</th>
                  <th class="p-3 text-center">Tên đề tài</th>
                  <th class="p-3 text-center">MSSV</th>
                  <th class="p-3 text-center">Họ và tên sinh viên</th>
                  <th class="p-3 text-center">Giảng viên phản biện</th>
                  <th class="p-3 text-center">Ghi chú</th>
                  <th class="p-3 text-center">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(row, idx) in reviewAssignmentRows"
                  :key="(row.topic.MaDT || row.topic.id || 't') + '-' + idx"
                  @mouseenter="hoverStt = row.stt"
                  @mouseleave="hoverStt = null"
                  :class="hoverStt === row.stt ? 'bg-indigo-50' : ''"
                >
                  <!-- STT -->
                  <td
                    v-if="row.isFirst"
                    class="p-3 text-center"
                    :rowspan="row.rowSpan"
                  >
                    {{ row.stt }}
                  </td>

                  <!-- Mã đề tài -->
                  <td
                    v-if="row.isFirst"
                    class="p-3 text-center"
                    :rowspan="row.rowSpan"
                  >
                    {{ row.topic.MaDT || '-' }}
                  </td>

                  <!-- Tên đề tài -->
                  <td
                    v-if="row.isFirst"
                    class="p-3 text-center"
                    :rowspan="row.rowSpan"
                  >
                    {{ row.topic.TenDeTai || row.topic.title || '-' }}
                  </td>

                  <!-- MSSV từng sinh viên -->
                  <td class="p-3 text-center">
                    {{ row.mssv || '-' }}
                  </td>

                  <!-- Họ tên từng sinh viên -->
                  <td class="p-3 text-center">
                    {{ row.name || '-' }}
                  </td>

                  <!-- GV phản biện -->
                  <td
                    v-if="row.isFirst"
                    class="p-3 text-center"
                    :rowspan="row.rowSpan"
                  >
                    {{ row.topic.GiangVienPhanBien || row.topic.reviewerName || '-' }}
                  </td>

                  <!-- Ghi chú -->
                  <td
                    v-if="row.isFirst"
                    class="p-3 text-center"
                    :rowspan="row.rowSpan"
                  >
                    {{ row.topic.reviewNote || '-' }}
                  </td>

                  <!-- Thao tác -->
                  <td
                    v-if="row.isFirst"
                    class="p-3 text-center"
                    :rowspan="row.rowSpan"
                  >
                    <div class="flex gap-2 justify-center">
                      <button
                        @click="openReviewerList(row.topic)"
                        class="bg-blue-500 text-white px-2 py-1 rounded text-xs hover:bg-blue-600 transition"
                      >
                        Phân công
                      </button>
                      <button
                        class="bg-red-500 text-white px-2 py-1 rounded text-xs hover:bg-red-600 transition"
                      >
                        Xóa
                      </button>
                    </div>
                  </td>
                </tr>

                <tr v-if="reviewAssignmentRows.length === 0">
                  <td colspan="8" class="p-4 text-center text-gray-500">
                    Không có đề tài để phân công phản biện
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Modal: danh sách phản biện viên -->
        <div
          v-if="showReviewerModal"
          class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-40"
        >
          <div class="bg-white rounded-lg w-[95%] max-w-3xl p-4 max-h-[90vh] overflow-auto">
            <div class="flex justify-between items-center mb-4">
              <h3 class="text-lg font-semibold">
                Danh sách giảng viên phản biện cho: {{ selectedTopic?.TenDeTai || '-' }}
              </h3>
              <button
                @click="closeReviewerModal"
                type="button"
                class="bg-sky-500 text-white px-3 py-1 rounded text-sm hover:bg-sky-600 transition"
              >
                Đóng
              </button>
            </div>

            <div class="overflow-x-auto">
              <table class="min-w-full text-sm divide-y divide-gray-200">
                <thead class="bg-indigo-100 text-indigo-700">
                  <tr>
                    <th class="p-3 text-left">STT</th>
                    <th class="p-3 text-left">MSGV</th>
                    <th class="p-3 text-left">Họ và tên phản biện</th>
                    <th class="p-3 text-left">Số đề tài đã phân công</th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(gv, idx) in availableReviewers"
                    :key="gv.MaGV || idx"
                    class="hover:bg-indigo-50"
                  >
                    <td class="p-3">{{ idx + 1 }}</td>
                    <td class="p-3">{{ gv.MaGV ?? gv.id ?? '-' }}</td>
                    <td class="p-3 flex items-center justify-between">
                      <span>{{ gv.name ?? gv.HoTen ?? '-' }}</span>
                      <button
                        @click="openReviewerTopicList(gv)"
                        class="ml-2 text-indigo-600 hover:text-indigo-800 text-lg"
                      >
                        ▶
                      </button>
                    </td>
                    <td class="p-3">{{ countReviewAssigned(gv) }}</td>
                  </tr>
                  <tr v-if="availableReviewers.length === 0">
                    <td colspan="4" class="p-3 italic text-sm text-gray-500">
                      Không có phản biện viên
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- Modal: danh sách đề tài của phản biện viên -->
        <div
          v-if="showReviewTopicModal"
          class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-40"
        >
          <div class="bg-white rounded-lg w-[95%] max-w-3xl p-4 max-h-[90vh] overflow-auto">
            <div class="flex justify-between items-center mb-4">
              <h3 class="text-lg font-semibold text-indigo-700">
                Danh sách đề tài của giảng viên
                {{ selectedReviewer?.name ?? selectedReviewer?.HoTen ?? '-' }} phản biện
              </h3>
              <div class="flex gap-2">
                <button
                  @click="confirmReviewAssignment(selectedReviewer)"
                  type="button"
                  class="bg-green-500 text-white px-3 py-1 rounded text-sm hover:bg-green-600 transition"
                >
                  Xác nhận
                </button>
                <button
                  @click="closeReviewerTopicList"
                  class="bg-sky-500 text-white px-3 py-1 rounded text-sm hover:bg-sky-600 transition"
                >
                  Đóng
                </button>
              </div>
            </div>

            <table class="min-w-full text-sm divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-left">Mã đề tài</th>
                  <th class="p-3 text-left">Tên đề tài</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="t in reviewTopicsAssignedTo(selectedReviewer)"
                  :key="t.MaDT"
                  class="hover:bg-indigo-50"
                >
                  <td class="p-3">{{ t.MaDT }}</td>
                  <td class="p-3">{{ t.TenDeTai }}</td>
                </tr>
                <tr v-if="reviewTopicsAssignedTo(selectedReviewer).length === 0">
                  <td colspan="2" class="p-3 italic text-sm text-gray-500">
                    Không có đề tài được phân công
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- THÀNH LẬP HỘI ĐỒNG -->
        <div v-if="currentView === 'committee'">
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">THÀNH LẬP HỘI ĐỒNG</h2>
            <button
              @click="openCommitteeAddForm"
              class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 transition"
            >
              Thêm hội đồng
            </button>
          </div>

          <div class="bg-white rounded shadow overflow-x-auto">
            <table class="min-w-full text-sm divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center w-16">STT</th>
                  <th class="p-3 text-center min-w-[180px]">Ngày giờ bắt đầu</th>
                  <th class="p-3 text-center min-w-[180px]">Ngày giờ kết thúc</th>
                  <th class="p-3 text-center min-w-[180px]">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr v-if="committees.length === 0">
                  <td colspan="4" class="p-4 text-center text-gray-500">
                    Chưa có hội đồng nào
                  </td>
                </tr>
                <tr
                  v-for="(c, idx) in committees"
                  :key="c.id || idx"
                  class="hover:bg-indigo-50"
                >
                  <td class="p-3 text-center">{{ idx + 1 }}</td>
                  <td class="p-3 text-center">
                    {{ c.start ? formatDateTime(c.start) : '-' }}
                  </td>
                  <td class="p-3 text-center">
                    {{ c.end ? formatDateTime(c.end) : '-' }}
                  </td>
                  <td class="p-3 text-center">
                    <div class="flex items-center justify-center gap-2">
                      <button
                        @click="openCommitteeDetail(c)"
                        class="bg-indigo-500 text-white px-3 py-1 rounded text-xs hover:bg-indigo-600 transition"
                      >
                        Chi tiết
                      </button>
                      <button
                        @click="openCommitteeEditForm(c)"
                        class="bg-blue-500 text-white px-3 py-1 rounded text-xs hover:bg-blue-600 transition"
                      >
                        Sửa
                      </button>
                      <button
                        @click="deleteCommittee(c)"
                        class="bg-red-500 text-white px-3 py-1 rounded text-xs hover:bg-red-600 transition"
                      >
                        Xóa
                      </button>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Modal: Form thêm/sửa hội đồng -->
        <div
          v-if="showCommitteeForm"
          class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-40"
        >
          <div class="bg-white rounded-lg w-[95%] max-w-3xl p-6 max-h-[90vh] overflow-auto">
            <div class="flex justify-between items-center mb-4">
              <h3 class="text-lg font-semibold text-indigo-700">
                {{ committeeFormMode === 'add' ? 'Thêm hội đồng' : 'Sửa hội đồng' }}
              </h3>
              <button
                @click="closeCommitteeForm"
                class="bg-sky-500 text-white px-3 py-1 rounded text-sm hover:bg-sky-600 transition"
              >
                Đóng
              </button>
            </div>

            <!-- 4 dòng GV + chức vụ -->
            <div class="border rounded p-4 mb-4">
              <div
                v-for="(row, index) in committeeForm.members"
                :key="index"
                class="grid grid-cols-1 md:grid-cols-2 gap-4 items-center mb-3"
              >
                <div>
                  <label class="block text-sm font-medium mb-1">
                    Giảng viên {{ index + 1 }}
                  </label>
                  <select
                    v-model="committeeForm.members[index].teacherId"
                    class="w-full border rounded px-3 py-2 text-sm"
                  >
                    <option value="">-- Chọn giảng viên --</option>
                    <option
                      v-for="t in availableTeachersForRow(index)"
                      :key="getTeacherId(t)"
                      :value="getTeacherId(t)"
                    >
                      {{ t.name ?? t.HoTen ?? t.Ho_va_Ten ?? getTeacherId(t) }}
                    </option>
                  </select>
                </div>

                <div>
                  <label class="block text-sm font-medium mb-1">
                    Chức vụ
                  </label>
                  <select
                    v-model="committeeForm.members[index].position"
                    class="w-full border rounded px-3 py-2 text-sm"
                  >
                    <option value="">-- Chọn chức vụ --</option>
                    <option
                      v-for="pos in availablePositionsForRow(index)"
                      :key="pos.value"
                      :value="pos.value"
                    >
                      {{ pos.label }}
                    </option>
                  </select>
                </div>
              </div>
            </div>

            <!-- Thời gian bắt đầu / kết thúc -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
              <div>
                <label class="block text-sm font-medium mb-1">
                  Ngày giờ bắt đầu
                </label>
                <input
                  type="datetime-local"
                  v-model="committeeForm.start"
                  class="w-full border rounded px-3 py-2 text-sm"
                />
              </div>
              <div>
                <label class="block text-sm font-medium mb-1">
                  Ngày giờ kết thúc
                </label>
                <input
                  type="datetime-local"
                  v-model="committeeForm.end"
                  class="w-full border rounded px-3 py-2 text-sm"
                />
              </div>
            </div>

            <div class="flex justify-end gap-2 mt-2">
              <button
                @click="submitCommitteeForm"
                class="bg-green-500 text-white px-4 py-2 rounded text-sm hover:bg-green-600 transition"
              >
                {{ committeeFormMode === 'add' ? 'Xác nhận thêm' : 'Xác nhận sửa' }}
              </button>
            </div>
          </div>
        </div>

        <!-- Modal: Chi tiết hội đồng -->
        <div
          v-if="showCommitteeDetailModal"
          class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-40"
        >
          <div class="bg-white rounded-lg w-[95%] max-w-3xl p-6 max-h-[90vh] overflow-auto">
            <div class="flex justify-between items-center mb-4">
              <h3 class="text-lg font-semibold text-indigo-700">Chi tiết hội đồng</h3>
              <button
                @click="showCommitteeDetailModal = false"
                class="bg-sky-500 text-white px-3 py-1 rounded text-sm hover:bg-sky-600 transition"
              >
                Đóng
              </button>
            </div>

            <div class="mb-4">
              <p class="text-sm">
                <span class="font-medium">Thời gian bắt đầu:</span>
                <span class="ml-1">
                  {{ selectedCommittee?.start ? formatDateTime(selectedCommittee.start) : '-' }}
                </span>
              </p>
              <p class="text-sm">
                <span class="font-medium">Thời gian kết thúc:</span>
                <span class="ml-1">
                  {{ selectedCommittee?.end ? formatDateTime(selectedCommittee.end) : '-' }}
                </span>
              </p>
            </div>

            <div class="border rounded p-4">
              <h4 class="font-semibold text-sm mb-3">Danh sách giảng viên trong hội đồng</h4>
              <table class="min-w-full text-sm divide-y divide-gray-200">
                <thead class="bg-gray-100 text-gray-700">
                  <tr>
                    <th class="p-2 text-left">STT</th>
                    <th class="p-2 text-left">Giảng viên</th>
                    <th class="p-2 text-left">Chức vụ</th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(m, idx) in (selectedCommittee?.members || [])"
                    :key="idx"
                  >
                    <td class="p-2">{{ idx + 1 }}</td>
                    <td class="p-2">
                      {{ m.teacherName || getTeacherNameById(m.teacherId) || m.teacherId }}
                    </td>
                    <td class="p-2">
                      {{ positionLabel(m.position) }}
                    </td>
                  </tr>
                  <tr v-if="!selectedCommittee || (selectedCommittee.members || []).length === 0">
                    <td colspan="3" class="p-2 text-center text-gray-500">
                      Không có giảng viên trong hội đồng
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- Các view khác (grading / committeeAssignment) để trống -->
        <div v-if="currentView === 'grading'"></div>
        <div v-if="currentView === 'committeeAssignment'"></div>

        <!-- PHÂN BỔ THỜI GIAN -->
        <div v-if="currentView === 'timeAllocation'">
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">PHÂN BỔ THỜI GIAN</h2>
            <div class="flex items-center gap-4">
              <button
                @click="showAddTimeModal = true"
                class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600 transition"
              >
                Thêm sự kiện
              </button>
            </div>
          </div>
          <div class="bg-white rounded shadow overflow-x-auto">
            <table class="min-w-full text-sm divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center min-w-[90px]">Sự kiện</th>
                  <th class="p-3 text-center min-w-[150px]">Ngày bắt đầu</th>
                  <th class="p-3 text-center min-w-[70px]">Ngày kết thúc</th>
                  <th class="p-3 text-center min-w-[70px]">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr v-if="timeAllocations.length === 0">
                  <td colspan="4" class="p-4 text-center text-gray-500">
                    Chưa có dữ liệu phân bổ thời gian
                  </td>
                </tr>
                <tr v-for="(item, index) in timeAllocations" :key="index">
                  <td class="p-3 text-center">{{ item.TenSuKien }}</td>
                  <td class="p-3 text-center">{{ formatDateTime(item.NgayBatDau) }}</td>
                  <td class="p-3 text-center">{{ formatDateTime(item.NgayKetThuc) }}</td>
                  <td class="p-3 text-center">
                    <div class="flex gap-2 justify-center">
                      <button
                        @click="openTimeEditForm(item)"
                        class="bg-blue-500 text-white px-2 py-1 rounded text-xs hover:bg-blue-600 transition"
                      >
                        Sửa
                      </button>
                      <button
                        @click="deleteEvent(item.id)"
                        class="bg-red-500 text-white px-2 py-1 rounded text-xs hover:bg-red-600 transition"
                      >
                        Xóa
                      </button>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Modal: Edit Event -->
        <div
          v-if="showEditModal"
          class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-40"
        >
          <div class="bg-white rounded-lg w-[95%] max-w-md p-4 max-h-[90vh] overflow-auto">
            <div class="flex justify-between items-center mb-4">
              <h3 class="text-lg font-semibold text-indigo-700">Sửa sự kiện</h3>
              <button
                @click="showEditModal = false"
                class="bg-sky-500 text-white px-3 py-1 rounded text-sm hover:bg-sky-600 transition"
              >
                Đóng
              </button>
            </div>

            <div class="flex flex-col gap-3">
              <div>
                <label class="block text-sm font-medium mb-1">Tên sự kiện</label>
                <input
                  type="text"
                  v-model="editEvent.TenSuKien"
                  class="border p-2 rounded w-full"
                />
              </div>

              <div>
                <label class="block text-sm font-medium mb-1">Ngày bắt đầu</label>
                <input
                  type="datetime-local"
                  v-model="editEvent.NgayBatDau"
                  class="border p-2 rounded w-full"
                />
              </div>

              <div>
                <label class="block text-sm font-medium mb-1">Ngày kết thúc</label>
                <input
                  type="datetime-local"
                  v-model="editEvent.NgayKetThuc"
                  class="border p-2 rounded w-full"
                />
              </div>

              <div class="flex justify-end gap-2 mt-2">
                <button
                  @click="saveEdit()"
                  class="bg-green-500 text-white px-3 py-1 rounded text-sm hover:bg-green-600 transition"
                >
                  Lưu
                </button>
                <button
                  @click="showEditModal = false"
                  class="bg-gray-300 text-gray-700 px-3 py-1 rounded text-sm hover:bg-gray-400 transition"
                >
                  Hủy
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- Modal: Add Time Allocation -->
        <div
          v-if="showAddTimeModal"
          class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-40"
        >
          <div class="bg-white rounded-lg w-[95%] max-w-md p-4 max-h-[90vh] overflow-auto">
            <div class="flex justify-between items-center mb-4">
              <h3 class="text-lg font-semibold text-indigo-700">Thêm sự kiện mới</h3>
              <button
                @click="showAddTimeModal = false"
                class="bg-sky-500 text-white px-3 py-1 rounded text-sm hover:bg-sky-600 transition"
              >
                Đóng
              </button>
            </div>

            <div class="flex flex-col gap-3">
              <div>
                <label class="block text-sm font-medium mb-1">Tên sự kiện</label>
                <input
                  type="text"
                  v-model="newEvent.TenSuKien"
                  class="border p-2 rounded w-full"
                />
              </div>

              <div>
                <label class="block text-sm font-medium mb-1">Ngày bắt đầu</label>
                <input
                  type="datetime-local"
                  v-model="newEvent.NgayBatDau"
                  class="border p-2 rounded w-full"
                />
              </div>

              <div>
                <label class="block text-sm font-medium mb-1">Ngày kết thúc</label>
                <input
                  type="datetime-local"
                  v-model="newEvent.NgayKetThuc"
                  class="border p-2 rounded w-full"
                />
              </div>

              <div class="flex justify-end gap-2 mt-2">
                <button
                  @click="addEvent()"
                  class="bg-green-500 text-white px-3 py-1 rounded text-sm hover:bg-green-600 transition"
                >
                  Lưu
                </button>
                <button
                  @click="showAddTimeModal = false"
                  class="bg-gray-300 text-gray-700 px-3 py-1 rounded text-sm hover:bg-gray-400 transition"
                >
                  Hủy
                </button>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref, computed } from 'vue'
import { router } from '@inertiajs/vue3'
import axios from 'axios'

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

const pageProps = defineProps({
  user: { type: Object, default: () => ({ name: 'User' }) },
  students: { type: Array, default: () => [] }
})
const user = pageProps.user

axios.defaults.withCredentials = true
axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest'

/** ========================== */
/**  CONSTANTS - CHỨC VỤ HĐ   */
/** ========================== */
const POSITION_OPTIONS = [
  { value: 'chu_tich', label: 'Chủ tịch hội đồng', unique: true },
  { value: 'thu_ky', label: 'Thư ký', unique: true },
  { value: 'uy_vien', label: 'Ủy viên', unique: false } // cái "t3" có thể trùng
]

/** ========================== */
/**  THỜI GIAN (PHÂN BỔ)      */
/** ========================== */
const timeAllocations = ref([])

const showAddTimeModal = ref(false)
const newEvent = ref({
  TenSuKien: '',
  NgayBatDau: '',
  NgayKetThuc: ''
})

const showEditModal = ref(false)
const editEvent = ref({
  id: null,
  TenSuKien: '',
  NgayBatDau: '',
  NgayKetThuc: ''
})

const formatDateTime = dateString => {
  if (!dateString) return ''
  const date = new Date(
    typeof dateString === 'string' ? dateString.replace(' ', 'T') : dateString
  )

  if (Number.isNaN(date.getTime())) return ''

  const dd = String(date.getDate()).padStart(2, '0')
  const MM = String(date.getMonth() + 1).padStart(2, '0')
  const yyyy = date.getFullYear()

  const hh = String(date.getHours()).padStart(2, '0')
  const mm = String(date.getMinutes()).padStart(2, '0')
  const ss = String(date.getSeconds()).padStart(2, '0')

  return `${dd}/${MM}/${yyyy} ${hh}:${mm}:${ss}`
}

const loadTimeAllocations = async () => {
  try {
    const response = await axios.get('/thoi-gian')
    timeAllocations.value = response.data
  } catch (error) {
    console.error('Failed to load time allocations:', error)
  }
}

const addEvent = async () => {
  if (!newEvent.value.TenSuKien || !newEvent.value.NgayBatDau || !newEvent.value.NgayKetThuc) {
    alert('Vui lòng nhập đầy đủ thông tin!')
    return
  }

  try {
    await axios.post('/thoi-gian', newEvent.value)
    newEvent.value = { TenSuKien: '', NgayBatDau: '', NgayKetThuc: '' }
    showAddTimeModal.value = false
    await loadTimeAllocations()
  } catch (error) {
    console.error('Failed to add event:', error)
  }
}

const openTimeEditForm = item => {
  editEvent.value = { ...item }
  showEditModal.value = true
}

const saveEdit = async () => {
  if (!editEvent.value.TenSuKien || !editEvent.value.NgayBatDau || !editEvent.value.NgayKetThuc) {
    alert('Vui lòng nhập đầy đủ thông tin!')
    return
  }

  try {
    await axios.put(`/thoi-gian/${editEvent.value.id}`, {
      TenSuKien: editEvent.value.TenSuKien,
      NgayBatDau: editEvent.value.NgayBatDau,
      NgayKetThuc: editEvent.value.NgayKetThuc
    })
    showEditModal.value = false
    await loadTimeAllocations()
  } catch (error) {
    console.error('Failed to save event:', error)
  }
}

const deleteEvent = async id => {
  if (!confirm('Bạn có chắc muốn xóa sự kiện này?')) return

  try {
    await axios.delete(`/thoi-gian/${id}`)
    await loadTimeAllocations()
  } catch (error) {
    console.error('Failed to delete event:', error)
  }
}

/** ========================== */
/**  VIEW STATE                */
/** ========================== */
const currentView = ref('home')
function setCurrentView(view) {
  currentView.value = view
}

/** ========================== */
/**  FORM GV/SV/ĐỀ TÀI         */
/** ========================== */
const showForm = ref(false)
const formMode = ref('add')

const formData = ref({
  teacher: {
    name: '',
    email: '',
    sdt: ''
  },
  student: {
    MSSV: '',
    Ho_va_Ten: '',
    email: '',
    sdt: '',
    Nhom: ''
  },
  topic: {
    MaDT: '',
    TenDeTai: '',
    MaGV: '',
    So_luong: 1
  }
})

let editingId = ref(null)

function openAddForm() {
  formMode.value = 'add'
  editingId.value = null
  if (currentView.value === 'teachers') {
    formData.value.teacher = { name: '', email: '', sdt: '' }
  } else if (currentView.value === 'students') {
    formData.value.student = { MSSV: '', Ho_va_Ten: '', email: '', sdt: '', Nhom: '' }
  } else if (currentView.value === 'topics') {
    formData.value.topic = { MaDT: '', TenDeTai: '', MaGV: '' }
  }
  showForm.value = true
}

function groupIsFull(group) {
  return students.value.filter(s => s.group == group).length >= 2
}

async function updateItem() {
  try {
    if (currentView.value === 'teachers') {
      await axios.put('/update-teacher/' + editingId.value, {
        Ho_va_Ten: formData.value.teacher.name,
        email: formData.value.teacher.email,
        sdt: formData.value.teacher.sdt
      })

      fetchTeachers()
      return closeForm()
    }

    if (currentView.value === 'students') {
      if (groupIsFull(formData.value.student.Nhom)) {
        alert('Nhóm này đã đủ 2 sinh viên!')
        return
      }

      await axios.put('/update-student/' + editingId.value, {
        MSSV: formData.value.student.MSSV,
        Ho_va_Ten: formData.value.student.Ho_va_Ten,
        email: formData.value.student.email,
        sdt: formData.value.student.sdt,
        Nhom: formData.value.student.Nhom
      })

      fetchStudents()
      return closeForm()
    }

    if (currentView.value === 'topics') {
      await axios.put('/update-topic/' + editingId.value, {
        MaDT: formData.value.topic.MaDT,
        TenDeTai: formData.value.topic.TenDeTai,
        MaGV: formData.value.topic.MaGV
      })

      fetchTopics()
      return closeForm()
    }
  } catch (error) {
    console.error(error.response?.data || error)
    alert('Lỗi khi cập nhật dữ liệu!')
  }
}

async function deleteItem(id) {
  try {
    if (currentView.value === 'teachers') {
      await axios.post('/delete-teacher/' + id)
      fetchTeachers()
    } else if (currentView.value === 'students') {
      await axios.post('/delete-student/' + id)
      fetchStudents()
    } else if (currentView.value === 'topics') {
      await axios.post('/delete-topic/' + id)
      fetchTopics()
    }
  } catch (error) {
    console.error(error)
    alert('Lỗi khi xóa dữ liệu!')
  }
}

async function addItem() {
  try {
    if (currentView.value === 'teachers') {
      await axios.post('/add-teacher', formData.value.teacher)
      fetchTeachers()
      return closeForm()
    }

    if (currentView.value === 'students') {
      await fetchStudents()
      const group = formData.value.student.Nhom

      if (groupIsFull(group)) {
        alert(`Nhóm ${group} đã đủ 2 sinh viên!`)
        return
      }

      await axios.post('/add-student', formData.value.student)
      await fetchStudents()
      return closeForm()
    }

    if (currentView.value === 'topics') {
      await axios.post('/add-topic', formData.value.topic)
      fetchTopics()
      return closeForm()
    }
  } catch (error) {
    console.error(error)
    alert('Lỗi khi thêm dữ liệu!')
  }
}

function openEditForm(item) {
  formMode.value = 'edit'
  showForm.value = true
  if (currentView.value === 'teachers') {
    formData.value.teacher = {
      name: item.name || '',
      email: item.email || '',
      sdt: item.sdt || ''
    }
    editingId.value = item.MaGV || item.id || null
  } else if (currentView.value === 'students') {
    formData.value.student = {
      MSSV: item.mssv || '',
      Ho_va_Ten: item.name || '',
      email: item.email || '',
      sdt: item.phone || '',
      Nhom: item.group || ''
    }
    editingId.value = item.mssv || item.id || null
  } else if (currentView.value === 'topics') {
    formData.value.topic = {
      MaDT: item.MaDT || '',
      TenDeTai: item.TenDeTai || '',
      MaGV: item.MaGV || ''
    }
    editingId.value = item.MaDT || null
  }
}

function closeForm() {
  showForm.value = false
}

function getFormTitle() {
  const titles = {
    assignments: 'BẢNG PHÂN CÔNG',
    teachers: 'GIẢNG VIÊN',
    students: 'SINH VIÊN',
    topics: 'ĐỀ TÀI'
  }
  return titles[currentView.value] || ''
}

/** ========================== */
/**  DATA HOLDERS              */
/** ========================== */
const assignments = ref([])
const students = ref([])
const teachers = ref([])
const topics = ref([])
const svpc = ref([])

// hội đồng
const committees = ref([])

/** ========================== */
/**  SEARCH / STATS            */
/** ========================== */
const assignmentSearch = ref('')
const teacherSearch = ref('')
const studentSearch = ref('')
const topicSearch = ref('')

const totalStudents = ref(0)
const totalTeachers = ref(0)
const totalTopics = ref(0)

const fetchStats = async () => {
  try {
    const res = await axios.get('/stats')
    totalStudents.value = Number(res.data.students ?? 0)
    totalTeachers.value = Number(res.data.teachers ?? 0)
    totalTopics.value = Number(res.data.topics ?? 0)
  } catch (err) {
    console.error('Error fetching stats', err)
  }
}

/** ========================== */
/**  FETCH TOPICS / TEACHERS   */
/** ========================== */
const fetchTopics = async () => {
  try {
    const response = await axios.post('/topics/getAll')
    topics.value = response.data
  } catch (error) {
    console.error('Error fetching topics:', error)
  }
}

const fetchTeachers = async () => {
  try {
    const response = await axios.post('/teachers/getAll')
    teachers.value = response.data
  } catch (error) {
    console.error('Error fetching teachers:', error)
  }
}

/** ========================== */
/**  FETCH STUDENTS            */
/** ========================== */
const fetchStudents = async () => {
  try {
    const response = await axios.post('/students/getAll')

    students.value = response.data.sort((a, b) => Number(a.group) - Number(b.group))

    assignments.value = normalizeStudents(students.value)
  } catch (error) {
    console.error('Error fetching students:', error)
  }
}

function normalizeStudents(studentsArr) {
  return (studentsArr || []).map(s => ({
    mssv: s.mssv ?? s.MSSV ?? '',
    name: s.name ?? s.Ho_va_Ten ?? s.HoTen ?? '',
    group: s.group ?? s.Nhom ?? '',
    topic: s.topic ?? s.TenDeTai ?? '',
    lecturer: s.lecturer ?? s.Giang_vien_hd ?? '',
    status: s.status ?? 'Chưa gặp',
    note: s.note ?? ''
  }))
}

/** ========================== */
/**  EXPORT / IMPORT EXCEL     */
/** ========================== */
function exportExcel() {
  window.open(route('students.export'), '_blank')
}

const handleExcelImport = async e => {
  const file = e.target.files[0]
  if (!file) {
    alert('Không có file được chọn!')
    return
  }

  const formDataUpload = new FormData()
  formDataUpload.append('file', file)

  try {
    const res = await axios.post('/import-temp', formDataUpload, {
      headers: { 'Content-Type': 'multipart/form-data' }
    })
    alert(res.data.message || 'Import thành công!')
  } catch (err) {
    console.error('Upload error:', err.response?.data || err.message)
    alert('Import thất bại! Kiểm tra định dạng file.')
  }
}

/** ========================== */
/**  PHÂN CÔNG GV HƯỚNG DẪN    */
/** ========================== */
const showAssignModal = ref(false)
const showStudentModal = ref(false)
const selectedLecturer = ref(null)

function openAssignPanel(item) {
  showAssignModal.value = true
  svpc.value = item
}

function closeAssignPanel() {
  showAssignModal.value = false
  closeStudentModal()
}

function openStudentModal(lecturer) {
  selectedLecturer.value = lecturer
  showStudentModal.value = true
}

function closeStudentModal() {
  selectedLecturer.value = null
  showStudentModal.value = false
}

function countAssignedTo(lecturer) {
  if (!lecturer) return 0
  const id = lecturer.MaGV ?? lecturer.id ?? lecturer.name
  return (
    students.value?.filter(student => {
      const assigned = (
        student.lecturer ??
        student.Giang_vien_hd ??
        student.lecturer_name ??
        ''
      ).toString()
      return assigned === id || assigned === (lecturer.name ?? '')
    }).length || 0
  )
}

function studentsAssignedTo(lecturer) {
  if (!lecturer) return []
  const id = lecturer.MaGV ?? lecturer.id ?? lecturer.name
  return (
    students.value?.filter(student => {
      const assigned = (
        student.lecturer ??
        student.Giang_vien_hd ??
        student.lecturer_name ??
        ''
      ).toString()
      return assigned === id || assigned === (lecturer.name ?? '')
    }) || []
  )
}

async function confirmAllAssignments(lecturer) {
  if (!lecturer || !students.value) return

  const lecturerId = lecturer.MaGV ?? lecturer.id ?? lecturer.name
  const lecturerName = lecturer.name ?? lecturer.HoTen ?? 'giảng viên'

  const confirmed = window.confirm(
    `Bạn có chắc muốn phân công sinh viên ${svpc.value.name} cho giảng viên ${lecturerName}?`
  )

  if (confirmed) {
    await axios.put(`/assign-students/${svpc.value.mssv}`, {
      Giang_vien_huong_dan: lecturerId
    })
    alert(` Đã phân công sinh viên ${svpc.value.name} cho giảng viên ${lecturerName}`)
    fetchStudents()
    fetchTeachers()
    closeAssignPanel()
  }
}

/** ========================== */
/**  PHÂN CÔNG PHẢN BIỆN       */
/** ========================== */
const reviewSearch = ref('')
const showReviewerModal = ref(false)
const selectedTopic = ref(null)

const showReviewTopicModal = ref(false)
const selectedReviewer = ref(null)

// dùng cho hover nhóm đề tài
const hoverStt = ref(null)

function openReviewerTopicList(reviewer) {
  selectedReviewer.value = reviewer
  showReviewTopicModal.value = true
}

function closeReviewerTopicList() {
  selectedReviewer.value = null
  showReviewTopicModal.value = false
}


const reviewTopics = computed(() => {
  const q = (reviewSearch.value || '').toString().toLowerCase().trim()

  return (topics.value || [])
    .map(t => ({
      ...t,
      reviewerName:
        t.reviewerName ??
        t.reviewer_name ??
        (t.reviewer ? findTeacherName(t.reviewer) : '')
    }))
    .filter(t => {
      if (!q) return true
      const text = `${t.MaDT || ''} ${t.TenDeTai || t.title || ''}`.toLowerCase()
      return text.includes(q)
    })
})

/**
 * reviewAssignmentRows:
 *  - Mỗi đề tài có thể có 1 hoặc nhiều sinh viên
 *  - Nếu có nhiều SV thì MaDT/TenDeTai/GV phản biện/Ghi chú/Thao tác sẽ rowspan = số SV
 */
const reviewAssignmentRows = computed(() => {
  const result = []
  let sttCounter = 0

  const topicList = reviewTopics.value || []
  const allStudents = students.value || []

  const norm = v => (v ?? '').toString().toLowerCase().trim()

  // Build topicMap keyed strictly by MaDT, then Nhom, otherwise unique per topic
  const topicMap = new Map()
  topicList.forEach((topic, idx) => {
    const maDT = (topic.MaDT || topic.maDT || topic.ma_dt || '').toString().trim()
    const nhom = norm(topic.Nhom || topic.group)

    let key
    if (maDT !== '') {
      key = `MADT::${maDT}`
    } else if (nhom !== '') {
      key = `NHOM::${nhom}`
    } else {
      // unique fallback so topics with same title are NOT merged
      key = `UNIQ::${idx}` // use index to keep each topic separate
    }

    // keep first topic object for this key
    if (!topicMap.has(key)) {
      topicMap.set(key, { key, topic })
    }
  })

  // For each unique topic key, find students and push rows
  for (const { key, topic } of topicMap.values()) {
    const topicMaDT = (topic.MaDT || topic.maDT || topic.ma_dt || '').toString().trim()
    const topicNhom = norm(topic.Nhom || topic.group)

    // find students that belong to this topic key
    const matchedStudents = allStudents.filter(s => {
      const sMaDT = (s.MaDT || s.maDT || s.ma_dt || '').toString().trim()
      const sNhom = norm(s.Nhom || s.group)

      // priority: MaDT match, then Nhom match
      if (topicMaDT && sMaDT && topicMaDT === sMaDT) return true
      if (topicNhom && sNhom && topicNhom === sNhom) return true

      return false
    }).map(s => ({
      mssv: s.mssv || s.MSSV || '',
      name: s.name || s.Ho_va_Ten || s.HoTen || ''
    }))

    const stuArr = matchedStudents.length ? matchedStudents : [{ mssv: '', name: '' }]

    sttCounter += 1
    const rowSpan = stuArr.length

    let first = true
    for (const stu of stuArr) {
      result.push({
        topic,
        key,
        isFirst: first,
        rowSpan,
        stt: sttCounter,
        mssv: stu.mssv,
        name: stu.name
      })
      first = false
    }
  }
  console.log(allStudents)

  return result
})

function reviewTopicsAssignedTo(reviewer) {
  if (!reviewer) return []
  const id = (reviewer.MaGV ?? reviewer.id ?? reviewer.name).toString()
  return (
    (topics.value || []).filter(t => {
      const rev = (t.MaGVPB ?? t.reviewer_id ?? t.reviewerName ?? '').toString()
      return rev === id || rev === (reviewer.name ?? '')
    }) || []
  )
}

function openReviewerList(topic) {
  selectedTopic.value = topic
  showReviewerModal.value = true
}

function closeReviewerModal() {
  showReviewerModal.value = false
  selectedTopic.value = null
}

function countReviewAssigned(gv) {
  if (!gv) return 0
  const id = gv.MaGV ?? gv.id ?? gv.name
  return (topics.value || []).filter(t => {
    const reviewer = (t.MaGVPB ?? t.reviewer_id ?? '').toString()
    return reviewer === id || reviewer === (gv.name ?? '')
  }).length
}

function findTeacherName(idOrName) {
  if (!idOrName) return ''
  const found = (teachers.value || []).find(gv => {
    const id = (gv.MaGV ?? gv.id ?? '').toString()
    return id === idOrName.toString() || (gv.name || gv.HoTen || '').toString() === idOrName.toString()
  })
  return found ? found.name ?? found.HoTen ?? '' : ''
}

const availableReviewers = computed(() => {
  if (!selectedTopic.value) return teachers.value || []
  const advisorId = (selectedTopic.value.MaGV ?? selectedTopic.value.advisor_id ?? '')
    .toString()
    .trim()
  return (teachers.value || []).filter(gv => {
    const gvId = (gv.MaGV ?? gv.id ?? '').toString().trim()
    return gvId.length > 0 && gvId !== advisorId
  })
})

function deleteTopicReviewer(topic) {
  if (!topic) return
  const confirmed = window.confirm(
    `Xóa thông tin phản biện của đề tài "${topic.TenDeTai || topic.MaDT}" ?`
  )
  if (!confirmed) return
  axios
    .post(`/remove-reviewer/${topic.MaDT}`)
    .then(() => {
      fetchTopics()
    })
    .catch(() => {
      const idx = topics.value.findIndex(t => t.MaDT === topic.MaDT)
      if (idx !== -1) {
        topics.value[idx].reviewer = ''
        topics.value[idx].reviewerName = ''
      }
    })
}

async function confirmReviewAssignment(gv) {
  if (!gv || !selectedTopic.value) return
  const reviewerId = gv.MaGV ?? gv.id ?? gv.name
  const confirmed = window.confirm(
    `Phân công đề tài "${
      selectedTopic.value.TenDeTai || selectedTopic.value.MaDT
    }" cho phản biện viên ${gv.name || gv.HoTen || reviewerId}?`
  )
  if (!confirmed) return
  try {
    await axios.put(`/assign-reviewer/${selectedTopic.value.MaDT}`, { MaGVPB: reviewerId })
    fetchTopics()
    closeReviewerModal()
  } catch (err) {
    console.error('Lỗi phân công phản biện:', err)
    alert('Lỗi khi phân công phản biện ')
  }
}

/** ========================== */
/**  THÀNH LẬP HỘI ĐỒNG        */
/** ========================== */

// Modal form hội đồng
const showCommitteeForm = ref(false)
const committeeFormMode = ref('add')
const editingCommitteeId = ref(null)

// Modal chi tiết hội đồng
const showCommitteeDetailModal = ref(false)
const selectedCommittee = ref(null)

// Form data
const committeeForm = ref({
  members: [
    { teacherId: '', position: '' },
    { teacherId: '', position: '' },
    { teacherId: '', position: '' },
    { teacherId: '', position: '' }
  ],
  start: '',
  end: ''
})

// Chuẩn hóa dữ liệu hội đồng từ backend
function normalizeCommittees(arr) {
  return (arr || []).map(c => ({
    id: c.id,
    start: c.start_time || c.NgayGioBatDau || c.start || c.NgayBatDau || '',
    end: c.end_time || c.NgayGioKetThuc || c.end || c.NgayKetThuc || '',
    members: (c.members || c.thanhVien || c.giangVienHoiDong || []).map(m => ({
      teacherId: m.teacher_id || m.MaGV || m.id || '',
      teacherName: m.teacher_name || m.name || m.HoTen || m.Ho_va_Ten || '',
      position: m.position || m.ChucVu || ''
    }))
  }))
}

const fetchCommittees = async () => {
  try {
    const res = await axios.get('/committees')
    committees.value = normalizeCommittees(res.data)
  } catch (err) {
    console.error('Lỗi load hội đồng:', err)
    committees.value = []
  }
}

function toDatetimeLocal(str) {
  if (!str) return ''
  const d = new Date(str.replace(' ', 'T'))
  if (Number.isNaN(d.getTime())) return ''
  const yyyy = d.getFullYear()
  const MM = String(d.getMonth() + 1).padStart(2, '0')
  const dd = String(d.getDate()).padStart(2, '0')
  const hh = String(d.getHours()).padStart(2, '0')
  const mm = String(d.getMinutes()).padStart(2, '0')
  return `${yyyy}-${MM}-${dd}T${hh}:${mm}`
}

// helpers cho GV & chức vụ
function getTeacherId(t) {
  return (t?.MaGV ?? t?.id ?? '').toString()
}

function getTeacherNameById(id) {
  if (!id) return ''
  const found = (teachers.value || []).find(t => getTeacherId(t) === id.toString())
  return found ? (found.name ?? found.HoTen ?? found.Ho_va_Ten ?? '') : ''
}

function positionLabel(val) {
  const found = POSITION_OPTIONS.find(p => p.value === val)
  return found ? found.label : val || ''
}

// lấy list GV chưa được chọn ở dòng khác
function availableTeachersForRow(rowIndex) {
  const used = committeeForm.value.members
    .map((m, i) => (i === rowIndex ? null : m.teacherId))
    .filter(Boolean)

  return (teachers.value || []).filter(t => !used.includes(getTeacherId(t)))
}

// lấy list chức vụ hợp lệ cho từng dòng
function availablePositionsForRow(rowIndex) {
  const current = committeeForm.value.members[rowIndex].position

  const used = committeeForm.value.members
    .map((m, i) => (i === rowIndex ? null : m.position))
    .filter(Boolean)

  return POSITION_OPTIONS.filter(pos => {
    if (!pos.unique) return true // Ủy viên cho phép trùng

    // unique: nếu đã dùng ở dòng khác thì không cho chọn nữa
    if (current === pos.value) return true // vẫn cho giữ chọn hiện tại
    return !used.includes(pos.value)
  })
}

function openCommitteeAddForm() {
  committeeFormMode.value = 'add'
  editingCommitteeId.value = null
  committeeForm.value = {
    members: [
      { teacherId: '', position: '' },
      { teacherId: '', position: '' },
      { teacherId: '', position: '' },
      { teacherId: '', position: '' }
    ],
    start: '',
    end: ''
  }
  showCommitteeForm.value = true
}

function openCommitteeEditForm(c) {
  committeeFormMode.value = 'edit'
  editingCommitteeId.value = c.id

  const members = (c.members || []).map(m => ({
    teacherId: m.teacherId,
    position: m.position
  }))

  // đảm bảo đủ 4 dòng
  while (members.length < 4) {
    members.push({ teacherId: '', position: '' })
  }

  committeeForm.value = {
    members,
    start: toDatetimeLocal(c.start),
    end: toDatetimeLocal(c.end)
  }

  showCommitteeForm.value = true
}

function closeCommitteeForm() {
  showCommitteeForm.value = false
}

function openCommitteeDetail(c) {
  selectedCommittee.value = c
  showCommitteeDetailModal.value = true
}

async function deleteCommittee(c) {
  if (!c || !c.id) return
  const ok = window.confirm('Bạn có chắc muốn xóa hội đồng này?')
  if (!ok) return
  try {
    await axios.delete(`/committees/${c.id}`)
    await fetchCommittees()
  } catch (err) {
    console.error('Lỗi xóa hội đồng:', err)
    alert('Lỗi khi xóa hội đồng')
  }
}

// kiểm tra trùng lịch giảng viên
function checkTeacherScheduleConflict(members, startDate, endDate, ignoreId = null) {
  const teacherIds = members.map(m => m.teacherId).filter(Boolean)
  if (teacherIds.length === 0) return false

  const startMs = startDate.getTime()
  const endMs = endDate.getTime()

  return (committees.value || []).some(c => {
    if (!c) return false
    if (ignoreId != null && c.id == ignoreId) return false

    const cStart = new Date(c.start && c.start.toString().replace(' ', 'T')).getTime()
    const cEnd = new Date(c.end && c.end.toString().replace(' ', 'T')).getTime()
    if (Number.isNaN(cStart) || Number.isNaN(cEnd)) return false

    // kiểm tra có GV trùng
    const cTeacherIds = (c.members || []).map(m => m.teacherId).filter(Boolean)
    const shareTeacher = cTeacherIds.some(id => teacherIds.includes(id))
    if (!shareTeacher) return false

    // kiểm tra khoảng thời gian bị overlap
    // overlap nếu: newStart < oldEnd && newEnd > oldStart
    return startMs < cEnd && endMs > cStart
  })
}

async function submitCommitteeForm() {
  // lọc các dòng có dữ liệu
  const members = committeeForm.value.members.filter(
    m => m.teacherId && m.position
  )

  if (members.length < 3) {
    alert('Vui lòng chọn ít nhất 3 giảng viên và chức vụ cho hội đồng.')
    return
  }

  // không trùng giảng viên
  const teacherIds = members.map(m => m.teacherId)
  const dupTeacher = teacherIds.find((id, idx) => teacherIds.indexOf(id) !== idx)
  if (dupTeacher) {
    alert('Không được chọn trùng giảng viên trong cùng một hội đồng.')
    return
  }

  // đảm bảo mỗi chức vụ unique có đúng 1 người, t3 (Ủy viên) có thể trùng nhưng phải có ít nhất 1
  const uniquePositions = POSITION_OPTIONS.filter(p => p.unique).map(p => p.value)
  const nonUniquePositions = POSITION_OPTIONS.filter(p => !p.unique).map(p => p.value)

  for (const pos of uniquePositions) {
    const count = members.filter(m => m.position === pos).length
    if (count !== 1) {
      const label = positionLabel(pos)
      alert(`Chức vụ "${label}" phải có đúng 1 người.`)
      return
    }
  }

  const hasNonUnique = members.some(m => nonUniquePositions.includes(m.position))
  if (!hasNonUnique) {
    alert('Hội đồng phải có ít nhất 1 Ủy viên.')
    return
  }

  // validate thời gian
  if (!committeeForm.value.start || !committeeForm.value.end) {
    alert('Vui lòng chọn thời gian bắt đầu và kết thúc.')
    return
  }

  const startDate = new Date(committeeForm.value.start)
  const endDate = new Date(committeeForm.value.end)
  if (Number.isNaN(startDate.getTime()) || Number.isNaN(endDate.getTime())) {
    alert('Thời gian không hợp lệ.')
    return
  }
  if (endDate <= startDate) {
    alert('Thời gian kết thúc phải sau thời gian bắt đầu.')
    return
  }

  // kiểm tra trùng lịch với hội đồng khác
  const hasConflict = checkTeacherScheduleConflict(
    members,
    startDate,
    endDate,
    committeeFormMode.value === 'edit' ? editingCommitteeId.value : null
  )
  if (hasConflict) {
    alert('Có giảng viên đã nằm trong hội đồng khác trùng khoảng thời gian này.')
    return
  }

  const payload = {
    start_time: committeeForm.value.start,
    end_time: committeeForm.value.end,
    members: members.map(m => ({
      teacher_id: m.teacherId,
      position: m.position
    }))
  }

  try {
    if (committeeFormMode.value === 'add') {
      await axios.post('/committees', payload)
    } else {
      await axios.put(`/committees/${editingCommitteeId.value}`, payload)
    }
    await fetchCommittees()
    showCommitteeForm.value = false
  } catch (err) {
    console.error('Lỗi lưu hội đồng:', err)
    alert('Lỗi khi lưu hội đồng. Vui lòng kiểm tra backend.')
  }
}

function onStudentSearchInput() {
}

onMounted(() => {
  fetchStats()
  fetchTeachers()
  fetchTopics()
  fetchStudents()
  loadTimeAllocations()
  fetchCommittees()
})
</script>