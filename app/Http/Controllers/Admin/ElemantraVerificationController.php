<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Enums\ElemantraVerificationEnum;
use App\Http\Requests\Admin\ElemantraVerificationStore;
use App\Http\Requests\Admin\FakeReviewAdd;
use App\Models\OnboardStep;
use App\Models\ReviewCategory;
use App\Models\ReviewUser;
use App\Models\VerificationRemark;

class ElemantraVerificationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $requestedUsers = User::whereIn(
            'elemantra_verification',
            [(string)ElemantraVerificationEnum::PENDING->value, (string)ElemantraVerificationEnum::VERIFIED->value]
        )
        ->when(
            $request->search,
            fn ($q) => $q->where(
                fn ($q) =>
                $q->where('name', 'LIKE', '%' . $request->search . '%')
                    ->orWhere('phone', 'LIKE', '%' . $request->search . '%')
                    ->orWhere('alt_phone', 'LIKE', '%' . $request->search . '%')
            )
        )
            ->latest()->paginate(12)->withQueryString();
        return view('admin.elemantra-verification-index', compact('requestedUsers'));
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
    public function store(ElemantraVerificationStore $request)
    {
        $user = User::find($request->user_id);
        $insertRemark = VerificationRemark::create([
            'user_id' => $request->user_id,
            'onboard_step_id' => $request->step_id,
            'spoken_name' => $request->spoken_name,
            'meeting_minute' => $request->meeting_minute,
            'remark' => $request->remark,
        ]);
        $isVerified = false;
        if ($request->step_id >= $user->verification_step) {
            $stepInc = $request->step_id + 1;
            if (OnboardStep::count() == $request->step_id) {
                $stepInc = $request->step_id;
                $user->elemantra_verification = (string)ElemantraVerificationEnum::VERIFIED->value;
                $isVerified = true;
            }
            $user->verification_step = $stepInc;
            $user->save();
        }
        if($isVerified){
            return to_route('admin.elemantra-verification.index')->with('success', 'The ' . $user->name . ' Elemantra Verified Successfully');
        }
        return redirect()->back()->with('success', 'The Step : ' . $request->step_id . ' updated successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $onboardSteps = OnboardStep::all();
        $user = User::with(['userPropertyType.propertyType', 'userWorkType.workType','verificationRemarks'])->find($id);
        // dd($user->toArray());
        return view('admin.elemantra-verification-process', compact('onboardSteps', 'user'));
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
        //
    }

    public function formReview(string $id)
    {
        $user = User::find($id);
        $reviewCategories = ReviewCategory::all();
        return view('admin.fake-review-add', compact('user', 'reviewCategories'));
    }

    public function addReview(FakeReviewAdd $request)
    {
        $user = User::find($request->user_id);
        $review = ReviewUser::create([
            'user_id' => $user->id,
            'review_by_name' => $request->review_by_name,
            'description' => $request->description
        ]);
        foreach ($request->reviews as $key => $rate) {
            $review->rating()->create([
                'user_id' => $user->id,
                'review_category_id' => $rate['review_category_id'],
                'rating' => $rate['rating'] ?? 0,
            ]);
        }
        return to_route('admin.elemantra-verification.index')->with('success', 'Review Added successfully for ' . $user->name);
    }

    public function userKyc(Request $request, $user_id)
    {
        $user = User::with('kyc')->whereId($user_id)->first();
        // dd($user->toArray());
        return view('admin.user-kyc-view', compact('user'));
    }
}
