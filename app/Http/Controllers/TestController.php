<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;

class TestController extends Controller
{
    public function index() {
        try {
            DB::connection()->getPdo();

            return 'Connect!';
        } catch (\Exception $e) {
            return "Could not connect to the database.  Please check your configuration. error:" . $e;
        }
    }
}
