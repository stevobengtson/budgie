<div id="table-container"
     hx-get="{{ route('accounts.index') }}"
     hx-trigger="loadAccounts from:body">

    <x-table id="accounts-table" :columns="$columns" :records="$accounts" />

    <div id="pagination-links" class="p-3"
         hx-boost="true"
         hx-target="#table-container">
        {{ $accounts->links() }}
    </div>
</div>


