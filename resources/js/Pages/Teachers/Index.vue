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

    <!-- Body -->
    <div class="flex h-[calc(100vh-4rem)]">
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
            Điểm phản biện
          </button>

          <button 
            @click="setCurrentView('guideScore')" 
            :class="currentView === 'guideScore' ? 'bg-indigo-100 text-indigo-900 rounded px-3 py-2' : 'text-left hover:text-indigo-900'"
          >
            Điểm hướng dẫn
          </button>
        </nav>
      </aside>

      <!-- Main content -->
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
                  <td class="p-3 text-center">{{ idx + 1 }}</td>
                  <td class="p-3 text-center">{{ s.mssv }}</td>
                  <td class="p-3 text-center">{{ s.name }}</td>
                  <td class="p-3 text-center">{{ s.Lop || '-' }}</td>
                  <td class="p-3 text-center">{{ s.phone || '-' }}</td>
                  <td class="p-3 text-center">{{ s.email || '-' }}</td>
                  <td class="p-3 text-center">
                    <input v-model="s.group" @keyup.enter="updateGroup(s)" class="border p-1 w-16 text-center" />
                  </td>
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
                  <td colspan="7" class="p-4 text-center text-gray-500">
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
                      <button @click="openAssignForm(t)" type="button" class="bg-blue-500 text-white px-3 py-1 rounded text-sm opacity-90">
                        Phân công
                      </button>
                      <button @click="downloadTemplate(t.code)" type="button" class="bg-indigo-500 text-white px-3 py-1 rounded text-sm opacity-90">
                        Xuất nhiệm vụ
                      </button>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Simple Form Modal -->
        <div v-if="showForm" class="fixed inset-0 bg-black bg-opacity-40 flex items-center justify-center z-50">
          <div class="bg-white rounded shadow-lg w-[90%] max-w-2xl p-6">
            <div class="flex justify-between items-center mb-4">
              <h3 class="text-lg font-semibold">{{ formMode === 'add' ? 'Phân công đề tài' : 'Sửa' }}</h3>
            </div>

            <div class="space-y-4 text-sm text-gray-700">
              <div>
                <label class="block font-medium mb-1">Tên đề tài</label>
                <input
                  v-model="formData.TenDT"
                  type="text"
                  class="w-full border rounded px-3 py-2"
                  placeholder="Nhập tên đề tài"
                />
              </div>

              <div>
                <label class="block font-medium mb-1">Mô tả</label>
                <textarea
                  v-model="formData.MoTa"
                  class="w-full border rounded px-3 py-2"
                  rows="4"
                  placeholder="Nhập mô tả đề tài"
                ></textarea>
              </div>

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

              <div class="flex justify-end mt-4 gap-x-3">
                <button @click="saveForm" class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600">Lưu</button>
                <button @click="closeForm" class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600">Đóng</button>
              </div>
            </div>
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
              </tbody>
            </table>
          </div>
        </div>

        <!-- Review Score view -->
        <div v-if="currentView === 'reviewScore'">
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">ĐIỂM PHẢN BIỆN</h2>
          <div>
              <input
                v-model="reviewScoreSearch"
                type="text"
                placeholder="Tìm mã hoặc tên đề tài..."
                class="border rounded px-3 py-2 text-sm w-64"
              />
            </div>
          </div>

          <div class="bg-white rounded shadow overflow-x-auto">
            <table class="min-w-full text-sm divide-y divide-gray-200">
              <thead class="bg-indigo-100 text-indigo-700">
                <tr>
                  <th class="p-3 text-center">STT</th>
                  <th class="p-3 text-center">Mã đề tài</th>
                  <th class="p-3 text-center">Tên đề tài</th>
                  <th class="p-3 text-center">MSSV</th>
                  <th class="p-3 text-center">Họ và tên sinh viên</th>
                  <th class="p-3 text-center">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(row, idx) in reviewScoreRows"
                  :key="(row.topic.MaDT || row.topic.id || 't') + '-' + idx"
                  :class="isTopicHovered(row.topic) ? 'bg-indigo-50' : ''"
                  @mouseenter="setHoveredTopic(row.topic)"
                  @mouseleave="clearHoveredTopic"
                >
                  <td
                    v-if="row.isFirst"
                    class="p-3 text-center"
                    :rowspan="row.rowSpan"
                  >
                    {{ row.stt }}
                  </td>

                  <td
                    v-if="row.isFirst"
                    class="p-3 text-center"
                    :rowspan="row.rowSpan"
                  >
                    {{ row.topic.MaDT || row.topic.id || '-' }}
                  </td>

                  <td
                    v-if="row.isFirst"
                    class="p-3 text-center"
                    :rowspan="row.rowSpan"
                  >
                    {{ row.topic.TenDeTai || row.topic.TenDT || row.topic.title || '-' }}
                  </td>

                  <td class="p-3 text-center">
                    {{ row.MSSV || '-' }}
                  </td>
                  <td class="p-3 text-center">
                    {{ row.name || '-' }}
                  </td>

                  <td
                    v-if="row.isFirst"
                    class="p-3 text-center"
                    :rowspan="row.rowSpan"
                  >
                    <div class="flex gap-2 justify-center">
                      <button
                        @click="openReviewScoreMiniForm(row.topic, row.MSSV, row.name)"
                        class="bg-blue-500 text-white px-3 py-1 rounded text-sm"
                      >
                        Chấm điểm
                      </button>
                    </div>
                  </td>
                </tr>

                <tr v-if="reviewScoreRows.length === 0">
                  <td colspan="6" class="p-4 text-center text-gray-500">Không có đề tài</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Mini Form ĐIỂM PHẢN BIỆN -->
        <div v-if="showReviewScoreMiniForm" class="fixed inset-0 z-50 bg-black bg-opacity-40 flex items-start justify-center overflow-auto">
          <div class="bg-white rounded-lg mt-8 mb-8 p-6 w-[92%] max-w-[980px] shadow-lg">
            <div class="flex justify-between items-start mb-4">
              <h3 class="text-xl font-bold text-indigo-600 text-center w-full">
                Phiếu chấm điểm phản biện
              </h3>
              <button @click="closeReviewScoreMiniForm" class="text-gray-500 absolute right-8 top-6">✕</button>
            </div>

            <!-- header info -->
            <div class="text-center mb-4">
              <p class="text-sm mb-1">Thành viên trong nhóm:</p>
              <div v-if="reviewScoreMiniForm.groupStudents && reviewScoreMiniForm.groupStudents.length" class="font-medium text-sm">
                <p v-for="(mem, i) in reviewScoreMiniForm.groupStudents" :key="i">
                  {{ mem.name }} - MSSV: {{ mem.mssv }}
                </p>
              </div>
              <p v-else class="font-medium text-sm">
                {{ reviewScoreMiniForm.groupMembers || (reviewScoreMiniForm.studentName ? (reviewScoreMiniForm.studentName + ' - MSSV: ' + reviewScoreMiniForm.mssv) : '') }}
              </p>
              <p class="mt-1">
                Đề tài:
                <span class="font-semibold">{{ reviewScoreMiniForm.TenDeTai }}</span>
              </p>
            </div>

            <div class="max-h-[60vh] overflow-y-auto pr-2">
              <!-- Nhận xét tổng quát -->
              <div class="mb-6">
                <div class="flex items-center gap-4 mb-2">
                  <label class="block text-center font-medium text-indigo-600 mb-2">
                    Nhận xét chung:
                  </label>
                  <label class="flex items-center gap-2">
                    <input type="radio" value="Đạt" v-model="reviewScoreMiniForm.overall" /> Đạt
                  </label>
                  <label class="flex items-center gap-2">
                    <input type="radio" value="Không đạt" v-model="reviewScoreMiniForm.overall" /> Không đạt
                  </label>
                </div>
                <textarea
                  v-model="reviewScoreMiniForm.overallNote"
                  rows="3"
                  class="w-full border rounded p-3 resize-none"
                ></textarea>
              </div>

              <!-- Ưu điểm chính -->
              <div class="mb-6">
                <label class="block text-center font-medium text-indigo-600 mb-2">
                  Ưu điểm chính
                </label>
                <textarea
                  v-model="reviewScoreMiniForm.strengths"
                  rows="3"
                  class="w-full border rounded p-3 resize-none"
                ></textarea>
              </div>

              <!-- Thiếu sót chính -->
              <div class="mb-6">
                <label class="block text-center font-medium text-indigo-600 mb-2">
                  Thiếu sót chính
                </label>
                <textarea
                  v-model="reviewScoreMiniForm.weaknesses"
                  rows="3"
                  class="w-full border rounded p-3 resize-none"
                ></textarea>
              </div>

              <!-- Table criteria -->
              <div class="mb-6">
                <table class="w-full border-collapse">
                  <thead>
                    <tr class="bg-gray-100">
                      <th class="p-3 border text-center">STT</th>
                      <th class="p-3 border text-left">Nội dung</th>
                      <th class="p-3 border text-center">Điểm tối đa</th>
                      <th class="p-3 border text-center">Điểm</th>
                      <th class="p-3 border text-left">Ghi chú</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="(c, i) in reviewScoreMiniForm.criteria" :key="i">
                      <td class="p-3 border text-center align-top">{{ i + 1 }}</td>
                      <td class="p-3 border align-top">{{ c.title }}</td>
                      <td class="p-3 border text-center align-top">{{ c.max }}</td>
                      <td class="p-3 border text-center align-top">
                        <input
                          v-model.number="c.score"
                          type="number"
                          :min="0"
                          :max="c.max"
                          class="w-20 border rounded p-1 text-center"
                        />
                      </td>
                      <td class="p-3 border align-top">
                        <textarea
                          v-model="c.note"
                          rows="2"
                          class="w-full border rounded p-2 resize-none"
                        ></textarea>
                      </td>
                    </tr>

                    <tr>
                      <td class="p-3 border font-semibold" colspan="2">
                        Tổng điểm {{ reviewScoreMiniForm.studentName }}
                      </td>
                      <td class="p-3 border text-center font-semibold">
                        {{ totalReviewMax }}
                      </td>
                      <td class="p-3 border text-center font-semibold">
                        {{ totalReviewScore }}
                      </td>
                      <td class="p-3 border text-center">
                        {{ percentReviewScore }}%
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <!-- Câu hỏi cho sinh viên -->
              <div class="mb-6">
                <label class="block text-center font-medium text-indigo-600 mb-2">
                  Câu hỏi cho sinh viên (tối đa 2 câu)
                </label>
                <textarea
                  v-model="reviewScoreMiniForm.questions"
                  rows="2"
                  class="w-full border rounded p-3 resize-none"
                ></textarea>
              </div>

              <!-- Đề nghị bảo vệ -->
              <div class="mb-6">
                <label class="block text-center font-medium text-indigo-600 mb-2">
                  Đề nghị bảo vệ
                </label>
                <div class="flex items-center justify-center gap-6">
                  <label>
                    <input
                      type="radio"
                      v-model="reviewScoreMiniForm.recommend"
                      value="Được bảo vệ"
                    />
                    Được bảo vệ
                  </label>
                  <label>
                    <input
                      type="radio"
                      v-model="reviewScoreMiniForm.recommend"
                      value="Không được bảo vệ"
                    />
                    Không được bảo vệ
                  </label>
                  <label>
                    <input
                      type="radio"
                      v-model="reviewScoreMiniForm.recommend"
                      value="Bổ sung/hiệu chỉnh để được bảo vệ"
                    />
                    Bổ sung/hiệu chỉnh để được bảo vệ
                  </label>
                </div>
              </div>
            </div>

            <!-- Footer buttons -->
            <div class="flex items-center justify-end gap-4 mt-4">
              <button @click="closeReviewScoreMiniForm" class="px-4 py-2 rounded border">
                Đóng
              </button>
              <button @click="saveReviewScoreMiniForm" class="px-5 py-2 rounded bg-blue-500 text-white">
                Xác nhận 
              </button>
            </div>
          </div>
        </div>

        <!-- Guide Score view -->
        <div v-if="currentView === 'guideScore'">
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-indigo-600">ĐIỂM HƯỚNG DẪN</h2>
            <div>
              <input
                v-model="guideScoreSearch"
                type="text"
                placeholder="Tìm mã hoặc tên đề tài..."
                class="border rounded px-3 py-2 text-sm w-64"
              />
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
                <tr
                  v-for="(t, idx) in guideScoreList"
                  :key="t.MaDT || t.id || idx"
                  class="hover:bg-indigo-50"
                >
                  <td class="p-3 text-center">{{ idx + 1 }}</td>
                  <td class="p-3 text-center">{{ t.MaDT || t.id || '-' }}</td>
                  <td class="p-3 text-center">{{ t.TenDeTai || t.TenDT || t.title || '-' }}</td>
                  <td class="p-3 text-center">
                    <div class="flex gap-2 justify-center">
                      <button
                        @click="openGuideScoreMiniForm(t)"
                        class="bg-blue-500 text-white px-3 py-1 rounded text-sm"
                      >
                        Chấm điểm
                      </button>
                    </div>
                  </td>
                </tr>
                <tr v-if="(guideScoreList || []).length === 0">
                  <td colspan="4" class="p-4 text-center text-gray-500">Không có đề tài</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Mini Form ĐIỂM HƯỚNG DẪN -->
        <div v-if="showGuideScoreMiniForm" class="fixed inset-0 z-50 bg-black bg-opacity-40 flex items-start justify-center overflow-auto">
          <div class="bg-white rounded-lg mt-8 mb-8 p-6 w-[92%] max-w-[980px] shadow-lg">
            <div class="flex justify-between items-start mb-4">
              <h3 class="text-xl font-bold text-indigo-600 text-center w-full">
                Phiếu chấm điểm hướng dẫn
              </h3>
              <button @click="closeGuideScoreMiniForm" class="text-gray-500 absolute right-8 top-6">✕</button>
            </div>

            <!-- header info -->
            <div class="text-center mb-4">
              <p class="text-sm mb-1">Thành viên trong nhóm:</p>
              <div v-if="guideScoreMiniForm.groupStudents && guideScoreMiniForm.groupStudents.length" class="font-medium text-sm">
                <p v-for="(mem, i) in guideScoreMiniForm.groupStudents" :key="i">
                  {{ mem.name }} - MSSV: {{ mem.mssv }}
                </p>
              </div>
              <p v-else class="font-medium text-sm">
                {{ guideScoreMiniForm.groupMembers || (guideScoreMiniForm.studentName ? (guideScoreMiniForm.studentName + ' - MSSV: ' + guideScoreMiniForm.mssv) : '') }}
              </p>

              <p class="mt-2 font-medium">
                Chấm cho: {{ guideScoreMiniForm.studentName }} - MSSV: {{ guideScoreMiniForm.mssv }}
              </p>
              <p class="mt-1">
                Đề tài:
                <span class="font-semibold">{{ guideScoreMiniForm.TenDeTai }}</span>
              </p>
            </div>

            <div class="max-h-[60vh] overflow-y-auto pr-2">
              <!-- Nhận xét tổng quát -->
              <div class="mb-6">
                <div class="flex items-center gap-4 mb-2">
                  <label class="block text-center font-medium text-indigo-600 mb-2">
                    Nhận xét chung:
                  </label>
                  <label class="flex items-center gap-2">
                    <input type="radio" value="Đạt" v-model="guideScoreMiniForm.overall" /> Đạt
                  </label>
                  <label class="flex items-center gap-2">
                    <input type="radio" value="Không đạt" v-model="guideScoreMiniForm.overall" /> Không đạt
                  </label>
                </div>
                <textarea
                  v-model="guideScoreMiniForm.overallNote"
                  rows="3"
                  class="w-full border rounded p-3 resize-none"
                ></textarea>
              </div>

              <!-- Ưu điểm chính -->
              <div class="mb-6">
                <label class="block text-center font-medium text-indigo-600 mb-2">
                  Ưu điểm chính
                </label>
                <textarea
                  v-model="guideScoreMiniForm.strengths"
                  rows="3"
                  class="w-full border rounded p-3 resize-none"
                ></textarea>
              </div>

              <!-- Thiếu sót chính -->
              <div class="mb-6">
                <label class="block text-center font-medium text-indigo-600 mb-2">
                  Thiếu sót chính
                </label>
                <textarea
                  v-model="guideScoreMiniForm.weaknesses"
                  rows="3"
                  class="w-full border rounded p-3 resize-none"
                ></textarea>
              </div>

              <!-- Table criteria -->
              <div class="mb-6">
                <table class="w-full border-collapse">
                  <thead>
                    <tr class="bg-gray-100">
                      <th class="p-3 border text-center">STT</th>
                      <th class="p-3 border text-left">Nội dung</th>
                      <th class="p-3 border text-center">Điểm tối đa</th>
                      <th class="p-3 border text-center">Điểm</th>
                      <th class="p-3 border text-left">Ghi chú</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="(c, i) in guideScoreMiniForm.criteria" :key="i">
                      <td class="p-3 border text-center align-top">{{ i + 1 }}</td>
                      <td class="p-3 border align-top">{{ c.title }}</td>
                      <td class="p-3 border text-center align-top">{{ c.max }}</td>
                      <td class="p-3 border text-center align-top">
                        <input
                          v-model.number="c.score"
                          type="number"
                          :min="0"
                          :max="c.max"
                          class="w-20 border rounded p-1 text-center"
                        />
                      </td>
                      <td class="p-3 border align-top">
                        <textarea
                          v-model="c.note"
                          rows="2"
                          class="w-full border rounded p-2 resize-none"
                        ></textarea>
                      </td>
                    </tr>

                    <tr>
                      <td class="p-3 border font-semibold" colspan="2">
                        Tổng điểm {{ guideScoreMiniForm.studentName }}
                      </td>
                      <td class="p-3 border text-center font-semibold">
                        {{ totalGuideMax }}
                      </td>
                      <td class="p-3 border text-center font-semibold">
                        {{ totalGuideScore }}
                      </td>
                      <td class="p-3 border text-center">
                        {{ percentGuideScore }}%
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <!-- Câu hỏi cho sinh viên -->
              <div class="mb-6">
                <label class="block text-center font-medium text-indigo-600 mb-2">
                  Câu hỏi cho sinh viên (tối đa 2 câu)
                </label>
                <textarea
                  v-model="guideScoreMiniForm.questions"
                  rows="2"
                  class="w-full border rounded p-3 resize-none"
                ></textarea>
              </div>

              <!-- Đề nghị bảo vệ -->
              <div class="mb-6">
                <label class="block text-center font-medium text-indigo-600 mb-2">
                  Đề nghị bảo vệ
                </label>
                <div class="flex items-center justify-center gap-6">
                  <label>
                    <input
                      type="radio"
                      v-model="guideScoreMiniForm.recommend"
                      value="Được bảo vệ"
                    />
                    Được bảo vệ
                  </label>
                  <label>
                    <input
                      type="radio"
                      v-model="guideScoreMiniForm.recommend"
                      value="Không được bảo vệ"
                    />
                    Không được bảo vệ
                  </label>
                  <label>
                    <input
                      type="radio"
                      v-model="guideScoreMiniForm.recommend"
                      value="Bổ sung/hiệu chỉnh để được bảo vệ"
                    />
                    Bổ sung/hiệu chỉnh để được bảo vệ
                  </label>
                </div>
              </div>
            </div>

            <!-- Footer buttons -->
            <div class="flex items-center justify-end gap-4 mt-4">
              <button @click="closeGuideScoreMiniForm" class="px-4 py-2 rounded border">
                Đóng
              </button>
              <button @click="saveGuideScoreMiniForm" class="px-5 py-2 rounded bg-blue-500 text-white">
                Xác nhận 
              </button>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, reactive } from 'vue'
