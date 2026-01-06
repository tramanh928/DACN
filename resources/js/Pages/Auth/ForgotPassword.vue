<script setup>
import GuestLayout from '@/Layouts/GuestLayout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, useForm } from '@inertiajs/vue3';

defineProps({
    status: {
        type: String,
    },
});

const form = useForm({
    email: '',
});

const submit = () => {
    form.post(route('password.email'));
};
</script>

<template>
    <GuestLayout>
        <Head title="Quên mật khẩu" />

        <div class="mb-4 text-sm text-gray-600">
            Quên mật khẩu? Không sao cả. Vui lòng nhập địa chỉ email của bạn, 
            chúng tôi sẽ gửi liên kết đặt lại mật khẩu để bạn chọn mật khẩu mới.
        </div>

        <div v-if="status" class="mb-4 text-sm font-medium text-green-600">
            {{ status }}
        </div>

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

            <!-- ACTION -->
            <div class="flex justify-end">
                <PrimaryButton
                    class="bg-indigo-600 hover:bg-indigo-700 focus:ring-indigo-500"
                    :class="{ 'opacity-50': form.processing }"
                    :disabled="form.processing"
                >
                    Gửi liên kết đặt lại mật khẩu
                </PrimaryButton>
            </div>
        </form>
    </GuestLayout>
</template>
