$(document).ready(function () {
    // Hàm để lấy danh sách sản phẩm
    function fetchProducts() {
        $.ajax({
            url: '/san-pham/get-list',
            method: 'GET',
            success: function (response) {
                const productContainer = $('#product-info');
                productContainer.empty(); // Xóa nội dung cũ

                response.forEach(product => {
                    const productHtml = `
                        <div class="product">
                            <div class="image-wrapper">
                                <a href="/productDetail">
                                    <img src="/images/${product.anh}" alt="${product.ten}">
                                </a>
                                <div class="icon-heart">
                                    <a href="#"><i class="bi bi-heart heart"></i></a>
                                </div>
                            </div>
                            <div class="mt-2">
                                <p class="price"><b>${new Intl.NumberFormat('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    }).format(product.gia)}</b></p>
                                <p class="name">${product.ten}</p>
                            </div>
                        </div>
                    `;
                    productContainer.append(productHtml);
                });
            },
            error: function (error) {
                console.error('Error fetching products:', error);
            }
        });
    }

    function detailProduct() {

        document.addEventListener("DOMContentLoaded", function () {
            const urlPath = window.location.pathname;
            const productId = urlPath.split('/').pop();
            const apiUrl = `/san-pham/${productId}`;
            fetch(apiUrl)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    const product = data.data;

                    // Populate product details
                    document.getElementById('productName').innerText = product.ten;
                    document.getElementById('productBrand').innerText = product.thuonghieu.ten;
                    document.getElementById('productCode').innerText = product.ma;
                    document.getElementById('productPrice').innerText = product.gia.toLocaleString() + ' VND';
                    document.getElementById('productOldPrice').innerText = ''; // Add old price if available
                    document.getElementById('productDescription').innerText = product.moTa;

                    // Populate color options
                    const colorOptions = document.getElementById('colorOptions');
                    product.listMauSac.forEach(color => {
                        const colorLabel = document.createElement('label');
                        colorLabel.innerHTML = `<input type="radio" name="color" value="${color.ten}"> ${color.ten}`;
                        colorOptions.appendChild(colorLabel);
                    });

                    // Populate size options
                    const sizeOptions = document.getElementById('sizeOptions');
                    product.listSize.forEach(size => {
                        const sizeLabel = document.createElement('label');
                        sizeLabel.innerHTML = `<input type="radio" name="size" value="${size.ten}"> ${size.ten}`;
                        sizeOptions.appendChild(sizeLabel);
                    });

                    // Set the price in a hidden input
                    document.getElementById('priceProduct').value = product.gia;

                    // Total price calculation based on quantity
                    const quantityInput = document.getElementById('quantityInput');
                    const totalPriceValue = document.getElementById('totalPriceValue');
                    quantityInput.addEventListener('input', function () {
                        const quantity = parseInt(quantityInput.value);
                        totalPriceValue.innerText = (product.gia * quantity).toLocaleString() + ' VND';
                        document.getElementById('total_price').style.display = quantity > 0 ? 'block' : 'none';
                    });
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                });
        });
    }


    fetchProducts();
    detailProduct();
});



