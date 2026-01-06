<script setup>
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { useForm } from '@inertiajs/vue3';
import { ref } from 'vue';

const passwordInput = ref(null);
const currentPasswordInput = ref(null);

const form = useForm({
    current_password: '',
    password: '',
    password_confirmation: '',
});

const updatePassword = () => {
    form.put(route('password.update'), {
        preserveScroll: true,
        onSuccess: () => form.reset(),
        onError: () => {
            if (form.errors.password) {
                form.reset('password', 'password_confirmation');
                passwordInput.value.focus();
            }
            if (form.errors.current_password) {
                form.reset('current_password');
                currentPasswordInput.value.focus();
            }
        },
    });
};
</script>

<template>
    <section>
        <header>
            <h2 class="text-lg font-medium text-gray-900">
                Đổi mật khẩu
            </h2>

            <p class="mt-1 text-sm text-gray-600">
                Hãy đảm bảo tài khoản của bạn sử dụng mật khẩu dài và ngẫu nhiên để bảo mật.
            </p>
        </header>

        <form @submit.prevent="updatePassword" class="mt-6 space-y-6">
            <!-- CURRENT PASSWORD -->
            <div>
                <InputLabel for="current_password" value="Mật khẩu hiện tại" />

                <TextInput
                    id="current_password"
                    ref="currentPasswordInput"
                    v-model="form.current_password"
                    type="password"
                    class="mt-1 block w-full rounded-md border-gray-300
                           focus:border-indigo-500 focus:ring-indigo-500"
                    autocomplete="current-password"
                />

                <InputError
                    :message="form.errors.current_password"
                    class="mt-2"
                />
            </div>

            <!-- NEW PASSWORD -->
            <div>
                <InputLabel for="password" value="Mật khẩu mới" />

                <TextInput
                    id="password"
                    ref="passwordInput"
                    v-model="form.password"
                    type="password"
                    class="mt-1 block w-full rounded-md border-gray-300
                           focus:border-indigo-500 focus:ring-indigo-500"
                    autocomplete="new-password"
                />

                <InputError :message="form.errors.password" class="mt-2" />
            </div>

            <!-- CONFIRM PASSWORD -->
            <div>
                <InputLabel for="password_confirmation" value="Xác nhận mật khẩu mới" />

                <TextInput
                    id="password_confirmation"
                    v-model="form.password_confirmation"
                    type="password"
                    class="mt-1 block w-full rounded-md border-gray-300
                           focus:border-indigo-500 focus:ring-indigo-500"
                    autocomplete="new-password"
                />

                <InputError
                    :message="form.errors.password_confirmation"
                    class="mt-2"
                />
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
