<script setup>
import GuestLayout from '@/Layouts/GuestLayout.vue'
import InputError from '@/Components/InputError.vue'
import InputLabel from '@/Components/InputLabel.vue'
import PrimaryButton from '@/Components/PrimaryButton.vue'
import TextInput from '@/Components/TextInput.vue'
import { Head, Link, useForm } from '@inertiajs/vue3'

const form = useForm({
  name: '',
  email: '',
  password: '',
  password_confirmation: '',
})

const submit = () => {
  form.post(route('register'), {
    onFinish: () => form.reset('password', 'password_confirmation'),
  })
}
</script>

<template>
  <GuestLayout>
    <Head title="Đăng ký" />

    <form @submit.prevent="submit" class="space-y-5">
      <!-- NAME -->
      <div>
        <InputLabel for="name" value="Họ và tên" />

        <TextInput
          id="name"
          type="text"
          class="mt-1 block w-full rounded-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500"
          v-model="form.name"
          required
          autofocus
          autocomplete="name"
        />

        <InputError class="mt-2" :message="form.errors.name" />
      </div>

      <!-- EMAIL -->
      <div>
        <InputLabel for="email" value="Email đăng nhập" />

        <TextInput
          id="email"
          type="email"
          class="mt-1 block w-full rounded-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500"
          v-model="form.email"
          required
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
          autocomplete="new-password"
        />

        <InputError class="mt-2" :message="form.errors.password" />
      </div>

      <!-- CONFIRM PASSWORD -->
      <div>
        <InputLabel for="password_confirmation" value="Xác nhận mật khẩu" />

        <TextInput
          id="password_confirmation"
          type="password"
          class="mt-1 block w-full rounded-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500"
          v-model="form.password_confirmation"
          required
          autocomplete="new-password"
        />

        <InputError
          class="mt-2"
          :message="form.errors.password_confirmation"
        />
      </div>

      <!-- ACTIONS -->
      <div class="flex items-center justify-between">

        <PrimaryButton
          class="bg-indigo-600 hover:bg-indigo-700 focus:ring-indigo-500"
          :class="{ 'opacity-50': form.processing }"
          :disabled="form.processing"
        >
          Đăng ký tài khoản
        </PrimaryButton>
      </div>
    </form>
  </GuestLayout>
</template>
