import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../base/helpers/upload-file.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/repositories/payment_repository.dart';
import '../../../domain/usecases/create_payment_receipt_usecase.dart';
import '../../../domain/usecases/get_presigned_url_usecase.dart';
import '../../../domain/usecases/params/create_payment_receipt_params.dart';
import '../../../domain/usecases/params/get_presigned_url_params.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentInitState()) {
    on<PaymentValidateEvent>(_onValidate);
    on<PaymentUploadImageEvent>(_onUploadImage);
    //on<PaymentUploadPresignedUrlEvent>(_uploadFilePresignedUrl);
    on<PaymentCreateReceiptEvent>(_onCreatePaymentReceipt);
  }

  final PaymentGetPresignedUrlUseCase _paymentGetPresignedUrlUseCase =
      PaymentGetPresignedUrlUseCase(
    paymentRepository: getIt.get<PaymentRepository>(),
  );
  final PaymentCreateReceiptUseCase _paymentCreateReceiptUseCase =
      PaymentCreateReceiptUseCase(
    paymentRepository: getIt.get<PaymentRepository>(),
  );

  _onValidate(PaymentValidateEvent event, emit) =>
      emit(const PaymentValidateState());

  _onUploadImage(PaymentUploadImageEvent event, emit) async {
    emit(const PaymentLoadingState());
    final presignedUrlRes =
        await _paymentGetPresignedUrlUseCase(PaymentGetPresignedUrlParams(
      filename: event.img.name,
    ));
    presignedUrlRes.fold(
      (l) {
        emit(const PaymentLoadingState(showLoading: false));
        emit(PaymentErrorState(
            exception: l, displayMessage: "Lỗi lấy link upload ảnh"));
      },
      (r) => add(PaymentUploadPresignedUrlEvent(img: event.img, url: r.data)),
    );
  }

  // _uploadFilePresignedUrl(PaymentUploadPresignedUrlEvent event, emit) async {
  //   final formData = FormData.fromMap({
  //     'file': await MultipartFile.fromFile(event.img.path),
  //   });

  //   try {
  //     final response = await Dio().put(event.url, data: formData);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       add(PaymentCreateReceiptEvent(
  //         imgUrl: event.url,
  //       ));
  //     }
  //   } catch (e) {
  //     emit(const PaymentLoadingState(showLoading: false));
  //     emit(PaymentErrorState(
  //       exception: AppException(
  //         error: e,
  //       ),
  //       displayMessage: "Lỗi lấy link upload ảnh",
  //     ));
  //   }

  //   // if (response.statusCode == 200 || response.statusCode == 201) {
  //   //   emit(PaymentUploadPresignedUrlSuccess(
  //   //     uploadedUrl: event.url,
  //   //   ));
  //   // } else {

  //   // }
  // }

  _onCreatePaymentReceipt(PaymentCreateReceiptEvent event, emit) async {
    final url = await uploadFile(event.img);
    final createReceiptRes = await _paymentCreateReceiptUseCase(
        CreatePaymentReceiptParams(imageURLs: [url]));
    createReceiptRes.fold(
      (l) => emit(PaymentCreateReceiptErrorState(
          exception: l,
          displayMessage:
              "Lỗi tạo hóa đơn chuyển khoản, vui lòng thử lại sau..")),
      (r) => emit(const PaymentCreateReceiptDoneState()),
    );
  }
}
