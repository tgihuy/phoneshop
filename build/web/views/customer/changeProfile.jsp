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
                        <li><a href="profile">Profile </a></li>
                        <li> / </li>
                        <li class="active">Change Profile</li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="row">
                    <div class="card mb-4">
                        <div class="card-header">Account Details</div>
                        <div class="card-body">
                            <form action="changeProfile" method="post">

                                <div class="mb-3">
                                    <label class="small mb-1">Email </label>
                                    <input class="form-control" name="email" type="text" value="${accounts.getEmail()}" readonly>
                                </div>

                                <div class="mb-3">
                                    <label class="small mb-1">FullName </label>
                                    <input class="form-control" name="fullname" type="text" value="${accounts.getFullName()}">
                                    <div style="color: red">${checkName}</div>
                                </div>

                                <div class="mb-3">
                                    <label class="small mb-1">Mobile </label>
                                    <input class="form-control" name="phone" type="text" value="${accounts.getPhoneNumber()}">
                                    <div style="color: red">${checkPhone}</div>
                                </div>

                                <div class="mb-3">
                                    <label class="small mb-1">Address </label>
                                    <input class="form-control" name="address" type="text" value="${accounts.getAddress()}">
                                </div>


                                <div  style="justify-content: center;align-items:  center ;display: flex" >
                                    <input class="btn btn-primary" type="submit" value="Save" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </body>

</html>