@props(['record'])

@php
    $attrs = ['class' => 'mr-1 uppercase hover:underline cursor-pointer', 'hx-target' => '#section'];
    if (isset($record)) {
        $currentRouteName = request()->route()->getName();
        $resourceName = explode('.', $currentRouteName)[0];
        $attrs['hx-get'] = route($resourceName . '.edit', $record->id);
    }
@endphp

<a {{ $attributes->merge($attrs) }}>
    @if(isset($slot) && trim($slot) !== '')
        {{ $slot }}
    @else
        <i class="fa-regular fa-pen-to-square"></i>
    @endif
</a>
