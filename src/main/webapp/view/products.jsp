<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

    <div class="row">
        <a href="/addProduct">Add</a>
    </div>
    <div class="row">
        <div class="col-12">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Unit Price</th>
                    <th scope="col">Enabled</th>
                    <th scope="col">Category</th>
                    <th scope="col">Picture URL</th>
                    <th scope="col">#</th>
                    <th scope="col">#</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">${p.id}</th>
                    <td>${p.name}</td>
                    <td>${p.description}</td>
                    <td>${p.unitPrice}</td>
                    <td>${p.enabled}</td>
                    <td>${p.category}</td>
                    <td>${p.pictureUrl}</td>
                    <td><a href="/editProduct?id=${p.id}">Edit</a></td>
                    <td><a href="/deleteProduct?id=${p.id}">Delete</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

