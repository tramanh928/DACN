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
                <tr v-for="(s, idx) in students1" :key="s.mssv || s.id || idx" class="hover:bg-indigo-50">
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
                  <tr v-if="guideScoreList.length === 0">
                    <td colspan="7" class="p-4 text-center text-gray-500">
                      Chưa có phân công đề tài
                    </td>
                  </tr>

                  <tr
                    v-for="(row, idx) in guideScoreList"
                    :key="(row.topic.MaDT || row.topic.id || 't') + '-' + idx"
                  >
                    <td class="p-3 text-center">
                      {{ row.MSSV || '-' }}
                    </td>

                    <td class="p-3 text-center">
                      {{ row.name || '-' }}
                    </td>

                    <td class="p-3 text-center">
                      {{ row.group || '-' }}
                    </td>

                    <td
                      v-if="row.isFirst"
                      class="p-3 text-center"
                      :rowspan="row.rowSpan"
                    >
                      {{ row.topic.TenDeTai || row.topic.TenDT || row.topic.title || '-' }}
                    </td>

                    <td
                      v-if="row.isFirst"
                      class="p-3 text-center"
                      :rowspan="row.rowSpan"
                    >
                      {{ row.topic.MoTa || row.topic.description || '-' }}
                    </td>

                    <td
                      v-if="row.isFirst"
                      class="p-3 text-center"
                      :rowspan="row.rowSpan"
                    >
                      {{ row.topic.TrangThai || row.topic.status || '-' }}
                    </td>

                    <td
                      v-if="row.isFirst"
                      class="p-3 text-center"
                      :rowspan="row.rowSpan"
                    >
                      <div class="flex gap-2 justify-center">
                        <button
                          @click="openAssignForm(row.topic)"
                          type="button"
                          class="bg-blue-500 text-white px-3 py-1 rounded text-sm opacity-90"
                        >
                          Phân công
                        </button>

                        <button
                          @click="downloadTemplate(row.topic.MaDT || row.topic.code)"
                          type="button"
                          class="bg-indigo-500 text-white px-3 py-1 rounded text-sm opacity-90"
                        >
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
                <tr v-for="(s, idx) in students1" :key="s.mssv || s.id || idx" class="hover:bg-indigo-50">
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
          <div
    v-if="showReviewScoreMiniForm"
    class="fixed inset-0 z-50 bg-black bg-opacity-40 flex items-start justify-center overflow-auto">
    <div class="bg-white rounded-lg mt-8 mb-8 p-6 w-[92%] max-w-[980px] shadow-lg">
      <!-- Header -->
      <div class="flex justify-between items-start mb-4">
        <h3 class="text-xl font-bold text-indigo-600 text-center w-full">
          Phiếu chấm điểm phản biện
        </h3>
        <button @click="closeReviewScoreMiniForm" class="text-gray-500 absolute right-8 top-6">
          ✕
        </button>
      </div>

      <!-- Group info -->
      <div class="text-center mb-6">
        <p class="text-sm mb-1">Thành viên trong nhóm:</p>
        <div class="font-medium text-sm">
          <p v-for="mem in reviewScoreMiniForm.students" :key="mem.mssv">
            {{ mem.name }} - MSSV: {{ mem.mssv }}
          </p>
        </div>

        <p class="mt-2">
          Đề tài:
          <span class="font-semibold">{{ reviewScoreMiniForm.TenDeTai }}</span>
        </p>
      </div>

      <!-- ================= NHẬN XÉT CHUNG (1 LẦN) ================= -->
      <div class="border rounded-lg p-5 mb-8 bg-indigo-50">
        <p class="text-center font-semibold mb-4 text-indigo-700">
          Nhận xét chung cho nhóm
        </p>

        <!-- Đạt / Không đạt -->
        <div class="flex justify-center gap-8 mb-4">
          <label>
            <input type="radio" value="Đạt" v-model="reviewScoreMiniForm.shared.overall" />
            Đạt
          </label>
          <label>
            <input type="radio" value="Không đạt" v-model="reviewScoreMiniForm.shared.overall" />
            Không đạt
          </label>
        </div>

        <!-- Điều chỉnh -->
        <div class="mb-4">
          <label class="block text-center font-medium text-indigo-600 mb-2">
            Yêu cầu điều chỉnh, thay đổi, bổ sung
          </label>
          <textarea
            v-model="reviewScoreMiniForm.shared.overallNote"
            rows="3"
            class="w-full border rounded p-3 resize-none"
          ></textarea>
        </div>

        <!-- Ưu điểm -->
        <div class="mb-4">
          <label class="block text-center font-medium text-indigo-600 mb-2">
            Ưu điểm chính
          </label>
          <textarea
            v-model="reviewScoreMiniForm.shared.strengths"
            rows="3"
            class="w-full border rounded p-3 resize-none"
          ></textarea>
        </div>

        <!-- Nhược điểm -->
        <div class="mb-4">
          <label class="block text-center font-medium text-indigo-600 mb-2">
            Thiếu sót chính
          </label>
          <textarea
            v-model="reviewScoreMiniForm.shared.weaknesses"
            rows="3"
            class="w-full border rounded p-3 resize-none"
          ></textarea>
        </div>

        <!-- Câu hỏi -->
        <div>
          <label class="block text-center font-medium text-indigo-600 mb-2">
            Câu hỏi cho sinh viên
          </label>
          <textarea
            v-model="reviewScoreMiniForm.shared.questions"
            rows="2"
            class="w-full border rounded p-3 resize-none"
          ></textarea>
        </div>
      </div>

      <!-- ================= CHẤM RIÊNG TỪNG SINH VIÊN ================= -->
      <div
        v-for="mem in reviewScoreMiniForm.students"
        :key="mem.mssv"
        class="border rounded-lg p-4 mb-6"
      >
        <p class="text-center font-semibold mb-4">
          Chấm cho: {{ mem.name }} - MSSV: {{ mem.mssv }}
        </p>

        <!-- Criteria -->
        <table class="w-full border mb-4">
          <thead>
            <tr class="bg-gray-100">
              <th class="p-2 border">STT</th>
              <th class="p-2 border">Nội dung</th>
              <th class="p-2 border text-center">Điểm tối đa</th>
              <th class="p-2 border text-center">Điểm</th>
              <th class="p-2 border text-center">Điểm theo phần trăm</th>
              <th class="p-2 border">Ghi chú</th>
            </tr>
          </thead>

          <tbody>
            <tr v-for="(c, idx) in mem.criteria" :key="idx">
              <td class="border p-2 text-center">{{ idx + 1 }}</td>
              <td class="border p-2">{{ c.title }}</td>
              <td class="border p-2 text-center">{{ c.max }}</td>
              <td class="border p-2 text-center">
                <input
                  type="number"
                  v-model.number="c.score"
                  min="0"
                  :max="c.max"
                  class="w-16 border rounded text-center"
                  @input="onScoreInput($event, c)"
                />
              </td>
              <td class="border p-2 text-center">{{ c.score*10 }}%</td>
              <td class="border p-2">
                <textarea
                  v-model="c.note"
                  rows="2"
                  class="w-full border rounded resize-none"
                ></textarea>
              </td>
            </tr>
          </tbody>
          <tr>
              <td class="p-3 border font-semibold" colspan="2">
               Tổng điểm:
              </td>
              <td class="p-3 border text-center font-semibold">
               {{ totalGuideMaxOfStudent(mem) }}
               </td>
               <td class="p-3 border text-center font-semibold">
                {{ totalGuideScoreOfStudent(mem) }}
               </td>
               <td class="p-3 border text-center">
                {{ percentGuideScoreOfStudent(mem) }}%
               </td>
               </tr>
        </table>

        <!-- Đề nghị -->
        <div class="mb-4">
          <label class="block text-center font-medium text-indigo-600 mb-2">
            Đề nghị bảo vệ
          </label>
          <div class="flex justify-center gap-6">
            <label>
              <input type="radio" value="Được bảo vệ" v-model="mem.recommend" />
              Được bảo vệ
            </label>
            <label>
              <input type="radio" value="Không được bảo vệ" v-model="mem.recommend" />
              Không được bảo vệ
            </label>
            <label>
              <input
                type="radio"
                value="Bổ sung/hiệu chỉnh để được bảo vệ"
                v-model="mem.recommend"
              />
              Bổ sung/hiệu chỉnh
            </label>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <div class="flex justify-end gap-4">
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
                  <th class="p-3 text-center">MSSV</th>
                  <th class="p-3 text-center">Họ và tên sinh viên</th>
                  <th class="p-3 text-center">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(row, idx) in guideScoreList"
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
                        @click="openGuideScoreMiniForm(row.topic, row.MSSV, row.name)"
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
        <div
          v-if="showGuideScoreMiniForm"
          class="fixed inset-0 z-50 bg-black bg-opacity-40 flex items-start justify-center overflow-auto"
        >
          <div class="bg-white rounded-lg mt-8 mb-8 p-6 w-[92%] max-w-[980px] shadow-lg">
            <!-- Header -->
            <div class="flex justify-between items-start mb-4">
              <h3 class="text-xl font-bold text-indigo-600 text-center w-full">
                Phiếu chấm điểm hướng dẫn
              </h3>
              <button @click="closeGuideScoreMiniForm" class="text-gray-500 absolute right-8 top-6">
                ✕
              </button>
            </div>

            <!-- Group info -->
            <div class="text-center mb-6">
              <p class="text-sm mb-1">Thành viên trong nhóm:</p>
              <div class="font-medium text-sm">
                <p v-for="mem in guideScoreMiniForm.students" :key="mem.mssv">
                  {{ mem.name }} - MSSV: {{ mem.mssv }}
                </p>
              </div>
              <p class="mt-2">
                Đề tài:
                <span class="font-semibold">{{ guideScoreMiniForm.TenDeTai }}</span>
              </p>
            </div>

            <!-- ================= NHẬN XÉT CHUNG (1 LẦN) ================= -->
            <div class="border rounded-lg p-5 mb-8 bg-indigo-50">
              <p class="text-center font-semibold mb-4 text-indigo-700">
                Nhận xét chung cho nhóm
              </p>

              <!-- Đạt / Không đạt -->
              <div class="flex justify-center gap-8 mb-4">
                <label>
                  <input type="radio" value="Đạt" v-model="guideScoreMiniForm.shared.overall" />
                  Đạt
                </label>
                <label>
                  <input type="radio" value="Không đạt" v-model="guideScoreMiniForm.shared.overall" />
                  Không đạt
                </label>
              </div>

              <!-- Điều chỉnh -->
              <div class="mb-4">
                <label class="block text-center font-medium text-indigo-600 mb-2">
                  Yêu cầu điều chỉnh, thay đổi, bổ sung
                </label>
                <textarea
                  v-model="guideScoreMiniForm.shared.overallNote"
                  rows="3"
                  class="w-full border rounded p-3 resize-none"
                ></textarea>
              </div>

              <!-- Ưu điểm -->
              <div class="mb-4">
                <label class="block text-center font-medium text-indigo-600 mb-2">
                  Ưu điểm chính
                </label>
                <textarea
                  v-model="guideScoreMiniForm.shared.strengths"
                  rows="3"
                  class="w-full border rounded p-3 resize-none"
                ></textarea>
              </div>

              <!-- Nhược điểm -->
              <div class="mb-4">
                <label class="block text-center font-medium text-indigo-600 mb-2">
                  Thiếu sót chính
                </label>
                <textarea
                  v-model="guideScoreMiniForm.shared.weaknesses"
                  rows="3"
                  class="w-full border rounded p-3 resize-none"
                ></textarea>
              </div>

              <!-- Câu hỏi -->
              <div>
                <label class="block text-center font-medium text-indigo-600 mb-2">
                  Câu hỏi cho sinh viên
                </label>
                <textarea
                  v-model="guideScoreMiniForm.shared.questions"
                  rows="2"
                  class="w-full border rounded p-3 resize-none"
                ></textarea>
              </div>
            </div>

            <!-- ================= CHẤM RIÊNG TỪNG SINH VIÊN ================= -->
            <div
              v-for="mem in guideScoreMiniForm.students"
              :key="mem.mssv"
              class="border rounded-lg p-4 mb-6"
            >
              <p class="text-center font-semibold mb-4">
                Chấm cho: {{ mem.name }} - MSSV: {{ mem.mssv }}
              </p>

              <!-- Criteria -->
              <table class="w-full border mb-4">
                <thead>
                  <tr class="bg-gray-100">
                    <th class="p-2 border">STT</th>
                    <th class="p-2 border">Nội dung</th>
                    <th class="p-2 border text-center">Điểm tối đa</th>
                    <th class="p-2 border text-center">Điểm</th>
                    <th class="p-2 border text-center">Điểm theo phần trăm</th>
                    <th class="p-2 border">Ghi chú</th>
                  </tr>
                </thead>

                <tbody>
                  <tr v-for="(c, idx) in mem.criteria" :key="idx">
                    <td class="border p-2 text-center">{{ idx + 1 }}</td>
                    <td class="border p-2">{{ c.title }}</td>
                    <td class="border p-2 text-center">{{ c.max }}</td>
                    <td class="border p-2 text-center">
                      <input
                        type="number"
                        v-model.number="c.score"
                        min="0"
                        :max="c.max"
                        class="w-16 border rounded text-center"
                      />
                    </td>
                    <td class="border p-2 text-center">{{ c.score*10 }}%</td>
                    <td class="border p-2">
                      <textarea
                        v-model="c.note"
                        rows="2"
                        class="w-full border rounded resize-none"
                      ></textarea>
                    </td>
                  </tr>
                  <tr>
                    <td class="p-3 border font-semibold" colspan="2">Tổng điểm:</td>
                    <td class="p-3 border text-center font-semibold">{{ totalGuideMaxOfStudent(mem) }}</td>
                    <td class="p-3 border text-center font-semibold">{{ totalGuideScoreOfStudent(mem) }}</td>
                    <td class="p-3 border text-center">{{ percentGuideScoreOfStudent(mem) }}%</td>
                    <td class="border"></td>
                  </tr>
                </tbody>
              </table>

              <!-- Đề nghị -->
              <div class="mb-4">
                <label class="block text-center font-medium text-indigo-600 mb-2">
                  Đề nghị bảo vệ
                </label>
                <div class="flex justify-center gap-6">
                  <label>
                    <input type="radio" value="Được bảo vệ" v-model="mem.recommend" /> Được bảo vệ
                  </label>
                  <label>
                    <input type="radio" value="Không được bảo vệ" v-model="mem.recommend" /> Không được bảo vệ
                  </label>
                  <label>
                    <input type="radio" value="Bổ sung/hiệu chỉnh để được bảo vệ" v-model="mem.recommend" />
                    Bổ sung/hiệu chỉnh
                  </label>
                </div>
              </div>
            </div>

            <!-- Footer -->
            <div class="flex justify-end gap-4">
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
const students1 = ref([])
const studentsReviewer = ref([])
const topics = ref([])
const topicsReview = ref([])

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

