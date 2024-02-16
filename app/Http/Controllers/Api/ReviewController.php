<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Models\ReviewCategory;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\ReviewAdd;
use App\Http\Requests\Api\ReviewGet;
use App\Models\ReviewUser;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    public function reviewCategories()
    {
        try {
            $categories = ReviewCategory::all();
            return $this->apiSuccess(compact('categories'), "Review Categories fetched successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function reviewAdd(ReviewAdd $request)
    {
        try {
            $user = User::find($request->user_id);
            $review = $user->review()->updateOrCreate([
                'review_by_user' => Auth::id()
            ]);
            $review->description = $request->description;
            $review->save();
            if ($request->has('reviews')) {
                foreach ($request->reviews as $key => $rate) {
                    $review->rating()->updateOrCreate([
                        'user_id' => $request->user_id,
                        'review_by_user' => Auth::id(),
                        'review_category_id' => $rate['review_category_id'],
                    ], ['rating' => $rate['rating'] ?? 0,]);
                }
            }
            return $this->apiSuccess(compact('user'), "Review Added successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }

    public function reviewGet(ReviewGet $request)
    {
        try {

            $review = ReviewUser::where('user_id', $request->user_id)
                ->where('review_by_user', Auth::id())
                ->with(['rating.reviewCategory'])
                ->first();

            return $this->apiSuccess(compact('review'), "Review Get successfully");
        } catch (\Exception $ex) {
            return $this->apiError($ex->getMessage() . ' ' . $ex->getLine(), 500);
        }
    }
}
