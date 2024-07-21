@php use Illuminate\Support\Number; @endphp
<x-app-layout>
    <x-table>
        <x-slot name='header'>
            <x-table-header-column>{{ _('Name') }}</x-table-header-column>
            <x-table-header-column>{{ _('Type') }}</x-table-header-column>
            <x-table-header-column>{{ _('Currency') }}</x-table-header-column>
            <x-table-header-column>{{ _('Balance') }}</x-table-header-column>
            <x-table-header-column>{{ _('Interest') }}</x-table-header-column>
            <x-table-header-column>{{ _('Opened') }}</x-table-header-column>
            <x-table-header-column>{{ _('Closed') }}</x-table-header-column>
            <x-table-header-column></x-table-header-column>
        </x-slot>
        @forelse ($accounts as $account)
            <tr>
                <x-table-column>{{ $account->name }}</x-table-column>
                <x-table-column>{{ $account->type }}</x-table-column>
                <x-table-column>{{ $account->currency }}</x-table-column>
                <x-table-column>{{ Number::currency($account->balance, $account->currency) }}</x-table-column>
                <x-table-column>{{ $account->interest_rate }}</x-table-column>
                <x-table-column>{{ $account->opened_at }}</x-table-column>
                <x-table-column>{{ $account->closed_at ?? '--'}}</x-table-column>
                <x-table-column>
                    <button class="relative align-middle select-none font-sans font-medium text-center uppercase transition-all disabled:opacity-50 disabled:shadow-none disabled:pointer-events-none w-10 max-w-[40px] h-10 max-h-[40px] rounded-lg text-xs text-gray-900 hover:bg-gray-900/10 active:bg-gray-900/20" type="button">
                        <span class="absolute top-1/2 left-1/2 transform -translate-y-1/2 -translate-x-1/2">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" class="h-4 w-4">
                            <path d="M21.731 2.269a2.625 2.625 0 00-3.712 0l-1.157 1.157 3.712 3.712 1.157-1.157a2.625 2.625 0 000-3.712zM19.513 8.199l-3.712-3.712-12.15 12.15a5.25 5.25 0 00-1.32 2.214l-.8 2.685a.75.75 0 00.933.933l2.685-.8a5.25 5.25 0 002.214-1.32L19.513 8.2z"></path>
                        </svg>
                        </span>
                    </button>
                </x-table-column>
            </tr>
        @empty
            <tr>
                <td colspan="7">No Accounts</td>
            </tr>
        @endforelse
    </x-table>
    {{ $accounts->links() }}
</x-app-layout>
