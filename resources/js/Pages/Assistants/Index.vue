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

    <!-- Body -->
    <div class="flex">
      <!-- Sidebar -->
      <aside class="w-64 bg-white border-r p-6">
        <nav class="flex flex-col space-y-4 text-indigo-700 font-medium">
          <button 
            @click="setCurrentView('dashboard')" 
            :class="currentView === 'dashboard' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Trang chủ
          </button>
          <button 
            @click="setCurrentView('assignments')" 
            :class="currentView === 'assignments' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Bảng phân công
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
        </nav>
      </aside>

      <!-- Main content -->
      <main class="flex-1 p-8">
        <!-- Dashboard View -->
        <div v-if="currentView === 'dashboard'">
          <h2 class="text-2xl font-bold text-indigo-600 mb-6 text-center">TRANG CHỦ - THỐNG KÊ TỔNG QUAN</h2>
          <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white p-6 rounded-lg shadow-md">
              <div class="flex items-center">
                <div class="p-3 rounded-full bg-blue-100 text-blue-600">
                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"></path>
                  </svg>
                </div>
                <div class="ml-4">
                  <p class="text-sm font-medium text-gray-600">Tổng số sinh viên</p>
                  <p class="text-2xl font-semibold text-gray-900">0</p>
                </div>
              </div>
            </div>
            
            <div class="bg-white p-6 rounded-lg shadow-md">
              <div class="flex items-center">
                <div class="p-3 rounded-full bg-green-100 text-green-600">
                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path>
                  </svg>
                </div>
                <div class="ml-4">
                  <p class="text-sm font-medium text-gray-600">Tổng số giảng viên</p>
                  <p class="text-2xl font-semibold text-gray-900">0</p>
                </div>
              </div>
            </div>
            
            <div class="bg-white p-6 rounded-lg shadow-md">
              <div class="flex items-center">
                <div class="p-3 rounded-full bg-purple-100 text-purple-600">
                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                  </svg>
                </div>
                <div class="ml-4">
                  <p class="text-sm font-medium text-gray-600">Tổng số đề tài</p>
                  <p class="text-2xl font-semibold text-gray-900">0</p>
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

        <!-- Bảng phân công -->
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
              <button @click="openAddForm" class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 transition">
                Thêm
              </button>
              <button class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600 transition" @click="exportExcel">
                Xuất file Excel
              </button>
            </div>
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
                  <th class="p-3 text-left">Thao tác</th>
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
                  <td class="p-3">
                    <div class="flex gap-2">
                      <button @click="openEditForm(item)" class="bg-blue-500 text-white px-2 py-1 rounded text-xs hover:bg-blue-600 transition">
                        Sửa
                      </button>
                      <button class="bg-red-500 text-white px-2 py-1 rounded text-xs hover:bg-red-600 transition">
                        Xóa
                      </button>
                    </div>
                  </td>
                </tr>
                <tr v-if="assignments.length === 0">
                  <td class="p-3 italic text-sm text-gray-500" colspan="8">Không có dữ liệu từ database</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Trang qlgv -->
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
              <button @click="openAddForm" class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 transition">
                Thêm
              </button>
              <button class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600 transition">
                Xuất file Excel
              </button>
            </div>
          </div>

          <!-- Table -->
          <div class="overflow-x-auto">
            <table class="min-w-full bg-white rounded shadow text-sm divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-left">Mã GV</th>
                  <th class="p-3 text-left">Họ và tên</th>
                  <th class="p-3 text-left">Email</th>
                  <th class="p-3 text-left">Số đề tài HD</th>
                  <th class="p-3 text-left">Trạng thái</th>
                  <th class="p-3 text-left">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(teacher, i) in teachers" :key="teacher.id" class="hover:bg-indigo-50">
                  <td class="p-3">{{ teacher.MaGV}}</td>
                  <td class="p-3">{{ teacher.name }}</td>
                  <td class="p-3">{{ teacher.email }}</td>
                  <td class="p-3">{{ teacher.Khoa }}</td>
                  <td class="p-3">{{ teacher.So_luong_sinh_vien }}</td>
                  <td class="p-3">
                    <span class="bg-green-100 text-green-700 px-2 py-1 rounded-full text-xs font-semibold">
                      Hoạt động
                    </span>
                  </td>
                  <td class="p-3">
                    <div class="flex gap-2">
                      <button @click="openEditForm(item)" class="bg-blue-500 text-white px-2 py-1 rounded text-xs hover:bg-blue-600 transition">
                        Sửa
                      </button>
                      <button class="bg-red-500 text-white px-2 py-1 rounded text-xs hover:bg-red-600 transition">
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

        <!-- Trang qlsv -->
        <div v-if="currentView === 'students'">
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">QUẢN LÝ SINH VIÊN</h2>
            <div class="flex items-center gap-4">
              <input
                v-model="studentSearch"
                type="text"
                placeholder="Tìm kiếm sinh viên..."
                class="w-80 px-3 py-2 border rounded shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-300"
              />
              <button @click="openAddForm" class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 transition">
                Thêm
              </button>
              <button class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600 transition">
                Xuất file Excel
              </button>
            </div>
          </div>

          <!-- Table -->
          <div class="overflow-x-auto">
            <table class="min-w-full bg-white rounded shadow text-sm divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-left">MSSV</th>
                  <th class="p-3 text-left">Họ và tên</th>
                  <th class="p-3 text-left">Nhóm</th>
                  <th class="p-3 text-left">Email</th>
                  <th class="p-3 text-left">Số điện thoại</th>
                  <th class="p-3 text-left">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr v-if="students.length === 0">
                  <td class="p-3 italic text-sm text-gray-500" colspan="6">Không có dữ liệu từ database</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Trang qldt -->
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
              <button @click="openAddForm" class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 transition">
                Thêm
              </button>
              <button class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600 transition">
                Xuất file Excel
              </button>
            </div>
          </div>

          <!-- Table -->
          <div class="overflow-x-auto">
            <table class="min-w-full bg-white rounded shadow text-sm divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-left">Mã đề tài</th>
                  <th class="p-3 text-left">Tên đề tài</th>
                  <th class="p-3 text-left">Giảng viên</th>
                  <th class="p-3 text-left">Số lượng</th>
                  <th class="p-3 text-left">Trạng thái</th>
                  <th class="p-3 text-left">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(topic, i) in topics" :key="i" class="hover:bg-indigo-50">
                  <td class="p-3">{{ topic.code }}</td>
                  <td class="p-3">{{ topic.title }}</td>
                  <td class="p-3">{{ topic.lecturer }}</td>
                  <td class="p-3">{{ topic.limit }}</td>
                  <td class="p-3">
                    <span
                      :class="{
                        'bg-green-100 text-green-700 px-2 py-1 rounded-full text-xs font-semibold': topic.status === 'Chờ sinh viên chọn',
                        'bg-yellow-100 text-yellow-700 px-2 py-1 rounded-full text-xs font-semibold': topic.status === 'Đã được chọn',
                        'bg-red-100 text-red-700 px-2 py-1 rounded-full text-xs font-semibold': topic.status === 'Đã khóa'
                      }"
                    >
                      {{ topic.status }}
                    </span>
                  </td>
                  <td class="p-3">
                    <div class="flex gap-2">
                      <button @click="openEditForm(item)" class="bg-blue-500 text-white px-2 py-1 rounded text-xs hover:bg-blue-600 transition">
                        Sửa
                      </button>
                      <button class="bg-red-500 text-white px-2 py-1 rounded text-xs hover:bg-red-600 transition">
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

        <!-- Form Modal -->
        <div v-if="showForm" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div class="bg-white rounded-lg p-6 w-full max-w-2xl mx-4 max-h-[90vh] overflow-y-auto">
            <div class="flex justify-between items-center mb-4">
              <h3 class="text-xl font-bold text-indigo-600">
                {{ formMode === 'add' ? 'THÊM MỚI' : 'CHỈNH SỬA' }} {{ getFormTitle() }}
              </h3>
              <button @click="closeForm" class="text-gray-500 hover:text-gray-700">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                </svg>
              </button>
            </div>

            <!-- Form Content -->
            <div class="space-y-4">
              <!-- Assignment Form -->
              <div v-if="currentView === 'assignments'">
                <div class="grid grid-cols-2 gap-4">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">MSSV</label>
                    <input type="text" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập MSSV">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Họ và tên</label>
                    <input type="text" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập họ và tên">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Nhóm</label>
                    <input type="text" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập nhóm">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Đề tài LVTN</label>
                    <input type="text" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập đề tài">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Giảng viên HD</label>
                    <input type="text" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập tên giảng viên">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Trạng thái</label>
                    <select class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300">
                      <option value="Chưa gặp">Chưa gặp</option>
                      <option value="Đã gặp">Đã gặp</option>
                    </select>
                  </div>
                </div>
                <div class="mt-4">
                  <label class="block text-sm font-medium text-gray-700 mb-1">Ghi chú</label>
                  <textarea class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" rows="3" placeholder="Nhập ghi chú"></textarea>
                </div>
              </div>

              <!-- Teacher Form -->
              <div v-if="currentView === 'teachers'">
                <div class="grid grid-cols-2 gap-4">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Mã GV</label>
                    <input type="text" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập mã giảng viên">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Họ và tên</label>
                    <input type="text" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập họ và tên">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                    <input type="email" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập email">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Số đề tài HD</label>
                    <input type="number" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập số đề tài">
                  </div>
                </div>
              </div>

              <!-- Student Form -->
              <div v-if="currentView === 'students'">
                <div class="grid grid-cols-2 gap-4">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">MSSV</label>
                    <input type="text" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập MSSV">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Họ và tên</label>
                    <input type="text" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập họ và tên">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Nhóm</label>
                    <input type="text" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập nhóm">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                    <input type="email" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập email">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Số điện thoại</label>
                    <input type="tel" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập số điện thoại">
                  </div>
                </div>
              </div>

              <!-- Topic Form -->
              <div v-if="currentView === 'topics'">
                <div class="grid grid-cols-2 gap-4">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Mã đề tài</label>
                    <input type="text" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập mã đề tài">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Tên đề tài</label>
                    <input type="text" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập tên đề tài">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Giảng viên</label>
                    <input type="text" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập tên giảng viên">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Số lượng</label>
                    <input type="number" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300" placeholder="Nhập số lượng">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Trạng thái</label>
                    <select class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-indigo-300">
                      <option value="Chờ sinh viên chọn">Chờ sinh viên chọn</option>
                      <option value="Đã được chọn">Đã được chọn</option>
                      <option value="Đã khóa">Đã khóa</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>

            <!-- Form Actions -->
            <div class="flex justify-end gap-3 mt-6 pt-4 border-t">
              <button @click="closeForm" class="px-4 py-2 border border-gray-300 rounded hover:bg-gray-50 transition">
                Hủy
              </button>
              <button class="px-4 py-2 bg-indigo-500 text-white rounded hover:bg-indigo-600 transition">
                {{ formMode === 'add' ? 'Thêm' : 'Cập nhật' }}
              </button>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref, watch } from 'vue'