import { router } from '@inertiajs/vue3'
import axios from 'axios'

const showMenu = ref(false)
function toggleMenu() { showMenu.value = !showMenu.value }
function goProfile() { router.visit('/profile') }
function logout() { router.post(route('logout')) }

const props = defineProps({
  user: { type: Object, default: () => ({ name: 'Giảng viên' }) },
})
const user = props.user

// Sidebar view state
const currentView = ref('dashboard')
function setCurrentView(view) { currentView.value = view }

const students = ref([])
const allStudents = ref([])
const topics = ref([])

// Hover theo đề tài cho bảng điểm phản biện
const hoveredTopicKey = ref(null)

function topicKey(topic) {
  if (!topic) return ''
  return (topic.MaDT || topic.id || topic.maDT || '').toString()
}

function setHoveredTopic(topic) {
  hoveredTopicKey.value = topicKey(topic)
}

function clearHoveredTopic() {
  hoveredTopicKey.value = null
}

function isTopicHovered(topic) {
  return hoveredTopicKey.value !== null &&
         hoveredTopicKey.value === topicKey(topic)
}

// fetchers
async function fetchStudents() {
  try {
    const teacher = await axios.post('/teacher-by-id/' + user.id)

    const [resTeacher, resAll] = await Promise.all([
      axios.post('/students-by-teacher/' + teacher.data.MaGV),
      axios.post('/students/getAll')
    ])

    students.value = resTeacher.data || []
    allStudents.value = resAll.data || []
  } catch (e) { console.error(e) }
}

