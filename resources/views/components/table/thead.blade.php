@props(['columns'])

<thead>
    @if(isset($columns) && is_array($columns))
        @foreach ($columns as $columnName => $column)
            <x-table.th field="{{ $columnName }}" sortable="{{ $column['sortable'] }}">
                {{ $column['label'] }}
            </x-table.th>
        @endforeach
    @endif
    {{ $slot }}
</thead>