const normalizeStudent = (s, role) => {
  const rawGroup = s.group ?? s.Nhom ?? null
  let displayGroup = rawGroup

  if (typeof rawGroup === 'string' && rawGroup.includes('-')) {
    displayGroup = rawGroup.split('-')[1]
  }

  return {
    ...s,
    role,                 
    group: displayGroup
  }
}

const fetchStudents = async () => {
  try {
    const teacherRes = await axios.post(
      '/teacher-by-id/' + (user?.id || props.user.id)
    )

    const MaGV = teacherRes.data?.MaGV
    if (!MaGV) return

    const [resTeacher, resReviewer] = await Promise.all([
      axios.post('/students-by-teacher/' + MaGV),
      axios.post('/students-by-reviewer/' + MaGV)
    ])

    const guideStudents = (resTeacher.data || [])
      .map(s => normalizeStudent(s, 'guide'))

    const reviewerStudents = (resReviewer.data || [])
      .map(s => normalizeStudent(s, 'reviewer'))

    const mergedMap = new Map()

    ;[...guideStudents, ...reviewerStudents].forEach(s => {
      if (!mergedMap.has(s.mssv)) {
        mergedMap.set(s.mssv, s)
      }
    })
    students1.value = guideStudents.sort((a, b) => Number(a.group ?? 0) - Number(b.group ?? 0)) || []
    students.value = Array.from(mergedMap.values())
      .sort((a, b) => Number(a.group ?? 0) - Number(b.group ?? 0))

    studentsReviewer.value = reviewerStudents

  } catch (err) {
    console.error('fetchStudents error:', err)
  }
}