async function fetchTopics() {
  try {
    const teacher = await axios.post('/teacher-by-id/' + user.id)
    const res = await axios.get('/topics-by-teacher/' + teacher.data.MaGV)
    topics.value = res.data || []
  } catch (e) { console.error(e) }
}

onMounted(() => { fetchStudents(); fetchTopics() })

// Lấy danh sách sinh viên thuộc 1 đề tài
function getStudentsOfTopic(topic) {
  if (!topic) return []

  // Nếu topic.students có sẵn
  if (Array.isArray(topic.students) && topic.students.length > 0) {
    return topic.students
      .map(s => ({
        mssv: s.MSSV || s.mssv || '',
        name: s.HoTen || s.name || s.fullName || ''
      }))
      .filter(s => s.mssv || s.name)
  }

  const topicName = (topic.TenDeTai || topic.TenDT || topic.title || '')
    .toString()
    .toLowerCase()
    .trim()

  const topicId = (topic.MaDT || topic.id || topic.maDT || topic.ma_dt || '')
    .toString()

  return (allStudents.value || [])
    .filter(s => {
      const stuTopicName = (s.topic || s.TenDeTai || s.TenDT || s.title || '')
        .toString()
        .toLowerCase()
        .trim()

      const stuTopicId = (s.MaDT || s.maDT || s.ma_dt || '').toString()

      const sameId = topicId && stuTopicId && topicId === stuTopicId
      const sameName = topicName && stuTopicName && topicName === stuTopicName

      return sameId || sameName
    })
    .map(s => ({
      mssv: s.mssv || s.MSSV || '',
      name: s.name || s.HoTen || s.Ho_va_Ten || ''
    }))
    .filter(s => s.mssv || s.name)
}

