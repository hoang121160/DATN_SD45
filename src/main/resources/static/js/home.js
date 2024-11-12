$(document).ready(function () {
    // Hàm để lấy danh sách sản phẩm
    function fetchProducts() {
        $.ajax({
            url: '/san-pham',
            method: 'GET',
            dataType: 'json',  // Đảm bảo dữ liệu được xử lý như JSON
            success: function (response) {
                console.log(response);  // Kiểm tra dữ liệu trả về

                // Truy cập vào mảng `data` trong `response`
                const products = response.data;

                if (Array.isArray(products)) {
                    const productContainer = $('#product-info');
                    productContainer.empty(); // Xóa nội dung cũ

                    products.forEach(product => {
                        const productHtml = `
                            <div class="product">
                                <div class="image-wrapper">
                                    <a href="/productDetail/${product.id}">
                                        <img style="width: 270px; height: 270px;" src="/images/${product.anh}" alt="${product.ten}">
                                    </a>
                                    <div class="icon-heart">
                                        <a href="#"><i class="bi bi-heart heart"></i></a>
                                    </div>
                                </div>
                                <div class="mt-2">
                                    <p class="price" style="font-size: 20px"><b>${new Intl.NumberFormat('vi-VN', {
                            style: 'currency',
                            currency: 'VND'
                        }).format(product.gia)}</b></p>
                                    <p class="name" style="font-size: 18px;" >${product.ten}</p>
                                </div>
                            </div>
                        `;
                        productContainer.append(productHtml);
                    });
                } else {
                    console.error('Expected array but got:', products);
                }
            },
            error: function (error) {
                console.error('Error fetching products:', error);
            }
        });
    }

    // Gọi hàm fetchProducts để hiển thị danh sách sản phẩm

    $(document).ready(function () {
        // Hàm lấy productId từ URL
        function getProductIdFromUrl() {
            const url = window.location.href; // Lấy URL hiện tại
            const match = url.match(/\/productDetail\/(\d+)/); // Dùng regex để lấy id sản phẩm từ URL
            return match ? match[1] : null; // Trả về productId hoặc null nếu không tìm thấy
        }

        // Hàm tải chi tiết sản phẩm từ API
        function loadProductDetails(productId) {
            $.ajax({
                url: `/san-pham/${productId}`, // Địa chỉ API mới
                method: 'GET',
                success: function (data) {
                    if (data.data) {
                        const product = data.data;

                        // Cập nhật thông tin sản phẩm vào form
                        $('#productName').text(product.ten);
                        $('#productBrand').text(product.thuonghieu.ten); // Thương hiệu
                        $('#productCode').text(product.ma); // Mã sản phẩm
                        $('#productPrice').text(product.gia.toLocaleString() + ' VND'); // Giá sản phẩm
                        $('#productDescription').text(product.moTa); // Mô tả ngắn

                        // Cập nhật danh sách màu sắc (Sử dụng input radio buttons)
                        $('#colorOptions').empty();
                        product.listMauSac.forEach(function (mauSac, index) {
                            $('#colorOptions').append(`
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="color" id="color${mauSac.id}" value="${mauSac.id}">
                                <label class="form-check-label" for="color${mauSac.id}">${mauSac.ten}</label>
                            </div>
                        `);
                        });
                        //image
                        if (product.hinhAnhList && product.hinhAnhList.length > 0) {
                            // Nếu có ảnh, thêm vào carousel
                            product.hinhAnhList.forEach(function (image, index) {
                                const activeClass = index === 0 ? 'active' : '';  // Chỉ đánh dấu active cho ảnh đầu tiên
                                $('#productImages').append(`
                            <div class="carousel-item ${activeClass}">
                                <img style="width: 490px;height: auto;" src="/images/${image.anh}" class="d-block w-100" alt="ZIAZA">
                            </div>
                                `);
                            });
                        } else {
                            // Nếu không có ảnh, hiển thị thông báo
                            $('#productImages').append(`
                            <div class="text-center mt-5">
                            <img src="../images/logo.png" alt="">
                                <h3 class="text-uppercase">Shop sẽ sớm cập nhật hình ảnh!</h3>
                            </div>
                        `);
                        }



                        // Cập nhật danh sách kích thước (Sử dụng input radio buttons)
                        $('#sizeOptions').empty();
                        product.listSize.forEach(function (size, index) {
                            $('#sizeOptions').append(`
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="size" id="size${size.id}" value="${size.id}">
                                <label class="form-check-label" for="size${size.id}">${size.ten}</label>
                            </div>
                        `);
                        });

                        // Cập nhật số lượng sản phẩm còn lại
                        const totalQuantity = product.listSanPhamChiTiet.reduce((sum, item) => sum + item.soLuong, 0);
                        $('#quantityLeft').text(totalQuantity); // Số lượng còn lại trong kho

                        // Lắng nghe sự kiện thay đổi màu sắc hoặc kích thước
                        $('input[name="color"], input[name="size"]').on('change', function() {
                            updateQuantity(product);
                        });

                        // Xử lý tăng giảm số lượng mua
                        $('#increaseQuantity').on('click', function() {
                            let quantity = parseInt($('#quantityInput').val(), 10);
                            const maxQuantity = getMaxQuantity(product); // Số lượng tối đa có thể chọn

                            if (quantity < maxQuantity) {
                                $('#quantityInput').val(quantity + 1);
                            }
                            updateQuantityDisplay();
                        });

                        $('#decreaseQuantity').on('click', function() {
                            let quantity = parseInt($('#quantityInput').val(), 10);
                            if (quantity > 1) {
                                $('#quantityInput').val(quantity - 1);
                            }
                            updateQuantityDisplay();
                        });

                        // Sự kiện thay đổi trực tiếp trong input số lượng
                        $('#quantityInput').on('input', function() {
                            let quantity = parseInt($('#quantityInput').val(), 10);
                            const maxQuantity = getMaxQuantity(product);
                            if (quantity > maxQuantity) {
                                $('#quantityInput').val(maxQuantity); // Giới hạn số lượng nhập vào
                            } else if (quantity < 1) {
                                $('#quantityInput').val(1); // Không cho nhập dưới 1
                            }
                            updateQuantityDisplay();
                        });

                        // Vô hiệu hóa các lựa chọn không hợp lệ (kích thước hoặc màu sắc không còn)
                        disableUnavailableOptions(product);
                    } else {
                        console.log("No product data found.");
                    }
                },
                error: function (error) {
                    console.log("Error loading product details:", error);
                }
            });
        }

        // Hàm cập nhật số lượng còn lại dựa trên lựa chọn màu sắc và kích thước
        function updateQuantity(product) {
            const selectedColor = $('input[name="color"]:checked').val(); // Lấy giá trị màu sắc được chọn
            const selectedSize = $('input[name="size"]:checked').val();   // Lấy giá trị kích thước được chọn

            if (selectedColor && selectedSize) {
                // Lọc ra sản phẩm chi tiết với màu sắc và kích thước đã chọn
                const selectedProductDetail = product.listSanPhamChiTiet.find(item =>
                    item.idMauSac == selectedColor && item.idSize == selectedSize
                );

                // Hiển thị số lượng nếu có sản phẩm chi tiết tương ứng
                if (selectedProductDetail) {
                    $('#quantityLeft').text(selectedProductDetail.soLuong); // Cập nhật số lượng
                } else {
                    $('#quantityLeft').text(0); // Nếu không có sản phẩm chi tiết tương ứng, hiển thị 0
                }
            } else {
                $('#quantityLeft').text("Vui lòng Chọn màu sắc và kích thước"); // Hiển thị yêu cầu chọn đầy đủ khi chưa chọn màu sắc và kích thước
            }

            // Cập nhật tình trạng vô hiệu hóa các lựa chọn
            disableUnavailableOptions(product);
        }

        // Hàm vô hiệu hóa các lựa chọn không hợp lệ (kích thước hoặc màu sắc không còn)
        function disableUnavailableOptions(product) {
            const selectedColor = $('input[name="color"]:checked').val(); // Lấy giá trị màu sắc được chọn
            const selectedSize = $('input[name="size"]:checked').val();   // Lấy giá trị kích thước được chọn

            // Vô hiệu hóa các màu sắc không có kích thước tương ứng
            $('input[name="color"]').each(function() {
                const colorId = $(this).val();
                const availableSizes = product.listSanPhamChiTiet.filter(item =>
                    item.idMauSac == colorId && item.soLuong > 0
                ).map(item => item.idSize);

                if (selectedSize && !availableSizes.includes(parseInt(selectedSize))) {
                    $(this).prop('disabled', true); // Disable nếu không có size tương ứng
                } else {
                    $(this).prop('disabled', false); // Enable nếu có size tương ứng
                }
            });

            // Vô hiệu hóa các kích thước không có màu sắc tương ứng
            $('input[name="size"]').each(function() {
                const sizeId = $(this).val();
                const availableColors = product.listSanPhamChiTiet.filter(item =>
                    item.idSize == sizeId && item.soLuong > 0
                ).map(item => item.idMauSac);

                if (selectedColor && !availableColors.includes(parseInt(selectedColor))) {
                    $(this).prop('disabled', true); // Disable nếu không có màu tương ứng
                } else {
                    $(this).prop('disabled', false); // Enable nếu có màu tương ứng
                }
            });
        }

        // Lấy số lượng tối đa có thể chọn từ radio size và màu sắc
        function getMaxQuantity(product) {
            const selectedColor = $('input[name="color"]:checked').val();
            const selectedSize = $('input[name="size"]:checked').val();

            if (selectedColor && selectedSize) {
                // Lọc ra sản phẩm chi tiết với màu sắc và kích thước đã chọn
                const selectedProductDetail = product.listSanPhamChiTiet.find(item =>
                    item.idMauSac == selectedColor && item.idSize == selectedSize
                );
                return selectedProductDetail ? selectedProductDetail.soLuong : 0;
            }
            return 0; // Nếu chưa chọn màu sắc hoặc kích thước, không cho phép tăng số lượng
        }

        // Lấy productId từ URL và gọi API để lấy chi tiết sản phẩm
        const productId = getProductIdFromUrl();

        // Kiểm tra nếu productId hợp lệ, sau đó gọi hàm loadProductDetails
        if (productId) {
            loadProductDetails(productId);
        } else {
            console.log("Product ID not found in URL.");
        }
    });
    fetchProducts();
});