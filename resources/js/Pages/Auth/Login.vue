<script setup>
import Checkbox from '@/Components/Checkbox.vue'
import GuestLayout from '@/Layouts/GuestLayout.vue'
import InputError from '@/Components/InputError.vue'
import InputLabel from '@/Components/InputLabel.vue'
import PrimaryButton from '@/Components/PrimaryButton.vue'
import TextInput from '@/Components/TextInput.vue'
import { Head, Link, useForm } from '@inertiajs/vue3'

defineProps({
  canResetPassword: Boolean,
  status: String,
})

const form = useForm({
  email: '',
  password: '',
  remember: false,
})

const submit = () => {
  form.post(route('login'), {
    onFinish: () => form.reset('password'),
  })
}
</script>

<template>
  <GuestLayout>
    <Head title="Đăng nhập" />

    <!-- STATUS MESSAGE -->
    <div
      v-if="status"
      class="mb-4 rounded-md bg-green-50 border border-green-200 p-3 text-sm text-green-700"
    >
      {{ status }}
    </div>

    <form @submit.prevent="submit" class="space-y-5">
      <!-- EMAIL -->
      <div>
        <InputLabel for="email" value="Email đăng nhập" />

        <TextInput
          id="email"
          type="email"
          class="mt-1 block w-full rounded-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500"
          v-model="form.email"
          required
          autofocus
          autocomplete="username"
        />

        <InputError class="mt-2" :message="form.errors.email" />
      </div>

      <!-- PASSWORD -->
      <div>
        <InputLabel for="password" value="Mật khẩu" />

        <TextInput
          id="password"
          type="password"
          class="mt-1 block w-full rounded-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500"
          v-model="form.password"
          required
          autocomplete="current-password"
        />

        <InputError class="mt-2" :message="form.errors.password" />
      </div>

      <!-- REMEMBER -->
      <div class="flex items-center justify-between">
        <label class="flex items-center text-sm text-gray-600">
          <Checkbox v-model:checked="form.remember" />
          <span class="ml-2">Ghi nhớ đăng nhập</span>
        </label>

        <Link
          v-if="canResetPassword"
          :href="route('password.request')"
          class="text-sm text-indigo-600 hover:text-indigo-800 underline"
        >
          Quên mật khẩu?
        </Link>
      </div>

      <!-- SUBMIT -->
      <div>
        <PrimaryButton
          class="w-full justify-center bg-indigo-600 hover:bg-indigo-700 focus:ring-indigo-500"
          :class="{ 'opacity-50': form.processing }"
          :disabled="form.processing"
        >
          Đăng nhập hệ thống
        </PrimaryButton>
      </div>
    </form>
  </GuestLayout>
</template>
