<?php

return [
    'google_map' => [
        'key' => env('GOOGLE_MAP_API_KEY'),
    ],

    'onesignal' => [
        'app_id' => env('ONE_SIGNAL_APP_ID'),
        'api_key' => env('ONE_SIGNAL_API_KEY'),
        'authorize_key' => env('ONE_SIGNAL_AUTHORIZE'),
        'auth_key' => env('ONE_SIGNAL_AUTH_KEY'),
        'server_key' => env('ONE_SIGNAL_SERVER_KEY'),
    ],
    'sms'=>[
        'api_key'=>env('SMS_KEY'),
        'campaign'=>env('SMS_CAMPAIGN'),
        'route_id'=>env('SMS_ROUTE_ID'),
        'sender_id'=>env('SMS_SENDER_ID'),
        'template_id'=>env('SMS_TEMPLATE_ID'),
        'pe_id'=>env('SMS_PE_ID')
    ],
    'force_update'=>env('FORCE_UPDATE'),
];
