// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public static let commonAvoidCautionLabel = L10n.tr("Localizable", "common_avoid_caution_label", fallback: "ไม่ต้องเตือนอีก")
  public static let commonButtonAgreeLabel = L10n.tr("Localizable", "common_button_agree_label", fallback: "ตกลง")
  public static let commonButtonBuyLabel = L10n.tr("Localizable", "common_button_buy_label", fallback: "ซื้อ")
  public static let commonButtonCancelLabel = L10n.tr("Localizable", "common_button_cancel_label", fallback: "ยกเลิก")
  public static let commonButtonConfirmLabel = L10n.tr("Localizable", "common_button_confirm_label", fallback: "ยืนยัน")
  public static let commonButtonEditLabel = L10n.tr("Localizable", "common_button_edit_label", fallback: "แก้ไข")
  public static let commonButtonFollowLabel = L10n.tr("Localizable", "common_button_follow_label", fallback: "ติดตาม")
  public static let commonButtonFollowingLabel = L10n.tr("Localizable", "common_button_following_label", fallback: "ติดตามแล้ว")
  public static let commonButtonNoLabel = L10n.tr("Localizable", "common_button_no_label", fallback: "ไม่")
  public static let commonButtonSaveLabel = L10n.tr("Localizable", "common_button_save_label", fallback: "บันทึก")
  public static let commonButtonSelectLabel = L10n.tr("Localizable", "common_button_select_label", fallback: "เลือก")
  public static let commonButtonYesLabel = L10n.tr("Localizable", "common_button_yes_label", fallback: "ใช่")
  public static let commonCommentPlaceholderLabel = L10n.tr("Localizable", "common_comment_placeholder_label", fallback: "แสดงความคิดเห็น")
  public static func commonDaySuffixLabel(_ p1: Any) -> String {
    return L10n.tr("Localizable", "common_day_suffix_label", String(describing: p1), fallback: "%@ วัน")
  }
  public static let commonDialogErrorTitleLabel = L10n.tr("Localizable", "common_dialog_error_title_label", fallback: "เกิดข้อผิดพลาด\nกรุณาลองใหม่อีกครั้งในภายหลัง")
  public static func commonDialogRentCompletedTitleLabel(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "common_dialog_rent_completed_title_label", String(describing: p1), String(describing: p2), fallback: "เช่า%@ %@ เรียบร้อย")
  }
  public static let commonDialogSaveSuccessLabel = L10n.tr("Localizable", "common_dialog_save_success_label", fallback: "บันทึกเรียบร้อย")
  public static let commonDialogSelectPhotoTitleLabel = L10n.tr("Localizable", "common_dialog_select_photo_title_label", fallback: "เลือกรูปภาพ")
  public static let commonDialogShareSuccessLabel = L10n.tr("Localizable", "common_dialog_share_success_label", fallback: "แชร์เรียบร้อย")
  public static let commonFreeLabel = L10n.tr("Localizable", "common_free_label", fallback: "ฟรี")
  public static func commonHourSuffixLabel(_ p1: Any) -> String {
    return L10n.tr("Localizable", "common_hour_suffix_label", String(describing: p1), fallback: "%@ ชั่วโมง")
  }
  public static let commonLoadingLabel = L10n.tr("Localizable", "common_loading_label", fallback: "กำลังโหลด")
  public static func commonMinuteSuffixLabel(_ p1: Any) -> String {
    return L10n.tr("Localizable", "common_minute_suffix_label", String(describing: p1), fallback: "%@ นาที")
  }
  public static func commonMonthSuffixLabel(_ p1: Any) -> String {
    return L10n.tr("Localizable", "common_month_suffix_label", String(describing: p1), fallback: "%@ เดือน")
  }
  public static let commonNotApplicableLabel = L10n.tr("Localizable", "common_not_applicable_label", fallback: "N/A")
  public static let commonOpenPhotoLibraryLabel = L10n.tr("Localizable", "common_open_photo_library_label", fallback: "เปิดคลังภาพ")
  public static let commonPhotoShootLabel = L10n.tr("Localizable", "common_photo_shoot_label", fallback: "ถ่ายภาพ")
  public static let settingsBlockLabel = L10n.tr("Localizable", "settings_block_label", fallback: "บล็อก")
  public static let settingsMicrophoneOffLabel = L10n.tr("Localizable", "settings_microphone_off_label", fallback: "ปิดไมค์")
  public static let settingsMicrophoneOnLabel = L10n.tr("Localizable", "settings_microphone_on_label", fallback: "เปิดไมค์")
  public static let settingsReportLabel = L10n.tr("Localizable", "settings_report_label", fallback: "รายงาน")
  public static let settingsRoomLabel = L10n.tr("Localizable", "settings_room_label", fallback: "ตั้งค่าห้อง")
  public static let settingsShareLabel = L10n.tr("Localizable", "settings_share_label", fallback: "แชร์")
  public static let settingsSoundOffLabel = L10n.tr("Localizable", "settings_sound_off_label", fallback: "ปิดเสียง")
  public static let settingsSoundOnLabel = L10n.tr("Localizable", "settings_sound_on_label", fallback: "เปิดเสียง")
  public static let settingsUnblockLabel = L10n.tr("Localizable", "settings_unblock_label", fallback: "ปลดบล็อก")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = FeatureBundlePod.resourcesBundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
