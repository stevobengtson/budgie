<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreAccountRequest;
use App\Http\Requests\UpdateAccountRequest;
use App\Models\Account;
use App\Models\User;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Foundation\Application;
use Illuminate\Http\Request;

class AccountController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View|Factory|Application
    {
        /** @var User $user */
        $user = auth()->user();
        if (!$user) {
            abort(403, 'Unauthorized');
        }

        $accounts = $user
            ->accounts()
            ->when($request->has('sort_field'), function ($query) use ($request) {
                $sortField = $request->input('sort_field', 'name');
                $sortDir = $request->input('sort_dir', 'asc');
                $query->orderBy($sortField, $sortDir);
            })
            ->paginate($request->input('per_page', 10));

        $columns = [
            'name' => [
                'label' => 'Name',
                'sortable' => true,
            ],
            'type' => [
                'label' => 'Type',
                'sortable' => true,
            ],
            'currency' => [
                'label' => 'Currency',
                'sortable' => false,
            ],
            'balance' => [
                'label' => 'Balance',
                'sortable' => true,
            ],
            'interest' => [
                'label' => 'Interest',
                'sortable' => false,
            ],
            'opened' => [
                'label' => 'Opened',
                'sortable' => false,
            ],
            'closed' => [
                'label' => 'Closed',
                'sortable' => false,
            ],
            'actions' => [
                'label' => 'Actions',
                'sortable' => false,
                'editable' => true,
                'deletable' => true,
            ],
        ];

        $data = compact('accounts', 'columns');
        $view = $request->header('hx-request') ? 'accounts.partials.list' : 'accounts.index';

        return view($view, $data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreAccountRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Account $account)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Account $account)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateAccountRequest $request, Account $account)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Account $account)
    {
        //
    }
}