// ======================
// Review & Guide lists
// ======================
const reviewScoreSearch = ref('')
const reviewScoreList = computed(() => {
  const q = (reviewScoreSearch.value || '').toString().toLowerCase().trim()
  return (topics.value || []).filter(t => {
    if (!q) return true
    return (
      ((t.MaDT || t.id || '') + ' ' + (t.TenDeTai || t.TenDT || t.title || ''))
        .toLowerCase()
        .includes(q)
    )
  })
})

const guideScoreSearch = ref('')
const guideScoreList = computed(() => {
  const q = (guideScoreSearch.value || '').toString().toLowerCase().trim()
  return (topics.value || []).filter(t => {
    if (!q) return true
    return (
      ((t.MaDT || t.id || '') + ' ' + (t.TenDeTai || t.TenDT || t.title || ''))
        .toLowerCase()
        .includes(q)
    )
  })
})

const reviewScoreRows = computed(() => {
  const result = []
  let sttCounter = 0

  const filteredTopics = reviewScoreList.value || []

  filteredTopics.forEach(topic => {
    let stuArr = getStudentsOfTopic(topic).map(s => ({
      MSSV: s.mssv,
      name: s.name
    }))

    if (stuArr.length === 0) {
      stuArr.push({ MSSV: '', name: '' })
    }

    sttCounter += 1
    const rowSpan = stuArr.length

    stuArr.forEach((stu, index) => {
      result.push({
        topic,
        isFirst: index === 0,      
        rowSpan,                  
        stt: index === 0 ? sttCounter : null,
        MSSV: stu.MSSV,
        name: stu.name
      })
    })
  })

  return result
})

