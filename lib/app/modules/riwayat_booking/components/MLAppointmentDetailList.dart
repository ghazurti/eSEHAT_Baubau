import 'package:eSEHATBAUBAU/app/data/MLTopHospitalData.dart';
import 'package:eSEHATBAUBAU/app/modules/riwayat_booking/controllers/riwayat_booking_controller.dart';
import 'package:eSEHATBAUBAU/app/utils/MLColors.dart';
import 'package:eSEHATBAUBAU/app/utils/MLDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class MLAppointmentDetailList extends StatefulWidget {
  @override
  MLAppointmentDetailListState createState() => MLAppointmentDetailListState();
}

class MLAppointmentDetailListState extends State<MLAppointmentDetailList> {
  List<MLTopHospitalData> topHospitalList = mlHospitalListDataList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget mOption(var value) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(Icons.location_searching, size: 12).paddingRight(8),
          ),
          TextSpan(
              text: value, style: secondaryTextStyle(size: 12, color: black)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RiwayatBookingController>();
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(bottom: 80),
        padding: EdgeInsets.all(12.0),
        decoration: boxDecorationWithRoundedCorners(
            border: Border.all(color: mlColorLightGrey),
            borderRadius: radius(12)),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(('images/reservation.jpg').validate(),
                      width: double.infinity, height: 150.0, fit: BoxFit.cover)
                  .cornerRadiusWithClipRRect(8.0),
              16.height,
              Text(
                  ('${controller.setting.value.data?.namaInstansi}').validate(),
                  style: boldTextStyle()),
              16.height,
              Divider(thickness: 0.5),
              16.height,
              mOption('No. Antrian'),
              4.height,
              Text(controller.selectedRiwayatBooking.value.noReg.validate(),
                      style: primaryTextStyle(color: mlColorDarkBlue))
                  .paddingLeft(18.0),
              16.height,
              mOption('Poliklinik'),
              4.height,
              Text(controller.selectedRiwayatBooking.value.nmPoli.validate(),
                      style: primaryTextStyle(color: mlColorDarkBlue))
                  .paddingLeft(18.0),
              16.height,
              mOption('Dokter'),
              4.height,
              Text(controller.selectedRiwayatBooking.value.nmDokter.validate(),
                      style: primaryTextStyle(color: mlColorDarkBlue))
                  .paddingLeft(18.0),
              16.height,
              mOption('Tanggal Rencana Periksa'),
              4.height,
              Text(
                      DateFormat("dd-MM-yyyy").format(controller
                          .selectedRiwayatBooking.value.tanggalPeriksa!),
                      style: primaryTextStyle(color: mlColorDarkBlue))
                  .paddingLeft(18.0),
              16.height,
              mOption('Jenis Bayar'),
              4.height,
              Text(controller.selectedRiwayatBooking.value.pngJawab!,
                      style: primaryTextStyle(color: mlColorDarkBlue))
                  .paddingLeft(18.0),
              16.height,
              mOption('Status'),
              4.height,
              Text(controller.selectedRiwayatBooking.value.status!,
                      style: primaryTextStyle(color: mlColorDarkBlue))
                  .paddingLeft(18.0),
              16.height,
              controller.selectedRiwayatBooking.value.status == 'Belum'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppButton(
                          height: 50,
                          width: Get.width / 3,
                          color: mlColorDarkBlue,
                          child: Text(
                            "Check In",
                            style: boldTextStyle(color: white),
                          ),
                          onTap: () => controller.checkin(),
                        ).cornerRadiusWithClipRRect(10),
                        AppButton(
                          height: 50,
                          width: Get.width / 3,
                          color: Colors.red,
                          child: Text(
                            "Batal",
                            style: boldTextStyle(color: white),
                          ),
                          onTap: () => controller.batalCheckin(),
                        ).cornerRadiusWithClipRRect(10)
                      ],
                    )
                  : Container(),
            ],
          ),
        ).paddingAll(16.0),
      ),
    );
  }
}