import { router } from '@inertiajs/vue3'
import axios from 'axios'

const showMenu = ref(false)
function toggleMenu() { showMenu.value = !showMenu.value }
function goProfile() { router.visit('/profile') }
function logout() { router.post(route('logout')) }

// receive Inertia props: user and students
const props = defineProps({
  user: { type: Object, default: () => ({ name: 'User' }) },
  students: { type: Array, default: () => [] }
})

// Current view 
const currentView = ref('dashboard')
function setCurrentView(view) { currentView.value = view }

// Form modal state
const showForm = ref(false)
const formMode = ref('add') // 'add' or 'edit'

function openAddForm() {
  formMode.value = 'add'
  showForm.value = true
}

function openEditForm(item) {
  formMode.value = 'edit'
  showForm.value = true
  // Có thể load dữ liệu item vào form ở đây
}

function closeForm() {
  showForm.value = false
}

function getFormTitle() {
  const titles = {
    'assignments': 'BẢNG PHÂN CÔNG',
    'teachers': 'GIẢNG VIÊN',
    'students': 'SINH VIÊN', 
    'topics': 'ĐỀ TÀI'
  }
  return titles[currentView.value] || ''
}

// simple data holders
const assignments = ref([])
const students = ref([])
const teachers = ref([])
const topics = ref([])

