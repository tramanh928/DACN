<script setup>
import { computed } from 'vue'
import GuestLayout from '@/Layouts/GuestLayout.vue'
import PrimaryButton from '@/Components/PrimaryButton.vue'
import { Head, Link, useForm } from '@inertiajs/vue3'

const props = defineProps({
  status: {
    type: String,
  },
})

const form = useForm({})

const submit = () => {
  form.post(route('verification.send'))
}

const verificationLinkSent = computed(
  () => props.status === 'verification-link-sent'
)
</script>

<template>
  <GuestLayout>
    <Head title="Xác thực email" />

    <!-- DESCRIPTION -->
    <div class="mb-4 text-sm text-gray-600 leading-relaxed">
      Cảm ơn bạn đã đăng ký tài khoản 🎓  
      Trước khi sử dụng hệ thống, vui lòng kiểm tra email và nhấp vào
      <span class="font-medium text-indigo-600">
        liên kết xác thực
      </span>
      mà chúng tôi vừa gửi cho bạn.  
      <br />
      Nếu bạn chưa nhận được email, bạn có thể yêu cầu gửi lại.
    </div>

    <!-- SUCCESS MESSAGE -->
    <div
      v-if="verificationLinkSent"
      class="mb-4 rounded-md bg-green-50 p-3 text-sm font-medium text-green-700"
    >
      ✅ Liên kết xác thực mới đã được gửi đến email của bạn.
    </div>

    <!-- ACTIONS -->
    <form @submit.prevent="submit">
      <div class="mt-6 flex items-center justify-between">
        <PrimaryButton
          class="bg-indigo-600 hover:bg-indigo-700 focus:ring-indigo-500"
          :class="{ 'opacity-50': form.processing }"
          :disabled="form.processing"
        >
          Gửi lại email xác thực
        </PrimaryButton>

        <Link
          :href="route('logout')"
          method="post"
          as="button"
          class="text-sm text-gray-600 underline hover:text-gray-900
                 focus:outline-none focus:ring-2 focus:ring-indigo-500
                 focus:ring-offset-2 rounded-md"
        >
          Đăng xuất
        </Link>
      </div>
    </form>
  </GuestLayout>
</template>