async function fetchTopics() {
  try {
    const teacher = await axios.post('/teacher-by-id/' + user.id)
    const res = await axios.get('/topics-by-teacher/' + teacher.data.MaGV)
    const res1 = await axios.get('/topics-by-review-teacher/' + teacher.data.MaGV)
    topics.value = res.data || []
    topicsReview.value = res1.data || []
  } catch (e) { console.error(e) }
}

onMounted(() => { fetchStudents(); fetchTopics() })

function getStudentsOfTopic(topic) {
  if (!topic) return []

  const normalize = v =>
    String(v || '')
      .toLowerCase()
      .trim()

  if (Array.isArray(topic.students) && topic.students.length > 0) {
    return topic.students
      .map(s => ({
        mssv: s.MSSV ?? s.mssv ?? '',
        name: s.HoTen ?? s.name ?? s.fullName ?? '',
        group: s.group ?? ''
      }))
      .filter(s => s.mssv || s.name)
  }

  const topicId =
    topic.MaDT ??
    topic.id ??
    topic.DeTaiId ??
    null

  const topicName = normalize(
    topic.TenDeTai ??
    topic.TenDT ??
    topic.title ??
    ''
  )

  return (students.value || [])
    .filter(s => {
      const sameId =
        topicId != null &&
        (
          String(s.MaDT) === String(topicId) ||
          String(s.topicId) === String(topicId) ||
          String(s.DeTaiId) === String(topicId)
        )

      const sameName =
        topicName &&
        normalize(
          s.topic ??
          s.TenDeTai ??
          s.TenDT ??
          ''
        ) === topicName

      return sameId || sameName
    })
    .map(s => ({
      mssv: s.MSSV ?? s.mssv ?? '',
      name: s.HoTen ?? s.name ?? '',
      group: s.group ?? ''
    }))
    .filter(s => s.mssv || s.name)
}

