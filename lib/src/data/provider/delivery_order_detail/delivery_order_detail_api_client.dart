import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/order_menu_model.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_req_dto.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_payment_detail_res_dto.dart';

part 'delivery_order_detail_api_client.g.dart';

@RestApi()
abstract class DeliveryOrderDetailApiClient {
  factory DeliveryOrderDetailApiClient(Dio dio, {String baseUrl}) =
      _DeliveryOrderDetailApiClient;

  // 모집글 인원 모집 완료(A) TEST
  @GET('/api/delivery-rooms/{deliveryRoomId}/close-recruit')
  Future<int> completeDeliveryRecruit(
      @Path('deliveryRoomId') int deliveryRoomId);

  // 주도자 배달 주문 정보 등록(B) TEST
  @POST('/api/delivery-rooms/{deliveryRoomId}/completed-order')
  @MultiPart()
  Future<String> registerDeliveryRoomOrderDeatil(
    @Path('deliveryRoomId') int deliveryRoomId,
    @Part(name: 'orderDetail') DeliveryOrderDetailReqDTO deliveryOrderDetailDto,
    @Part() List<File> orderFormList,
  );

  // 최종 배달 주문 정보 조회(C) TEST
  @GET('/api/delivery-rooms/{deliveryRoomId}/order-detail')
  Future<DeliveryPaymentDetailResDTO> getDeliveryPaymentDetail(
      @Path() int deliveryRoomId);

  // 모집글 상세정보 조회 TEST
  @GET('/api/delivery-rooms/{deliveryRoomId}')
  Future<DeliveryRoom> getDeliveryRoomInfoDetail(
      @Path('deliveryRoomId') int deliveryRoomId);

  // 모집글 참여 신청 거절 TEST
  @GET('/api/delivery-rooms/orders-reject')
  Future<void> rejectUserOrder(
    @Query("userId") int userId,
    @Query("roomId") int roomId,
  );

  // 모집글 주문 정보 조회 TEST
  @GET('/api/delivery-rooms/orders/{deliveryRoomId}')
  Future<List<OrderMenuModel>> getOrderList(@Path() int deliveryRoomId);

  // 모집글 삭제
  @DELETE('/api/delivery-rooms/{deliveryRoomId}')
  Future<int> deleteDeliveryRoom(@Path() int deliveryRoomId);

  // 참여 모집글 퇴장
  @GET('/api/delivery-rooms/{deliveryRoomsId}/exit-room')
  Future<void> exitDeliveryRoom(@Path() int deliveryRoomsId);
}