// Search models for each view (UI only, no filtering logic)
const assignmentSearch = ref('')
const teacherSearch = ref('')
const studentSearch = ref('')
const topicSearch = ref('')


//Teachers data
//Get teachers data
const fetchTeachers = async () => {
  try {
    const response = await axios.post('/teachers/getAll')
    teachers.value = response.data
  } catch (error) {
    console.error('Error fetching teachers:', error)
  }
}

//Students data
//Get students data
const fetchStudents = async () => {
  try {
    const response = await axios.post('/students/getAll')
    students.value = response.data
  } catch (error) {
    console.error('Error fetching students:', error)
  }
}

// normalize incoming student objects to match table fields
function normalizeStudents(list) {
  return (list || []).map(s => {
    if (s.mssv && s.name && s.topic) {
      return {
        mssv: s.mssv ?? '',
        name: s.name ?? '',
        group: s.group ?? '',
        topic: s.topic ?? '',
        lecturer: s.lecturer ?? s.Giang_vien_hd ?? '',
        status: s.status ?? s.Trang_Thai ?? 'Chưa gặp',
        note: s.note ?? s.Ghi_chu ?? ''
      }
    }
    return {
      mssv: s.mssv ?? s.MSSV ?? s.msv ?? '',
      name: ((s.Ho ?? '') + ' ' + (s.Ten ?? '')).trim() || s.name || '',
      group: s.Nhom ?? s.nhom ?? s.group ?? '',
      topic: s.Huong_de_tai ?? s.de_tai ?? s.topic ?? '',
      lecturer: s.Giang_vien_hd ?? s.gv_hd ?? s.lecturer ?? '',
      status: s.Trang_Thai ?? s.trang_thai ?? s.status ?? 'Chưa gặp',
      note: s.Ghi_chu ?? s.note ?? ''
    }
  })
}

// init from props
assignments.value = normalizeStudents(props.students)

// keep assignments in sync if Inertia prop changes
watch(() => props.students, (newVal) => {
  assignments.value = normalizeStudents(newVal)
}, { deep: true })


// Export excel function (only for assignments)
function exportExcel() {
  window.open(route('students.export'), '_blank')
}

onMounted(() => {
  fetchTeachers()
})
</script>