function onScoreInput(e, c) {
  let val = Number(e.target.value)

  if (isNaN(val)) val = 0
  if (val < 0) val = 0
  if (val > c.max) val = c.max   // 2.5

  c.score = val
}

// ======================
// Review & Guide lists
// ======================
const reviewScoreSearch = ref('')
const reviewScoreList = computed(() => {
  const q = (reviewScoreSearch.value || '').toString().toLowerCase().trim()
  return (topicsReview.value || []).filter(t => {
    if (!q) return true
    return (
      ((t.MaDT || t.id || '') + ' ' + (t.TenDeTai || t.TenDT || t.title || ''))
        .toLowerCase()
        .includes(q)
    )
  })
})

const guidingScoreList = computed(() => {
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

const guideScoreSearch = ref('')
const guideScoreList = computed(() => {
  const result = []
  let sttCounter = 0

  const rows = []

  ;(guidingScoreList.value || []).forEach(topic => {
    const students = getStudentsOfTopic(topic)

    if (students.length === 0) {
      rows.push({
        topic,
        MSSV: '',
        name: '',
        group: '',
      })
      return
    }

    students.forEach(stu => {
      rows.push({
        topic,
        MSSV: stu.mssv,
        name: stu.name,
        group: stu.group,
      })
    })
  })

  rows.sort((a, b) => {
    const ga = Number(a.group) || 999
    const gb = Number(b.group) || 999
    return ga - gb
  })

  let lastTopic = null
  let topicStartIndex = 0

  rows.forEach((row, index) => {
    if (row.topic !== lastTopic) {
      sttCounter++
      row.isFirst = true
      row.stt = sttCounter
      row.rowSpan = 1
      topicStartIndex = index
    } else {
      row.isFirst = false
      row.stt = null
      rows[topicStartIndex].rowSpan++
    }

    lastTopic = row.topic
    result.push(row)
  })

  return result
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
  TenDeTai: '',
  MaDT: '',
  reviewerName: user?.name || '',

  shared: {
    overall: 'Đạt',
    overallNote: '',
    strengths: '',
    weaknesses: '',
    questions: ''
  },

  students: []
})

async function openReviewScoreMiniForm(topic) {
  reviewScoreMiniForm.TenDeTai =
    topic.TenDeTai || topic.TenDT || topic.title || ''

  reviewScoreMiniForm.MaDT =
    topic.MaDT || topic.id || ''

  const groupStu = getStudentsOfTopic(topic)

  reviewScoreMiniForm.shared = {
    overall: 'Đạt',
    overallNote: '',
    strengths: '',
    weaknesses: '',
    questions: ''
  }

  reviewScoreMiniForm.students = await Promise.all(
    (groupStu.length ? groupStu : [{
      name: topic.studentName || '',
      mssv: topic.mssv || ''
    }]).map(async (stu) => {

      let dbScore = null
      try {
        const res = await axios.get(`/diem-phan-bien/mssv/${stu.mssv}`)
        dbScore = res.data
      } catch (_) {
        dbScore = null 
      }

      if (dbScore) {
        reviewScoreMiniForm.shared.overall = dbScore.Danh_gia || 'Đạt'
        reviewScoreMiniForm.shared.overallNote = dbScore.dieu_chinh || ''
        reviewScoreMiniForm.shared.strengths = dbScore.uu || ''
        reviewScoreMiniForm.shared.weaknesses = dbScore.nhuoc || ''
        reviewScoreMiniForm.shared.questions = dbScore.cau_hoi || ''
      }

      return {
        name: stu.name,
        mssv: stu.mssv,

        recommend: dbScore?.bao_ve || 'Bổ sung/hiệu chỉnh để được bảo vệ',

        criteria: [
          {
            title: 'Phân tích vấn đề',
            max: 2.5,
            score: dbScore?.pttk ?? 0,
            note: extractNote(dbScore?.ghi_chu, 1)
          },
          {
            title: 'Thiết kế vấn đề',
            max: 2.5,
            score: dbScore?.tkvd ?? 0,
            note: extractNote(dbScore?.ghi_chu, 2)
          },
          {
            title: 'Hiện thực vấn đề',
            max: 2.5,
            score: dbScore?.htvd ?? 0,
            note: extractNote(dbScore?.ghi_chu, 3)
          },
          {
            title: 'Kiểm tra sản phẩm',
            max: 2.5,
            score: dbScore?.ktsp ?? 0,
            note: extractNote(dbScore?.ghi_chu, 4)
          }
        ]
      }
    })
  )

  showReviewScoreMiniForm.value = true
}

function extractNote(ghiChu, index) {
  if (!ghiChu) return ''

  const lines = ghiChu.split('\n').map(l => l.trim()).filter(l => l !== '')

  const titles = [
    'Phân tích vấn đề',
    'Thiết kế vấn đề',
    'Hiện thực vấn đề',
    'Kiểm tra sản phẩm'
  ]

  const targetTitle = titles[index - 1]

  for (const line of lines) {
    const match = line.match(/^\d+\.\s*(.*?):\s*(.*)$/)
    if (match) {
      const [, title, note] = match
      if (title === targetTitle) return note.trim()
    }
  }

  return ''
}

function closeReviewScoreMiniForm() { showReviewScoreMiniForm.value = false }

function totalReviewMaxOfStudent(stu) {
  return (stu.criteria || []).reduce(
    (s, c) => s + (Number(c.max) || 0),
    0
  )
}

function totalReviewScoreOfStudent(stu) {
  return (stu.criteria || []).reduce(
    (s, c) => s + (Number(c.score) || 0),
    0
  )
}

function percentReviewScoreOfStudent(stu) {
  const max = totalReviewMaxOfStudent(stu)
  const score = totalReviewScoreOfStudent(stu)
  return Math.round((score / (max || 1)) * 100)
}


async function saveReviewScoreMiniForm() {
  try {
    for (const mem of reviewScoreMiniForm.students) {

      for (const c of mem.criteria) {
        if (c.score < 0) {
          alert('Điểm không được âm')
          return
        }
        if (c.score > c.max) {
          alert(`Điểm mục "${c.title}" không được vượt quá ${c.max}`)
          return
        }
      }

      const ghiChu = mem.criteria
        .filter(c => c.note && c.note.trim() !== '')
        .map((c, i) => `${i + 1}. ${c.title}: ${c.note}`)
        .join('\n')

      const payload = {
        MaDT: reviewScoreMiniForm.MaDT,
        MSSV: mem.mssv,

        danh_gia: reviewScoreMiniForm.shared.overall,
        dieu_chinh: reviewScoreMiniForm.shared.overallNote,
        uu: reviewScoreMiniForm.shared.strengths,
        nhuoc: reviewScoreMiniForm.shared.weaknesses,
        cau_hoi: reviewScoreMiniForm.shared.questions,

        pttk: mem.criteria[0]?.score ?? null,
        tkvd: mem.criteria[1]?.score ?? null,
        htvd: mem.criteria[2]?.score ?? null,
        ktsp: mem.criteria[3]?.score ?? null,

        tong: totalReviewScoreOfStudent(mem),
        bao_ve: mem.recommend,
        ghi_chu: ghiChu,
      }

      await axios.post('/save-review-score', payload)
    }

    showReviewScoreMiniForm.value = false
    await fetchTopics()
    await fetchStudents()

    alert('Lưu phiếu phản biện thành công')

    window.open(`/export/phan-bien/${reviewScoreMiniForm.MaDT}`, '_blank')

  } catch (e) {
    console.error(e)
    alert('Lỗi khi lưu phiếu phản biện')
  }
}

const showGuideScoreMiniForm = ref(false)
const guideScoreMiniForm = reactive({
  TenDeTai: '',
  MaDT: '',
  reviewerName: user?.name || '',

  shared: {
    overall: 'Đạt',
    overallNote: '',
    strengths: '',
    weaknesses: '',
    questions: ''
  },

  students: []
})

async function openGuideScoreMiniForm(topic) {
  guideScoreMiniForm.TenDeTai =
    topic.TenDeTai || topic.TenDT || topic.title || ''

  guideScoreMiniForm.MaDT =
    topic.MaDT || topic.id || ''

  const groupStu = getStudentsOfTopic(topic)

  guideScoreMiniForm.shared = {
    overall: 'Đạt',
    overallNote: '',
    strengths: '',
    weaknesses: '',
    questions: ''
  }

  guideScoreMiniForm.students = await Promise.all(
    (groupStu.length ? groupStu : [{
      name: topic.studentName || '',
      mssv: topic.mssv || ''
    }]).map(async (stu) => {

      let dbScore = null
      try {
        const res = await axios.get(`/diem-huong-dan/mssv/${stu.mssv}`)
        dbScore = res.data
      } catch (_) {
        dbScore = null
      }

      if (dbScore) {
        guideScoreMiniForm.shared.overall = dbScore.Danh_gia || 'Đạt'
        guideScoreMiniForm.shared.overallNote = dbScore.dieu_chinh || ''
        guideScoreMiniForm.shared.strengths = dbScore.uu || ''
        guideScoreMiniForm.shared.weaknesses = dbScore.nhuoc || ''
        guideScoreMiniForm.shared.questions = dbScore.cau_hoi || ''
      }

      return {
        name: stu.name,
        mssv: stu.mssv,

        recommend: dbScore?.bao_ve || 'Bổ sung/hiệu chỉnh để được bảo vệ',

        criteria: [
          {
            title: 'Phân tích vấn đề',
            max: 2.5,
            score: dbScore?.pttk ?? 0,
            note: extractNote(dbScore?.ghi_chu, 1)
          },
          {
            title: 'Thiết kế vấn đề',
            max: 2.5,
            score: dbScore?.tkvd ?? 0,
            note: extractNote(dbScore?.ghi_chu, 2)
          },
          {
            title: 'Hiện thực vấn đề',
            max: 2.5,
            score: dbScore?.htvd ?? 0,
            note: extractNote(dbScore?.ghi_chu, 3)
          },
          {
            title: 'Kiểm tra sản phẩm',
            max: 2.5,
            score: dbScore?.ktsp ?? 0,
            note: extractNote(dbScore?.ghi_chu, 4)
          }
        ]
      }
    })
  )

  showGuideScoreMiniForm.value = true
}

function closeGuideScoreMiniForm() { showGuideScoreMiniForm.value = false }

function totalGuideMaxOfStudent(stu) {
  return (stu.criteria || []).reduce(
    (s, c) => s + (Number(c.max) || 0),
    0
  )
}

function totalGuideScoreOfStudent(stu) {
  return (stu.criteria || []).reduce(
    (s, c) => s + (Number(c.score) || 0),
    0
  )
}

function percentGuideScoreOfStudent(stu) {
  const max = totalGuideMaxOfStudent(stu)
  const score = totalGuideScoreOfStudent(stu)
  return Math.round((score / (max || 1)) * 100)
}


async function saveGuideScoreMiniForm() {
  try {
    for (const mem of guideScoreMiniForm.students) {
      for (const c of mem.criteria) {
        if (c.score < 0) {
          alert('Điểm không được âm')
          return
        }
        if (c.score > c.max) {
          alert(`Điểm mục "${c.title}" không được vượt quá ${c.max}`)
          return
        }
      }

      const ghiChu = mem.criteria
        .filter(c => c.note && c.note.trim() !== '')
        .map((c, i) => `${i + 1}. ${c.title}: ${c.note}`)
        .join('\n')

      const payload = {
        MaDT: guideScoreMiniForm.MaDT,
        MSSV: mem.mssv,

        danh_gia: guideScoreMiniForm.shared.overall,
        dieu_chinh: guideScoreMiniForm.shared.overallNote,
        uu: guideScoreMiniForm.shared.strengths,
        nhuoc: guideScoreMiniForm.shared.weaknesses,
        cau_hoi: guideScoreMiniForm.shared.questions,

        pttk: mem.criteria[0]?.score ?? null,
        tkvd: mem.criteria[1]?.score ?? null,
        htvd: mem.criteria[2]?.score ?? null,
        ktsp: mem.criteria[3]?.score ?? null,

        tong: totalGuideScoreOfStudent(mem),
        bao_ve: mem.recommend,
        ghi_chu: ghiChu,
        mode: 'guide'
      }

      await axios.post('/save-guide-score', payload)
    }

    showGuideScoreMiniForm.value = false
    await fetchTopics()
    await fetchStudents()

    alert('Lưu phiếu hướng dẫn thành công')

    window.open(`/export/huong-dan/${guideScoreMiniForm.MaDT}`, '_blank')

  } catch (e) {
    console.error(e)
    alert('Lỗi khi lưu phiếu hướng dẫn')
  }
}

const showForm = ref(false)
const formMode = ref('add')
const formData = reactive({
  TenDT: '',
  MoTa: '',
  TrangThai: ''
})
const topicSearch = ref('')

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
}function closeForm() { showForm.value = false }

const evaluationSearch = ref('')
const filteredEvaluationList = ref([])

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
</script>