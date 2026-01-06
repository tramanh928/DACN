<script setup>
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Link, useForm, usePage } from '@inertiajs/vue3';

defineProps({
    mustVerifyEmail: {
        type: Boolean,
    },
    status: {
        type: String,
    },
});

const user = usePage().props.auth.user;

const form = useForm({
    name: user.name,
    email: user.email,
});
</script>

<template>
    <section>
        <header>
            <h2 class="text-lg font-medium text-gray-900">
                Thông tin hồ sơ
            </h2>

            <p class="mt-1 text-sm text-gray-600">
                Cập nhật thông tin hồ sơ và địa chỉ email của tài khoản.
            </p>
        </header>

        <form
            @submit.prevent="form.patch(route('profile.update'))"
            class="mt-6 space-y-6"
        >
            <!-- NAME -->
            <div>
                <InputLabel for="name" value="Họ và tên" />

                <TextInput
                    id="name"
                    type="text"
                    class="mt-1 block w-full rounded-md border-gray-300
                           focus:border-indigo-500 focus:ring-indigo-500"
                    v-model="form.name"
                    required
                    autofocus
                    autocomplete="name"
                />

                <InputError class="mt-2" :message="form.errors.name" />
            </div>

            <!-- EMAIL -->
            <div>
                <InputLabel for="email" value="Email" />

                <TextInput
                    id="email"
                    type="email"
                    class="mt-1 block w-full rounded-md border-gray-300
                           focus:border-indigo-500 focus:ring-indigo-500"
                    v-model="form.email"
                    required
                    autocomplete="username"
                />

                <InputError class="mt-2" :message="form.errors.email" />
            </div>

            <!-- EMAIL UNVERIFIED -->
            <div v-if="mustVerifyEmail && user.email_verified_at === null">
                <p class="mt-2 text-sm text-gray-800">
                    Email của bạn chưa được xác thực.
                    <Link
                        :href="route('verification.send')"
                        method="post"
                        as="button"
                        class="rounded-md text-sm text-gray-600 underline hover:text-gray-900 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
                    >
                        Nhấn vào đây để gửi lại email xác thực.
                    </Link>
                </p>

                <div
                    v-show="status === 'verification-link-sent'"
                    class="mt-2 text-sm font-medium text-green-600"
                >
                    Một liên kết xác thực mới đã được gửi đến email của bạn.
                </div>
            </div>

            <!-- ACTION -->
            <div class="flex items-center gap-4">
                <PrimaryButton
                    class="bg-indigo-600 hover:bg-indigo-700 focus:ring-indigo-500"
                    :disabled="form.processing"
                >
                    Lưu
                </PrimaryButton>

                <Transition
                    enter-active-class="transition ease-in-out"
                    enter-from-class="opacity-0"
                    leave-active-class="transition ease-in-out"
                    leave-to-class="opacity-0"
                >
                    <p v-if="form.recentlySuccessful" class="text-sm text-gray-600">
                        Đã lưu.
                    </p>
                </Transition>
            </div>
        </form>
    </section>
</template>