const showReviewScoreMiniForm = ref(false)
const reviewScoreMiniForm = reactive({
  studentName: '',
  mssv: '',
  Lop: '',
  TenDeTai: '',
  groupMembers: '',
  groupStudents: [],     // <<< danh sách SV trong nhóm
  reviewerName: user?.name || '',
  MaDT: '',
  overall: 'Đạt',
  overallNote: '',
  strengths: '',
  weaknesses: '',
  criteria: [
    { title: 'Phân tích vấn đề', max: 2.5, score: 0, note: '' },
    { title: 'Thiết kế vấn đề', max: 2.5, score: 0, note: '' },
    { title: 'Hiện thực vấn đề', max: 2.5, score: 0, note: '' },
    { title: 'Kiểm tra sản phẩm', max: 2.5, score: 0, note: '' }
  ],
  questions: '',
  recommend: 'Bổ sung/hiệu chỉnh để được bảo vệ'
})

function openReviewScoreMiniForm(topic, MSSVFromRow = '', nameFromRow = '') {
  reviewScoreMiniForm.TenDeTai = topic.TenDeTai || topic.TenDT || topic.title || ''
  reviewScoreMiniForm.MaDT = topic.MaDT || topic.id || ''
  reviewScoreMiniForm.groupMembers = topic.groupMembers || topic.members || ''

  let mssv = MSSVFromRow || topic.mssv || topic.MSSV || ''
  if (!mssv && Array.isArray(topic.students) && topic.students.length > 0) {
    mssv = topic.students[0]?.MSSV || topic.students[0]?.mssv || ''
  }
  reviewScoreMiniForm.mssv = mssv

  let student = null
  if (mssv) {
    student = (allStudents.value || []).find(s => (s.mssv || s.MSSV) == mssv)
  }

  if (student) {
    reviewScoreMiniForm.studentName = student.name || student.HoTen || nameFromRow || ''
    reviewScoreMiniForm.Lop = student.Lop || ''
  } else {
    reviewScoreMiniForm.studentName = nameFromRow || topic.studentName || topic.HoTen || ''
    reviewScoreMiniForm.Lop = topic.Lop || ''
  }

  // Lấy đầy đủ thành viên trong nhóm
  const groupStu = getStudentsOfTopic(topic)
  if (groupStu.length > 0) {
    reviewScoreMiniForm.groupStudents = groupStu
  } else {
    reviewScoreMiniForm.groupStudents = [{
      name: reviewScoreMiniForm.studentName,
      mssv: reviewScoreMiniForm.mssv
    }]
  }

  const data = topic.reviewData || null
  if (data) {
    reviewScoreMiniForm.overall = data.overall || 'Đạt'
    reviewScoreMiniForm.overallNote = data.overallNote || ''
    reviewScoreMiniForm.strengths = data.strengths || ''
    reviewScoreMiniForm.weaknesses = data.weaknesses || ''
    reviewScoreMiniForm.questions = data.questions || ''
    reviewScoreMiniForm.recommend = data.recommend || 'Bổ sung/hiệu chỉnh để được bảo vệ'
    reviewScoreMiniForm.criteria.forEach((c, idx) => {
      const d = data.criteria?.[idx]
      if (d) {
        c.score = d.score ?? 0
        c.note = d.note ?? ''
      } else {
        c.score = 0
        c.note = ''
      }
    })
  } else {
    reviewScoreMiniForm.overall = 'Đạt'
    reviewScoreMiniForm.overallNote = ''
    reviewScoreMiniForm.strengths = ''
    reviewScoreMiniForm.weaknesses = ''
    reviewScoreMiniForm.questions = ''
    reviewScoreMiniForm.recommend = 'Bổ sung/hiệu chỉnh để được bảo vệ'
    reviewScoreMiniForm.criteria.forEach(c => { c.score = 0; c.note = '' })
  }

  showReviewScoreMiniForm.value = true
}

