<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>

<form action="trangcanhan" method="post" enctype="multipart/form-data">
	<div id="profile" class="site-section-phong">
		<div class="container">

			<div class="row profile-row p-4 my-5">
				<c:url
					value="/hinhanh?fname=${sessionScope.account.getAnhdaidien()}&path=taikhoan"
					var="anh" />
				<div class="d-flex col-12" style="align-items: center;">
					<img id="previewImg"
						class="rounded-circle profile-img img-thumbnail" src="${anh }">
					<h2 class="text-black mb-0 ml-3">Welcome,
						${sessionScope.account.getTen() }</h2>
					<label class="ml-3 label-img" for="anhdaidien"><i
						class="bi bi-upload"></i> Upload</label> <input hidden type="file"
						name="anhdaidien" id="anhdaidien" onchange="previewFile(this);"
						class="inputfile">
					<button hidden id="btn-luu-anh"
						class="btn btn-dark ml-4 btn-save-profile" type="submit">Lưu</button>
					<c:if test="${not empty wrongOldPassword}">
						<p class="text-danger my-0">${wrongOldPassword}</p>
					</c:if>
				</div>
				<input readonly hidden type="text" id="id_tk"
					name="id_tk" value="${sessionScope.account.getId_tk()}">
				<div class="col-8 text-black">
					<div class="row my-4 justify-content-around">
						<a class="btn btn-info" href="/timphong/favorites"> Phòng đã
							lưu </a> <a class="btn btn-success" href="/timphong/listdathen">Quản
							lý đặt hẹn</a>
						<c:if test="${sessionScope.account.getQuyen() == 3}">
							<a class="btn btn-warning" href="/timphong/seller/ql-phong">Quản
								lý phòng</a>
							<a class="btn btn-danger" href="/timphong/xacnhan-p">Xác nhận</a>
						</c:if>
					</div>
					<div class="d-flex my-4 profile-content pb-3 border-bottom">
						<div>
							<h4>Họ và tên</h4>
							<p>${sessionScope.account.getHo()}
								${sessionScope.account.getTen()}</p>
						</div>
						<input type="checkbox" hidden id="edit-input--name"
							name="edit-input--name"> <label for="edit-input--name"
							class="label-edit-profile">Chỉnh sửa</label>


						<div class="edit-input--content row col-12 justify-content-end">
							<div class="col-6">
								<div class=" border border-3 profile-content-change px-3 py-2">
									<label class="" for="fname">Họ</label> <input
										class="border-0 profile-content-input" type="text" id="fname"
										name="fname" value="${sessionScope.account.getHo()}">
								</div>
							</div>
							<div class="col-6">
								<div class=" border border-3 profile-content-change px-3 py-2">
									<label class="" for="lname">Tên</label> <input
										class="border-0 profile-content-input" type="text" id="lname"
										name="lname" value="${sessionScope.account.getTen()}">
								</div>
							</div>
							<button class="btn btn-dark mt-4 btn-save-profile" type="submit">Lưu</button>

						</div>
					</div>
					<div class="d-flex my-4 profile-content pb-3 border-bottom">
						<div>
							<h4>Tên tài khoản</h4>
							<p>
								<c:out value="${sessionScope.account.getTentk().charAt(0) }" />
								<c:forEach begin="2"
									end="${sessionScope.account.getTentk().length() - 1}">
									<c:out value="*" />
								</c:forEach>
								<c:out
									value="${sessionScope.account.getTentk().substring(sessionScope.tkentity.getTentk().length()-1) }" />
							</p>
						</div>

					</div>
					<div class="d-flex my-4 profile-content pb-3 border-bottom">
						<div>
							<h4>Email</h4>
							<p>
								<c:out value="${sessionScope.account.getEmail().charAt(0) }" />
								<c:forEach begin="2"
									end="${sessionScope.account.getEmail().indexOf(64) }">
									<c:out value="*" />
								</c:forEach>
								<c:out
									value="${sessionScope.account.getEmail().substring(sessionScope.tkentity.getEmail().indexOf(64)) }" />

							</p>
						</div>
						<input type="checkbox" hidden id="edit-input--email"
							name="edit-input--name"> <label for="edit-input--email"
							class="label-edit-profile">Chỉnh sửa</label>
						<div class="edit-input--content row col-12">
							<div class="col-12">
								<div class=" border border-3 profile-content-change px-3 py-2">
									<label class="" for="email">Email</label> <input
										class="border-0 profile-content-input" type="email" id="email"
										name="email">
								</div>
							</div>
							<button class="btn btn-dark mt-4 btn-save-profile" type="submit">Lưu</button>

						</div>
					</div>
					<div class="d-flex my-4 profile-content pb-3 border-bottom">
						<div>
							<h4>Số điện thoại</h4>
							<p>${sessionScope.account.getSdt()}</p>
						</div>
						<input type="checkbox" hidden id="edit-input--sdt"
							name="edit-input--name"> <label for="edit-input--sdt"
							class="label-edit-profile">Chỉnh sửa</label>
						<div class="edit-input--content row col-12">
							<div class="col-12">
								<div class=" border border-3 profile-content-change px-3 py-2">
									<label class="" for="sdt">Số điện thoại</label> <input
										class="border-0 profile-content-input" type="text" id="sdt"
										name="sdt" value="${sessionScope.account.getSdt()}">
								</div>
							</div>
							<button class="btn btn-dark mt-4 btn-save-profile" type="submit">Lưu</button>
						</div>
					</div>
					<div class="d-flex my-4 profile-content pb-3 border-bottom">
						<div>
							<h4>Bạn đang là</h4>
							<c:if test="${sessionScope.account.getQuyen() ==2}">
								<p>User</p>
							</c:if>
							<c:if test="${sessionScope.account.getQuyen() ==3}">
								<p>Seller</p>
							</c:if>
						</div>

						<input hidden readonly type="text" id="quyen" name="quyen"
							value="${sessionScope.account.getQuyen()}">
						<c:if test="${sessionScope.account.getQuyen() ==2}">
							<input type="checkbox" hidden id="edit-input--seller"
								name="edit-input--seller">
							<label for="edit-input--seller" class="label-edit-profile">Đăng
								ký làm Seller</label>
							<div class="edit-input--content__seller row col-12">


								<div class="edit-input--content__seller-layer">
									<div
										class="container-login__header register__container__header row">
										<span class="container-login__header__logo"> <a
											href="<c:url value='/trangchu'/>"> <img
												style="width: 120px; height: 120px;"
												src="${url }images/Logo.png" class="container__header__img">
										</a>
										</span> <span
											class="container-login__header__text register__container__header__text text_underline register__container__header__text--underline">FIND
											ROOM </span>
									</div>
									<p style="font-size: 14px">
										Bằng việc nhấn vào nút đăng ký, bạn sẽ cam kết với chúng tôi
										về các <u>Khoản điều lệ</u> mà chúng tôi đưa ra<br>Bạn
										cũng sẽ chịu mọi trách nhiệm nếu vi phạm điều khoản, pháp
										luật.
									</p>
									<div>
										<button class="btn btn-dark btn-save-profile mr-4"
											type="submit" onClick="dangKySeller();">Đồng ý</button>
										<label class="btn btn-light btn-save-profile mb-0 ml-4"
											for="edit-input--seller">Hủy</label>
									</div>
								</div>
							</div>
						</c:if>

					</div>
					<div class="d-flex my-4 profile-content pb-3">
						<div>
							<h4>Mật khẩu</h4>
							<c:forEach begin="1"
								end="${sessionScope.account.getMatkhau().length() }">
								<c:out value="*" />
							</c:forEach>

						</div>
						<input type="checkbox" hidden id="edit-input--password"
							name="edit-input--password"> <label
							for="edit-input--password" class="label-edit-profile">Đổi
							mật khẩu</label>
						<div class="edit-input--content row col-12">
							<div class="col-6">
								<div class=" border border-3 profile-content-change px-3 py-2">
									<label class="" for="">Mật khẩu cũ</label> <input
										class="border-0 profile-content-input" type="password"
										id="oldpassword" name="oldpassword">
								</div>
							</div>
							<div class="col-6">
								<div class=" border border-3 profile-content-change px-3 py-2">
									<label class="" for="newpassword">Mật khẩu mới</label> <input
										class="border-0 profile-content-input" type="password"
										id="newpassword" name="newpassword" value="">
								</div>
							</div>
							<button class="btn btn-dark mt-4 btn-save-profile" type="submit">Lưu</button>

						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="_1heub6i border profile-ques p-4">
						<svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg"
							aria-hidden="true" role="presentation" focusable="false"
							style="display: block; height: 48px; width: 48px; fill: rgb(227, 28, 95); stroke: currentcolor;">
						<g>
						<g stroke="none">
						<path
								d="M27 5l.585.005c4.29.076 8.837.984 13.645 2.737l.77.288V35.4l-.008.13a1 1 0 0 1-.47.724l-.116.06L27 42.716V25a1 1 0 0 0-.883-.993L26 24H12V8.029l.77-.286c4.797-1.75 9.336-2.658 13.62-2.737L27 5z"
								fill-opacity=".2"></path>
						<path
								d="M27 1c5.599 0 11.518 1.275 17.755 3.816a2 2 0 0 1 1.239 1.691L46 6.67V35.4a5 5 0 0 1-2.764 4.472l-.205.097-15.594 6.93L27 47l-2.461-1h2.451a.01.01 0 0 0 .007-.003L27 45.99v-1.085l15.218-6.763a3 3 0 0 0 1.757-2.351l.019-.194.006-.196V6.669l-.692-.278C37.557 4.128 32.121 3 27 3S16.443 4.128 10.692 6.391L10 6.67 9.999 24H8V6.669a2 2 0 0 1 1.098-1.786l.147-.067C15.483 2.275 21.401 1 27 1z"></path></g>
						<g fill="none" stroke-width="2">
						<path
								d="M4 24h22a1 1 0 0 1 1 1v20.99a.01.01 0 0 1-.01.01H4a1 1 0 0 1-1-1V25a1 1 0 0 1 1-1z"></path>
						<path d="M21 25v-5a6 6 0 1 0-12 0v5"></path>
						<circle cx="15" cy="35" r="2"></circle></g></g></svg>
						<h5 class="text-black my-2">Tại sao thông tin của tôi không
							được hiển thị ở đây?</h5>
						<p class="pb-2 mb-4 border-bottom">Chúng tôi đang ẩn một số
							thông tin tài khoản để bảo vệ danh tính của bạn.</p>
						<svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg"
							aria-hidden="true" role="presentation" focusable="false"
							style="display: block; height: 48px; width: 48px; fill: rgb(227, 28, 95); stroke: currentcolor;">
						<g stroke="none">
						<path d="m39 15.999v28.001h-30v-28.001z" fill-opacity=".2"></path>
						<path
								d="m24 0c5.4292399 0 9.8479317 4.32667079 9.9961582 9.72009516l.0038418.27990484v2h7c1.0543618 0 1.9181651.8158778 1.9945143 1.8507377l.0054857.1492623v32c0 1.0543618-.8158778 1.9181651-1.8507377 1.9945143l-.1492623.0054857h-34c-1.0543618 0-1.91816512-.8158778-1.99451426-1.8507377l-.00548574-.1492623v-32c0-1.0543618.81587779-1.9181651 1.85073766-1.9945143l.14926234-.0054857h7v-2c0-5.5228475 4.4771525-10 10-10zm17 14h-34v32h34zm-17 14c1.6568542 0 3 1.3431458 3 3s-1.3431458 3-3 3-3-1.3431458-3-3 1.3431458-3 3-3zm0 2c-.5522847 0-1 .4477153-1 1s.4477153 1 1 1 1-.4477153 1-1-.4477153-1-1-1zm0-28c-4.3349143 0-7.8645429 3.44783777-7.9961932 7.75082067l-.0038068.24917933v2h16v-2c0-4.418278-3.581722-8-8-8z"></path></g></svg>
						<h5 class="text-black my-2">Bạn có thể chỉnh sửa những thông
							tin nào?</h5>
						<p class="pb-2 mb-4 border-bottom">Không thể thay đổi thông
							tin mà FINDROOM sử dụng để xác minh danh tính của bạn. Bạn có thể
							chỉnh sửa thông tin liên hệ và một số thông tin cá nhân, nhưng
							chúng tôi có thể yêu cầu bạn xác minh danh tính vào lần tới khi
							bạn đặt phòng hoặc tạo mục cho thuê.</p>
						<svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg"
							aria-hidden="true" role="presentation" focusable="false"
							style="display: block; height: 48px; width: 48px; fill: rgb(227, 28, 95); stroke: currentcolor;">
						<g stroke="none">
						<path
								d="M24 9C14.946 9 7.125 15.065 4.74 23.591L4.63 24l.013.054c2.235 8.596 9.968 14.78 18.99 14.943L24 39c9.053 0 16.875-6.064 19.26-14.59l.11-.411-.013-.052c-2.234-8.597-9.968-14.78-18.99-14.944L24 9z"
								fill-opacity=".2"></path>
						<path
								d="M24 5c11.18 0 20.794 7.705 23.346 18.413l.133.587-.133.587C44.794 35.295 35.181 43 24 43 12.82 43 3.206 35.295.654 24.588l-.133-.587.048-.216C2.985 12.884 12.69 5 24 5zm0 2C13.88 7 5.16 13.887 2.691 23.509l-.12.492.032.14c2.288 9.564 10.728 16.513 20.65 16.846l.377.01L24 41c10.243 0 19.052-7.056 21.397-16.861l.031-.14-.031-.138c-2.288-9.566-10.728-16.515-20.65-16.848l-.377-.01L24 7zm0 10a7 7 0 1 1 0 14 7 7 0 0 1 0-14zm0 2a5 5 0 1 0 0 10 5 5 0 0 0 0-10z"></path></g></svg>
						<h5 class="text-black my-2">Thông tin nào được chia sẻ với
							người khác?</h5>
						<p class="pb-2 mb-4 ">FINDROOM chỉ tiết lộ thông tin liên lạc
							cho Chủ nhà/Người tổ chức và khách sau khi đặt phòng/đặt chỗ được
							xác nhận.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>


<script>
	function previewFile(input) {
		var btnLuuAnh = document.getElementById("btn-luu-anh");
		var file = $("input[type=file]").get(0).files[0];
		if (file) {
			var reader = new FileReader();

			reader.onload = function() {
				$("#previewImg").attr("src", reader.result);
				btnLuuAnh.removeAttribute("hidden");
			}
			reader.readAsDataURL(file);
		}
	}

	function dangKySeller() {
		var quyen = document.getElementById("quyen");
		quyen.value = 3;
	}
</script>