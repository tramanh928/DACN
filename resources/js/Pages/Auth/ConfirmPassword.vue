<script setup>
import GuestLayout from '@/Layouts/GuestLayout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, useForm } from '@inertiajs/vue3';

const form = useForm({
    password: '',
});

const submit = () => {
    form.post(route('password.confirm'), {
        onFinish: () => form.reset(),
    });
};
</script>

<template>
    <GuestLayout>
        <Head title="Xác nhận mật khẩu" />

        <div class="mb-4 text-sm text-gray-600">
            Đây là khu vực bảo mật của ứng dụng. Vui lòng xác nhận mật khẩu 
            của bạn trước khi tiếp tục.
        </div>

        <form @submit.prevent="submit" class="space-y-5">
            <!-- PASSWORD -->
            <div>
                <InputLabel for="password" value="Mật khẩu" />

                <TextInput
                    id="password"
                    type="password"
                    class="mt-1 block w-full rounded-md border-gray-300
                           focus:border-indigo-500 focus:ring-indigo-500"
                    v-model="form.password"
                    required
                    autocomplete="current-password"
                    autofocus
                />

                <InputError class="mt-2" :message="form.errors.password" />
            </div>

            <!-- ACTION -->
            <div class="flex justify-end">
                <PrimaryButton
                    class="bg-indigo-600 hover:bg-indigo-700 focus:ring-indigo-500"
                    :class="{ 'opacity-50': form.processing }"
                    :disabled="form.processing"
                >
                    Xác nhận
                </PrimaryButton>
            </div>
        </form>
    </GuestLayout>
</template>
