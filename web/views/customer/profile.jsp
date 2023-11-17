<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/changeprofile.css">

    </head>

    <body>
        <div class="container-xl px-4 mt-4">
            <hr class="mt-0 mb-4">
            <div class="row">
                <div class="col-md-12">
                    <ol class="breadcrumb">
                        <li><a href="home">Home </a></li>
                        <li> / </li>
                        <li class="active">Profile</li>
                    </ol>
                </div>
            </div>
            <div class="row">

                <div class="col-xl-4">

                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Profile</div>
                        <div class="card-body text-center">

                            <img class="img-account-profile rounded-circle mb-2"
                                 src="https://t4.ftcdn.net/jpg/05/49/98/39/360_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg" alt>

                            <div class="small font-italic text-muted mb-4">${accounts.getFullName()}</div>
                            <div class="small font-italic text-muted mb-4">${accounts.getPhoneNumber()}</div>

                        </div>
                    </div>
                </div>
                <div class="col-xl-8">

                    <div class="card mb-4">
                        <div class="card-header">Account Details</div>
                        <div class="card-body">
                            <form action="myprofile" action="post">

                                <div class="mb-3">
                                    <label class="small mb-1">Email </label>
                                    <input class="form-control" id="email" type="text" value="${accounts.getEmail()}" readonly>
                                </div>

                                <div class="mb-3">
                                    <label class="small mb-1">FullName </label>
                                    <input class="form-control" id="name" type="text" value="${accounts.getFullName()}" readonly>
                                </div>

                                <div class="mb-3">
                                    <label class="small mb-1">Mobile </label>
                                    <input class="form-control" id="mobile" type="text" value="${accounts.getPhoneNumber()}" readonly>
                                </div>

                                <div class="mb-3">
                                    <label class="small mb-1">Address </label>
                                    <input class="form-control" id="address" type="text" value="${accounts.getAddress()}" readonly>
                                </div>
                                <a type="button" class="btn btn-primary" href="changeProfile">Change Profile</a>  
                                <a type="button" class="btn btn-primary" href="changePassword">Change Password</a> 
                                <a type="button" class="btn btn-primary" href="myOrder">My Order</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>