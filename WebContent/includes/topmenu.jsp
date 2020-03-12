<nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="assets/images/logo.png" height="50">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse mr-auto" id="navbarSupportedContent">
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>

            <div class="ml-auto">
                <div class="dropdown">
                    <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <%=username_data%>
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Profile</a>
                        <a class="dropdown-item" href="#">Setting</a>
                        <a class="dropdown-item" href="logout.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>