function closeReviewScoreMiniForm() { showReviewScoreMiniForm.value = false }

const totalReviewMax = computed(() =>
  reviewScoreMiniForm.criteria.reduce((s, c) => s + (Number(c.max) || 0), 0)
)
const totalReviewScore = computed(() =>
  reviewScoreMiniForm.criteria.reduce((s, c) => s + (Number(c.score) || 0), 0)
)
const percentReviewScore = computed(() =>
  Math.round((totalReviewScore.value / (totalReviewMax.value || 1)) * 100)
)

async function saveReviewScoreMiniForm() {
  for (const c of reviewScoreMiniForm.criteria) {
    if (c.score < 0) {
      alert('Điểm không được âm')
      return
    }
    if (c.score > c.max) {
      alert(`Điểm mục "${c.title}" không được vượt quá ${c.max}`)
      return
    }
  }

  const payload = {
    MaDT: reviewScoreMiniForm.MaDT,
    MSSV: reviewScoreMiniForm.mssv,
    overall: reviewScoreMiniForm.overall,
    overallNote: reviewScoreMiniForm.overallNote,
    strengths: reviewScoreMiniForm.strengths,
    weaknesses: reviewScoreMiniForm.weaknesses,
    criteria: reviewScoreMiniForm.criteria.map(c => ({
      title: c.title,
      max: c.max,
      score: c.score,
      note: c.note
    })),
    questions: reviewScoreMiniForm.questions,
    recommend: reviewScoreMiniForm.recommend,
    mode: 'review'
  }

  try {
    const res = await axios.post('/save-review-score', payload, {
      responseType: 'blob'
    })

    const contentType = res.headers['content-type'] || 'application/octet-stream'
    const blob = new Blob([res.data], { type: contentType })
    const url = window.URL.createObjectURL(blob)

    let ext = 'docx'
    if (contentType.includes('pdf')) ext = 'pdf'
    const fileName = `phieu-phan-bien-${reviewScoreMiniForm.mssv || reviewScoreMiniForm.MaDT || 'detai'}.${ext}`

    const link = document.createElement('a')
    link.href = url
    link.download = fileName
    document.body.appendChild(link)
    link.click()
    link.remove()
    window.URL.revokeObjectURL(url)

    showReviewScoreMiniForm.value = false
    await fetchTopics()
    await fetchStudents()
  } catch (e) {
    console.error(e)
    alert('Lỗi khi lưu / xuất phiếu phản biện')
  }
}

