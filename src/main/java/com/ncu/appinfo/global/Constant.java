package com.ncu.appinfo.global;

/**
 * Constant
 *
 * @author wzzfarewell
 * @date 2019/8/6
 **/
public class Constant {

    public static final String CURRENT_USER = "current_user";
    public static final String CHECK_CODE = "check_code";

    public static final String LEVEL1_CATEGORY = "一级分类";
    public static final String LEVEL2_CATEGORY = "二级分类";
    public static final String LEVEL3_CATEGORY = "三级分类";

    public static final String APP_STATUS = "AppStatus";
    public static final String APP_PLATFORM = "AppPlatform";
    public static final String PUBLISH_STATUS = "PublishStatus";

    /**
     * APP状态
     */
    public enum AppStatus{
        UNCHECKED(1, "待审核"),
        CHECKED_SUCCESS(2, "审核通过"),
        CHECKED_FAIL(3, "审核未通过"),
        ON_SALE(4, "已上架"),
        OFF_SALE(5, "已下架");

        private int code;
        private String value;

        AppStatus(int code, String value) {
            this.code = code;
            this.value = value;
        }

        public int getCode() {
            return code;
        }

        public void setCode(int code) {
            this.code = code;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }

    /**
     * APP所属平台
     */
    public enum AppPlatform{
        PHONE(1, "手机"),
        IPAD(2, "平板"),
        COMMON(3, "通用");

        private int code;
        private String value;

        AppPlatform(int code, String value) {
            this.code = code;
            this.value = value;
        }

        public int getCode() {
            return code;
        }

        public void setCode(int code) {
            this.code = code;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }

    public enum PublishStatus{
        UNPUBLISHED(1, "未发布"),
        PUBLISHED(2, "已发布"),
        PRE_PUBLISH(3, "预发布");

        private int code;
        private String value;

        PublishStatus(int code, String value) {
            this.code = code;
            this.value = value;
        }

        public int getCode() {
            return code;
        }

        public void setCode(int code) {
            this.code = code;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }
}
