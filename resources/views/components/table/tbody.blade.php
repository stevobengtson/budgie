@props(['columns', 'records'])

<tbody {{ $attributes->merge(['id' => 'table-body']) }}>
    @if(isset($records))
        @forelse ($records as $record)
            <x-table.tr id="row-{{ $record->id }}">
                @foreach($columns as $columnName => $column)
                    <x-table.td>
                        @if($columnName === 'actions')
                            @if($column['editable'])
                                <x-table.actions.edit :record="$record"/>
                            @endif
                            @if($column['deletable'])
                                <x-table.actions.delete :record="$record"/>
                            @endif
                        @else
                            {{ $record->{$columnName} }}
                        @endif
                    </x-table.td>
                @endforeach
            </x-table.tr>
        @empty
            <x-table.tr>
                <x-table.td colspan="100%">No record found.</x-table.td>
            </x-table.tr>
        @endforelse
    @endif
    {{ $slot }}
</tbody>
