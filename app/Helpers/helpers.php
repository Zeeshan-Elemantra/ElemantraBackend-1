<?php

use App\Models\User;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\Http;
use App\Models\ElemantraNotification;
use Illuminate\Support\Facades\Storage;

if (!function_exists('storeBase64Image')) {
    function storeBase64Image($image, $fileNameToStore, $storePath)
    {
        // $base64Image = $image; // Get base64 encoded image from the request

        // list($type, $data) = explode(';', $base64Image);
        // list(, $data) = explode(',', $data);
        // $data = base64_decode($data); // Decode the base64 data

        // $image_mime_type_arr = explode("/", finfo_buffer(finfo_open(), $data, FILEINFO_MIME_TYPE));

        // $imageExtension = is_array($image_mime_type_arr) ? $image_mime_type_arr[1] : "";
        // // Filename to store
        // $fileNameToStore = $fileNameToStore . '.' . $imageExtension;
        // // Upload Image
        // Storage::put($storePath . $fileNameToStore, $data);
        // $path = $storePath . $fileNameToStore;
        // return $path;

        $imageData = base64_decode($image);

        $imageInfo = getimagesizefromstring($imageData);
        $originalExtension = image_type_to_extension($imageInfo[2], false);
        $fileName = $fileNameToStore . '.' . $originalExtension;
        $filePath = $storePath . $fileName;
        Storage::put($storePath . $fileName, $imageData);
        return $filePath;
    }
}

if (!function_exists('storeFilePdf')) {
    function storeFilePdf($file, $fileNameToStore, $storePath)
    {
        // Get filename with the extension
        $filenameWithExt = $file->getClientOriginalName();
        //Get just filename
        $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
        // Get just ext
        $extension = $file->getClientOriginalExtension();
        // Filename to store
        $fileNameToStore = $fileNameToStore . '.' . $extension;
        // Upload Image
        $path = $file->storeAs($storePath, $fileNameToStore);
        return $path;
    }
}

if (!function_exists('sendNotification')) {

    function sendNotification(array $uuid, $title, $message)
    {

        $fields = [
            'app_id' => config('global.onesignal.app_id'),
            'headings' => ['en' => $title],
            'include_player_ids' => $uuid,
            'content_available' => true,
            'contents' => ['en' => $message],
        ];

        $response = Http::withHeaders([
            'Authorization' => 'Basic ' . config('global.onesignal.api_key'), //config('global.onesignal.server_key'),
            'Content-Type' => 'application/json; charset=utf-8',
        ])->post('https://onesignal.com/api/v1/notifications', $fields);

        return $response->body();
    }
}

if (!function_exists('isNotificationTrue')) {

    function isNotificationTrue($lastCheckDate)
    {

        $isNotification = false;
        // dd($lastCheckDate);

        $lastNotification = ElemantraNotification::latest()->first();
        if ($lastCheckDate) {

            if ($lastNotification) {
                $notification_date_time = Carbon::parse($lastNotification->created_at)->format('Y-m-d H:i:s') ?? Carbon::parse('2000-01-01 10:10:00')->format('Y-m-d H:i:s');
            } else {
                $notification_date_time = Carbon::parse('2000-01-01 10:10:00')->format('Y-m-d H:i:s');
            }

            $date1 = Carbon::createFromFormat('Y-m-d H:i:s', Carbon::parse($lastCheckDate));
            $date2 = Carbon::createFromFormat('Y-m-d H:i:s', $notification_date_time);
            $isNotification = $date2->gte($date1);
        }

        return $isNotification;
    }
}


if (!function_exists('uuidUpdate')) {

    function uuidUpdate($uuid)
    {
        $user = User::find(Auth::id());
        $user->uuid = $uuid;
        $user->save();
        return true;
    }
}

if (!function_exists('sentOtpSMS')) {

    function sentOtpSMS($otp, $mobile)
    {
        $sms_api_key = '265784C57CE33B' ?? "";
        $sender_id = 'ELMNTR' ?? "";
        $route_id = 7 ?? "";
        $campaign_id = '14131' ?? "";
        $template_id = '1707170210666923516' ?? "";
        $pe_id = '1701170143954913805' ?? "";
        $message = urlencode("Your ELEMANTRA verification code is ".$otp.". Verification code is valid for 5 minutes only, one time use. From ELEMANTRA");
        Http::get("http://sms.studyleagueitsolutions.com/app/smsapi/index.php?key=" . $sms_api_key . "&campaign=" . $campaign_id . "&routeid=" . $route_id . "&type=text&contacts=" . $mobile . "&senderid=" . $sender_id . "&msg=" . $message . "&template_id=" . $template_id . "&pe_id=" . $pe_id);
    }
}
