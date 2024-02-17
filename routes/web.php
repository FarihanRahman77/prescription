<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\WarrentyController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductPartsController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ClaimController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\RoleToPermissionController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});



Auth::routes();

Route::post('/authenticate', [LoginController::class, 'authenticate'])->name('authenticate');

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
		    return view('backend.warrenty.home');
		})->name('dashboard');
		
Route::group(['middleware' => ['auth']], function(){
    Route::get('/home', [HomeController::class, 'index'])->name('home');
    
    Route::get('/warrenty/home',[WarrentyController::class,'index'])->name('warrenty.home');
    Route::get('/warrenty/search',[WarrentyController::class,'search'])->name('warrenty.search');
    Route::get('/warrenty/add/registration',[WarrentyController::class,'addRegistration'])->name('warrenty.add.registration');
    Route::get('/warrenty/add/step-2',[WarrentyController::class,'saveStep2'])->name('warrenty.save.step2');
    Route::post('/warrenty/add/step-2/post',[WarrentyController::class,'saveStepTwoPost'])->name('warrenty.save.step2.post');
    Route::get('/search/warrenty/list', [WarrentyController::class,'searchView'])->name('search.view');
    Route::get('/details/registration/{id}', [WarrentyController::class,'details'])->name('search.details');
    Route::get('/delete/registration/{id}', [WarrentyController::class,'delete'])->name('search.delete');
    Route::get('/edit/registration/{id}', [WarrentyController::class,'edit'])->name('search.edit');
    Route::get('/attachment/registration/{id}', [WarrentyController::class,'attachment'])->name('attachment.registration');
    
    Route::get('/warrenty/get/product',[WarrentyController::class,'getProduct'])->name('warrenty.get.product');
    Route::get('/warrenty/get/product/data',[WarrentyController::class,'getProductData'])->name('get.productData');
    Route::get('/warrenty/installation/form',[WarrentyController::class,'installationForm'])->name('installationForm');
    Route::post('/warrenty/installation/form/post',[WarrentyController::class,'saveInstallationForm'])->name('save.installationForm');
    
    Route::get('/warrenty/user/form',[WarrentyController::class,'userDetailsForm'])->name('userDetailsForm');
    Route::post('/warrenty/user/form/post',[WarrentyController::class,'saveUserDetailsForm'])->name('save.userDetailsForm');
    Route::get('/warrenty/get/customer/info',[WarrentyController::class,'getCustomerInfo'])->name('getCustomerInfo');
    
    Route::post('/update/warrenty/user/form/post',[WarrentyController::class,'updateUserDetailsForm'])->name('update.userDetailsForm');
    
    
    Route::get('/warrenty/upload/form',[WarrentyController::class,'uploadForm'])->name('uploadForm');
    Route::post('/warrenty/upload/form/post',[WarrentyController::class,'saveUploadForm'])->name('save.uploadForm');
    
    Route::get('/warrentysubmit/form',[WarrentyController::class,'submitForm'])->name('submitForm');
    Route::post('/warrentysubmit/form/post',[WarrentyController::class,'saveSubmitForm'])->name('save.submitForm');
    
     Route::get('/generate/Warrenty/QR/{id}',[WarrentyController::class,'generateWarrentyQR'])->name('generateWarrentyQR');
     Route::get('//Warrenty/warrenty_list_excel',[WarrentyController::class,'warrenty_list_excel'])->name('warrenty_list_excel');
     
    
    Route::get('/category/show/',[CategoryController::class,'index'])->name('category');
    Route::get('/category/get/data/',[CategoryController::class,'getCategories'])->name('getCategories');
    Route::post('/category/store/',[CategoryController::class,'store'])->name('category.store');
    Route::get('/category/edit/get/',[CategoryController::class,'editCategory'])->name('get.editCategory');
    Route::post('/category/update/',[CategoryController::class,'update'])->name('categories.update');
    Route::get('/category/delete/',[CategoryController::class,'delete'])->name('deleteCategory');
    
    
    Route::get('/product/show/',[ProductController::class,'index'])->name('product');
    Route::get('/product/get/data/',[ProductController::class,'getProducts'])->name('getProducts');
    Route::post('/product/store/',[ProductController::class,'store'])->name('product.store');
    Route::get('/product/edit/get/',[ProductController::class,'editProduct'])->name('get.editProduct');
    Route::post('/product/update/',[ProductController::class,'update'])->name('products.update');
    Route::get('/product/delete/',[ProductController::class,'delete'])->name('deleteProduct');
    
    
    
    Route::get('/product/parts/show/',[ProductPartsController::class,'index'])->name('productParts');
    Route::get('/product/parts/add/',[ProductPartsController::class,'add_spare_parts'])->name('add_spare_parts');
    Route::get('/save/spare/parts',[ProductPartsController::class,'store'])->name('save_spare_parts');
    Route::get('/edit/spare/part/{id}',[ProductPartsController::class,'editSparePart']);
    Route::get('update/spare/parts',[ProductPartsController::class,'update'])->name('update_spare_parts');
    Route::get('/delete/spare/part/{id}',[ProductPartsController::class,'delete'])->name('deleteSpareProduct');
    Route::get('/qr/code/spare/part/{id}',[ProductPartsController::class,'qrCode'])->name('qrCodeSpareParts');
    Route::get('/spare/parts/list/exel/',[ProductPartsController::class,'exel'])->name('spare_parts_list_excel');
    
    //roles
    Route::get('/roles/roles_list',[RolesController::class,'roles_list'])->name('roles_list');
    Route::get('/roles/getRoles',[RolesController::class,'getRoles'])->name('getRoles');
    Route::post('/roles/role_store',[RolesController::class,'store'])->name('role.store');
    Route::get('/roles/edit_roles',[RolesController::class,'edit'])->name('editRoles');
    Route::post('/roles/roles_update',[RolesController::class,'update'])->name('roles.update');
    Route::get('/roles/deleteRole',[RolesController::class,'delete'])->name('deleteRole');
    
    //permissions
    Route::get('/permission/permissions_list',[PermissionController::class,'permissions_list'])->name('permissions_list');
    Route::get('/permission/getPermission',[PermissionController::class,'getPermission'])->name('getPermission');
    Route::post('/permission/store',[PermissionController::class,'store'])->name('permission.store');
    Route::get('/permission/edit',[PermissionController::class,'edit'])->name('editPermission');
    Route::post('/permission/update',[PermissionController::class,'update'])->name('permission.update');
    Route::get('/permission/delete',[PermissionController::class,'delete'])->name('deletePermission');
    
    //role to permission
    Route::get('/role/permission/permissions_list',[RoleToPermissionController::class,'index'])->name('role_to_permissions');
    Route::get('/role/permission/permissions_create',[RoleToPermissionController::class,'create'])->name('role_to_permissions_create');
    Route::get('roles/delete/{id}', [RoleToPermissionController::class, 'delete'])->name('roleDelete');
    Route::post('/give/permission/store', [RoleToPermissionController::class, 'store'])->name('roleToPermissionStore');
    
    Route::controller(SearchController::class)->group(function (){
        Route::get('/search-data', 'getSearchDtat')->name('get.search.data');
        Route::get('/edit/{id}',' edit')->name('data.edit');
        Route::post('/getEmployeeData', 'getEmployeeData')->name('getEmployeeData');
        Route::post('/updateEmployee',  'updateEmployee')->name('updateEmployee');
        Route::post('/deleteEmployee', 'deleteEmployee')->name('deleteEmployee');
    });
    
    Route::controller(EmployeeController::class)->group(function (){
        Route::get('/employee/view', 'index')->name('employees_list');
        Route::get('/employee/getEmployees', 'getEmployees')->name('getEmployees');
        Route::post('/employee/store', 'store')->name('Employee.store');
        Route::get('/employee/edit/get/','editProduct')->name('get.editEmployee');
        Route::post('/employee/update/','update')->name('Employees.update');
        Route::get('/employee/delete/','delete')->name('deleteEmployee');
        Route::get('/create/QR/code/pdf/{id}','QRcode')->name('QRcodeEmployee');
    });
    
    
    Route::controller(ClaimController::class)->group(function (){
       Route::get('/all/claim', 'index')->name('allClaim');
       Route::get('/claim_list_excel/{type}', 'claim_list_excel')->name('claim_list_excel');
       Route::get('/new/claim', 'create')->name('newClaim');
       Route::get('/get/warrenty/info', 'getWarrentyInfo')->name('get.warrenty.info');
       Route::get('/get/registration/info/{id}', 'getRegistrationInfo')->name('get.registration.info');
       Route::get('/get/Registered/Service/Repair/{id}', 'getRegisteredServiceRepair')->name('getRegisteredServiceRepair');
        Route::get('/create/new/claim/page/Two/{id}', 'createNewClaimPageTwo')->name('createNewClaimPageTwo');
       Route::get('/create/new/claim/page/one/{id}', 'createNewClaimPageOne')->name('createNewClaimPageOne');
      
       Route::get('/store/new/claim/info/page/one/', 'saveClaimsInfo')->name('save.claims.info');
       Route::get('/product/add/to/session/', 'addToSession')->name('product.add.to.session');
       Route::get('/claim/fetch/session', 'fetchSession')->name('claim.fetchSession');
       Route::get('/claim/update/Session', 'updateSession')->name('claim.updateSession');
       Route::get('/claim/clear/Session', 'clearSession')->name('claim.clearSession');
       Route::get('/claim/remove/removePart', 'removePart')->name('claim.removePart');
       Route::get('/claim/submit/final/part', 'submitFinalPart')->name('claim.submitFinalPart');
       Route::get('/details/claim/{id}', 'claimDetails')->name('claim.details');
       Route::get('/attachment/claim/{id}', 'attachment')->name('claim.attachment');
       Route::get('/edit/claim/{id}', 'claimEdit')->name('claim.edit');
       Route::get('/delete/claim/{id}', 'claimDelete')->name('claim.delete');
       
       Route::get('edit/product/add/to/session/', 'editAddToSession')->name('edit.product.add.to.session');
       Route::get('/update/new/claim/info/page/one/', 'updateClaimsInfo')->name('update.claims.info');
       Route::get('edit/claim/fetch/session', 'fetchEditSession')->name('edit.claim.fetchSession');
       Route::get('edit/claim/update/Session', 'editUpdateSession')->name('edit.claim.updateSession');
       Route::get('edit/claim/clear/Session', 'editClearSession')->name('edit.claim.clearSession');
       Route::get('edit/claim/remove/removePart', 'claimRemovePart')->name('edit.claim.removePart');
       
       Route::post('/save/claim/attachment/attachment', 'storeClaimAttachment')->name('save.claim.attachment');
       Route::get('/details/claim/attachment/{id}', 'attachmentDetails')->name('attachmentDetails');
       Route::get('/delete/claim/attachment/{id}', 'attachmentDelete')->name('attachmentDelete');
       
      
       
    });
    
    
    Route::controller(ServiceController::class)->group(function (){
         Route::get('/service/service_list', 'index')->name('service_list');
         Route::get('/service/create_service', 'create')->name('create_service');
         Route::get('/get/warrenty/info/service', 'getWarrentyInfo')->name('get.warrenty.info.for.service');
         Route::get('/service/Step/One/To/Two/{id}', 'stepTwoCreate')->name('stepTwoCreate');
         Route::get('/get/employee/info/service', 'getEmployeeInfo')->name('get.employee.info.for.service');
         Route::get('/service/Step/Two/To/Three/{id}/{registration_id}', 'stepThreeCreate')->name('stepThreeCreate');
         Route::get('/service/product/add/to/session', 'serviceProductAddSession')->name('service.product.add.to.session');
         Route::get('/service/fetch/session', 'fetchSession')->name('service.fetchSession');
         Route::get('/service/update/Session', 'updateSession')->name('service.updateSession');
         Route::get('/service/clear/Session', 'clearSession')->name('service.clearSession');
         Route::get('/service/remove/removePart', 'removePart')->name('service.removePart');
         Route::get('/save/service/info', 'store')->name('save.service.info');
         
    });
    
    Route::get('/profile/show/',[UserController::class,'index'])->name('profile');
    Route::post('/profile/store/',[UserController::class,'save'])->name('saveUser');
    Route::post('/profile/update/',[UserController::class,'update'])->name('updateUser');
    Route::get('/profile/user/list/',[UserController::class,'user_list'])->name('user_list');
    Route::get('/profile/user/edit/{id}',[UserController::class,'userEdit'])->name('userEdit');
    Route::get('/profile/user/delete/{id}',[UserController::class,'userDelete'])->name('userDelete');
    
    Route::get('/shop/setting/',[HomeController::class,'shopSettingIndex'])->name('shopSettingView');
    Route::post('/update/setting/',[HomeController::class,'updateSetting'])->name('updateSetting');

});
