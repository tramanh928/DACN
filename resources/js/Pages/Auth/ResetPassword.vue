<script setup>
import GuestLayout from '@/Layouts/GuestLayout.vue'
import InputError from '@/Components/InputError.vue'
import InputLabel from '@/Components/InputLabel.vue'
import PrimaryButton from '@/Components/PrimaryButton.vue'
import TextInput from '@/Components/TextInput.vue'
import { Head, useForm } from '@inertiajs/vue3'

const props = defineProps({
  email: {
    type: String,
    required: true,
  },
  token: {
    type: String,
    required: true,
  },
})

const form = useForm({
  token: props.token,
  email: props.email,
  password: '',
  password_confirmation: '',
})

const submit = () => {
  form.post(route('password.store'), {
    onFinish: () => form.reset('password', 'password_confirmation'),
  })
}
</script>

<template>
  <GuestLayout>
    <Head title="Đặt lại mật khẩu" />

    <form @submit.prevent="submit" class="space-y-5">
      <!-- EMAIL -->
      <div>
        <InputLabel for="email" value="Email đăng nhập" />

        <TextInput
          id="email"
          type="email"
          class="mt-1 block w-full rounded-md border-gray-300
                 focus:border-indigo-500 focus:ring-indigo-500"
          v-model="form.email"
          required
          autofocus
          autocomplete="username"
        />

        <InputError class="mt-2" :message="form.errors.email" />
      </div>

      <!-- NEW PASSWORD -->
      <div>
        <InputLabel for="password" value="Mật khẩu mới" />

        <TextInput
          id="password"
          type="password"
          class="mt-1 block w-full rounded-md border-gray-300
                 focus:border-indigo-500 focus:ring-indigo-500"
          v-model="form.password"
          required
          autocomplete="new-password"
        />

        <InputError class="mt-2" :message="form.errors.password" />
      </div>

      <!-- CONFIRM PASSWORD -->
      <div>
        <InputLabel
          for="password_confirmation"
          value="Xác nhận mật khẩu mới"
        />

        <TextInput
          id="password_confirmation"
          type="password"
          class="mt-1 block w-full rounded-md border-gray-300
                 focus:border-indigo-500 focus:ring-indigo-500"
          v-model="form.password_confirmation"
          required
          autocomplete="new-password"
        />

        <InputError
          class="mt-2"
          :message="form.errors.password_confirmation"
        />
      </div>

      <!-- ACTION -->
      <div class="flex justify-end">
        <PrimaryButton
          class="bg-indigo-600 hover:bg-indigo-700 focus:ring-indigo-500"
          :class="{ 'opacity-50': form.processing }"
          :disabled="form.processing"
        >
          Đặt lại mật khẩu
        </PrimaryButton>
      </div>
    </form>
  </GuestLayout>
</template>
