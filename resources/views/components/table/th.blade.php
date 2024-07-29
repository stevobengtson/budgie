@props(['field' => null, 'sortable' => false])

@php
    $sortField = request('sort_field');
    $sortDir = (request('sort_dir', 'asc') === 'asc') ? 'desc' : 'asc';
    $hxGetUrl = fn($field) => request()->fullUrlWithQuery(['sort_field' => $field, 'sort_dir' => $sortField == $field ? $sortDir : 'asc']);
@endphp

@if ($sortable)
<th {{ $attributes->merge([
    'class' => 'px-4 py-2 border text-left cursor-pointer',
    'hx-get' => $hxGetUrl($field),
    'hx-trigger' => 'click',
    'hx-replace-url' => 'true',
    'hx-swap' => 'outerHTML',
    'hx-target' => '#table-container',
]) }}>
    @if(isset($slot) && trim($slot) !== '')
        {{ $slot }}
    @else
        <span>{{ Str::title($field) }}</span>
    @endif
    @if ($sortField === $field)
        @if($sortDir === 'asc')
            <i class="fa-regular fa-arrow-up"></i>
        @else
            <i class="fa-regular fa-arrow-down"></i>
        @endif
    @else
        <i class="fa-regular fa-arrows-up-down" style="color: #aaaaaa;"></i>
    @endif
</th>
@else
<th {{ $attributes->merge(['class' => 'px-4 py-2 border text-left']) }}>
    @if(isset($slot) && trim($slot) !== '')
        {{ $slot }}
    @else
        <span>{{ Str::title($field) }}</span>
    @endif
</th>
@endif
