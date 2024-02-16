<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Enums\InterfaceTypeEnum;
use Ladumor\OneSignal\OneSignal;
use Illuminate\Support\Facades\Auth;
use App\Models\ElemantraNotification;
use App\Http\Requests\Admin\ElemantraNotificationStore;

class ElemantraNotificationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $notifications = ElemantraNotification::latest()->get();
        return view('admin.elemantra-notification-index', compact('notifications'));
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
    public function store(ElemantraNotificationStore $request)
    {
        try {
            $notifications = ElemantraNotification::create([
                'title' => $request->title,
                'description' => $request->description,
                'interface_type' => $request->interface_type
            ]);

            $users = User::select('id', 'role_id', 'uuid')
                ->whereNotNull('uuid')
                ->when(
                    $request->interface_type != InterfaceTypeEnum::ALL->value,
                    fn ($q) => $q->where('current_work', InterfaceTypeEnum::from($request->interface_type)->userColumn())
                )
                ->get()
                ->pluck('uuid')->toArray();
            // OneSignal::sendPush($users,$request->message);
            sendNotification($users, $request->title, $request->description);
            return redirect()->back()->with('success', 'Notification send successfully');
        } catch (\Exception $ex) {
            return redirect()->back()->with('error', 'Something Went Wrong');
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $notification = ElemantraNotification::destroy($id);
            return redirect()->back()->with('success', 'Notification delete successfully');
        } catch (\Exception $ex) {

            return redirect()->back()->with('error', 'Something Went Wrong');
        }
    }
}
