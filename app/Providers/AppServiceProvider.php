<?php

namespace App\Providers;
use App\Models\ShopSetting;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
         view()->composer('*',function($view) {
            $setting  = ShopSetting::find(1);
            $view->with(['setting' => $setting]); 

        });
    }
}