const showGuideScoreMiniForm = ref(false)
const guideScoreMiniForm = reactive({
  studentName: '',
  mssv: '',
  Lop: '',
  TenDeTai: '',
  groupMembers: '',
  groupStudents: [],     // <<< danh sách SV trong nhóm
  reviewerName: user?.name || '',
  MaDT: '',
  overall: 'Đạt',
  overallNote: '',
  strengths: '',
  weaknesses: '',
  criteria: [
    { title: 'Phân tích vấn đề', max: 2.5, score: 0, note: '' },
    { title: 'Thiết kế vấn đề', max: 2.5, score: 0, note: '' },
    { title: 'Hiện thực vấn đề', max: 2.5, score: 0, note: '' },
    { title: 'Kiểm tra sản phẩm', max: 2.5, score: 0, note: '' }
  ],
  questions: '',
  recommend: 'Bổ sung/hiệu chỉnh để được bảo vệ'
})

function openGuideScoreMiniForm(topic) {
  guideScoreMiniForm.TenDeTai = topic.TenDeTai || topic.TenDT || topic.title || ''
  guideScoreMiniForm.MaDT = topic.MaDT || topic.id || ''
  guideScoreMiniForm.groupMembers = topic.groupMembers || topic.members || ''

  let mssv = topic.mssv || topic.MSSV || ''
  if (!mssv && Array.isArray(topic.students) && topic.students.length > 0) {
    mssv = topic.students[0]?.MSSV || topic.students[0]?.mssv || ''
  }
  guideScoreMiniForm.mssv = mssv

  let student = null
  if (mssv) {
    student = (allStudents.value || []).find(s => (s.mssv || s.MSSV) == mssv)
  }

  if (student) {
    guideScoreMiniForm.studentName = student.name || student.HoTen || ''
    guideScoreMiniForm.Lop = student.Lop || ''
  } else {
    guideScoreMiniForm.studentName = topic.studentName || topic.HoTen || ''
    guideScoreMiniForm.Lop = topic.Lop || ''
  }

  const groupStu = getStudentsOfTopic(topic)
  if (groupStu.length > 0) {
    guideScoreMiniForm.groupStudents = groupStu
  } else {
    guideScoreMiniForm.groupStudents = [{
      name: guideScoreMiniForm.studentName,
      mssv: guideScoreMiniForm.mssv
    }]
  }

  const data = topic.guideData || null
  if (data) {
    guideScoreMiniForm.overall = data.overall || 'Đạt'
    guideScoreMiniForm.overallNote = data.overallNote || ''
    guideScoreMiniForm.strengths = data.strengths || ''
    guideScoreMiniForm.weaknesses = data.weaknesses || ''
    guideScoreMiniForm.questions = data.questions || ''
    guideScoreMiniForm.recommend = data.recommend || 'Bổ sung/hiệu chỉnh để được bảo vệ'
    guideScoreMiniForm.criteria.forEach((c, idx) => {
      const d = data.criteria?.[idx]
      if (d) {
        c.score = d.score ?? 0
        c.note = d.note ?? ''
      } else {
        c.score = 0
        c.note = ''
      }
    })
  } else {
    guideScoreMiniForm.overall = 'Đạt'
    guideScoreMiniForm.overallNote = ''
    guideScoreMiniForm.strengths = ''
    guideScoreMiniForm.weaknesses = ''
    guideScoreMiniForm.questions = ''
    guideScoreMiniForm.recommend = 'Bổ sung/hiệu chỉnh để được bảo vệ'
    guideScoreMiniForm.criteria.forEach(c => { c.score = 0; c.note = '' })
  }

  showGuideScoreMiniForm.value = true
}

