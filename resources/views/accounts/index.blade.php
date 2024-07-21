@php use Illuminate\Support\Number; @endphp
<x-app-layout>
    <table class="w-full min-w-[640px] table-auto">
        <thead>
        <tr>
            <th class="border-b border-blue-gray-50 py-3 px-6 text-left">
                <p class="block antialiased font-sans text-[11px] font-medium uppercase text-blue-gray-400 dark:text-white">Name</p>
            </th>
            <th class="border-b border-blue-gray-50 py-3 px-6 text-left">
                <p class="block antialiased font-sans text-[11px] font-medium uppercase text-blue-gray-400 dark:text-white">Type</p>
            </th>
            <th class="border-b border-blue-gray-50 py-3 px-6 text-left">
                <p class="block antialiased font-sans text-[11px] font-medium uppercase text-blue-gray-400 dark:text-white">Currency</p>
            </th>
            <th class="border-b border-blue-gray-50 py-3 px-6 text-left">
                <p class="block antialiased font-sans text-[11px] font-medium uppercase text-blue-gray-400 dark:text-white">Balance</p>
            </th>
            <th class="border-b border-blue-gray-50 py-3 px-6 text-left">
                <p class="block antialiased font-sans text-[11px] font-medium uppercase text-blue-gray-400 dark:text-white">Interest
                    Rate</p>
            </th>
            <th class="border-b border-blue-gray-50 py-3 px-6 text-left">
                <p class="block antialiased font-sans text-[11px] font-medium uppercase text-blue-gray-400 dark:text-white">Opened</p>
            </th>
            <th class="border-b border-blue-gray-50 py-3 px-6 text-left">
                <p class="block antialiased font-sans text-[11px] font-medium uppercase text-blue-gray-400 dark:text-white">Closed</p>
            </th>
            <th class="border-b border-blue-gray-50 py-3 px-6 text-left">
                <p class="block antialiased font-sans text-[11px] font-medium uppercase text-blue-gray-400 dark:text-white">Actions</p>
            </th>
        </tr>
        </thead>
        <tbody>
        @forelse ($accounts as $account)
            <tr>
                <td class="py-3 px-5 border-b border-blue-gray-50">
                    <div class="flex items-center gap-4">
                        <p class="block antialiased font-sans text-sm leading-normal text-blue-gray-900 font-bold dark:text-white">{{ $account->name }}</p>
                    </div>
                </td>
                <td class="py-3 px-5 border-b border-blue-gray-50">
                    <div class="flex items-center gap-4">
                        <p class="block antialiased font-sans text-sm leading-normal text-blue-gray-900 font-bold dark:text-white">{{ $account->type }}</p>
                    </div>
                </td>
                <td class="py-3 px-5 border-b border-blue-gray-50">
                    <div class="flex items-center gap-4">
                        <p class="block antialiased font-sans text-sm leading-normal text-blue-gray-900 font-bold dark:text-white">{{ $account->currency }}</p>
                    </div>
                </td>
                <td class="py-3 px-5 border-b border-blue-gray-50">
                    <div class="flex items-center gap-4">
                        <p class="block antialiased font-sans text-sm leading-normal text-blue-gray-900 font-bold dark:text-white">{{ Number::currency($account->balance, $account->currency) }}</p>
                    </div>
                </td>
                <td class="py-3 px-5 border-b border-blue-gray-50">
                    <div class="flex items-center gap-4">
                        <p class="block antialiased font-sans text-sm leading-normal text-blue-gray-900 font-bold dark:text-white">{{ $account->interest_rate }}</p>
                    </div>
                </td>
                <td class="py-3 px-5 border-b border-blue-gray-50">
                    <div class="flex items-center gap-4">
                        <p class="block antialiased font-sans text-sm leading-normal text-blue-gray-900 font-bold dark:text-white">{{ $account->opened_at }}</p>
                    </div>
                </td>
                <td class="py-3 px-5 border-b border-blue-gray-50">
                    <div class="flex items-center gap-4">
                        <p class="block antialiased font-sans text-sm leading-normal text-blue-gray-900 font-bold dark:text-white">{{ $account->closed_at }}</p>
                    </div>
                </td>
                <td class="py-3 px-5 border-b border-blue-gray-50">
                    <div class="flex items-center gap-4">
                        <p class="block antialiased font-sans text-sm leading-normal text-blue-gray-900 font-bold dark:text-white">
                            {{--                    <a href="{{ route('accounts.show', $account->id) }}" class="btn btn-primary">View</a>--}}
                            {{--                    <a href="{{ route('accounts.edit', $account->id) }}" class="btn btn-warning">Edit</a>--}}
                            {{--                    <form action="{{ route('accounts.destroy', $account->id) }}" method="POST" style="display: inline;">--}}
                            {{--                        @csrf--}}
                            {{--                        @method('DELETE')--}}
                            {{--                        <button type="submit" class="btn btn-danger">Delete</button>--}}
                            {{--                    </form>--}}
                        </p>
                    </div>
                </td>
            </tr>
        @empty
            <tr>
                <td colspan="7">No Accounts</td>
            </tr>
        @endforelse
        </tbody>
    </table>
    {{ $accounts->links() }}
</x-app-layout>