function closeGuideScoreMiniForm() { showGuideScoreMiniForm.value = false }

const totalGuideMax = computed(() =>
  guideScoreMiniForm.criteria.reduce((s, c) => s + (Number(c.max) || 0), 0)
)
const totalGuideScore = computed(() =>
  guideScoreMiniForm.criteria.reduce((s, c) => s + (Number(c.score) || 0), 0)
)
const percentGuideScore = computed(() =>
  Math.round((totalGuideScore.value / (totalGuideMax.value || 1)) * 100)
)

async function saveGuideScoreMiniForm() {
  for (const c of guideScoreMiniForm.criteria) {
    if (c.score < 0) {
      alert('Điểm không được âm')
      return
    }
    if (c.score > c.max) {
      alert(`Điểm mục "${c.title}" không được vượt quá ${c.max}`)
      return
    }
  }

  const payload = {
    MaDT: guideScoreMiniForm.MaDT,
    MSSV: guideScoreMiniForm.mssv,
    overall: guideScoreMiniForm.overall,
    overallNote: guideScoreMiniForm.overallNote,
    strengths: guideScoreMiniForm.strengths,
    weaknesses: guideScoreMiniForm.weaknesses,
    criteria: guideScoreMiniForm.criteria.map(c => ({
      title: c.title,
      max: c.max,
      score: c.score,
      note: c.note
    })),
    questions: guideScoreMiniForm.questions,
    recommend: guideScoreMiniForm.recommend,
    mode: 'guide'
  }

  try {
    const res = await axios.post('/save-guide-score', payload, {
      responseType: 'blob'
    })

    const contentType = res.headers['content-type'] || 'application/octet-stream'
    const blob = new Blob([res.data], { type: contentType })
    const url = window.URL.createObjectURL(blob)

    let ext = 'docx'
    if (contentType.includes('pdf')) ext = 'pdf'
    const fileName = `phieu-huong-dan-${guideScoreMiniForm.mssv || guideScoreMiniForm.MaDT || 'detai'}.${ext}`

    const link = document.createElement('a')
    link.href = url
    link.download = fileName
    document.body.appendChild(link)
    link.click()
    link.remove()
    window.URL.revokeObjectURL(url)

    showGuideScoreMiniForm.value = false
    await fetchTopics()
    await fetchStudents()
  } catch (e) {
    console.error(e)
    alert('Lỗi khi lưu / xuất phiếu hướng dẫn')
  }
}

const showForm = ref(false)
const formMode = ref('add')
const formData = reactive({
  TenDT: '',
  MoTa: '',
  TrangThai: ''
})
const displayedTopics = computed(() => topics.value || [])

function openAssignForm(t) { /* TODO: implement nếu cần */ }
function downloadTemplate(code) { /* TODO: implement nếu cần */ }
function saveForm() { /* TODO: implement nếu cần */ }
function closeForm() { showForm.value = false }

const evaluationSearch = ref('')
const filteredEvaluationList = ref([])

function updateScore(student) { /* implement nếu cần */ }
function updateNote(student) { /* implement nếu cần */ }
function updateGroup(student) { /* implement nếu cần */ }

</script>