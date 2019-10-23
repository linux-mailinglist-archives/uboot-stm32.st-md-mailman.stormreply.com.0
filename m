Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A16E15B6
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 11:27:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D66AAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 09:27:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8504C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 09:27:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9N9PuYd010999; Wed, 23 Oct 2019 11:27:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=oQHHmH+ISr6PXBsPM50zKqnjBcuvl58LGblJvPGBPTs=;
 b=x6WH+Qd4QJx5JFIPh4LPeEsPAGmh7Pvo8hqguoUE4l7iq99ToKFVnZ3EmkuOzko8Brmq
 XrL9mowKL3Ul4qxUt2WegEoL3gqNJd+gLiFW9LnKP3uj+uTtqOQ7fv6NBeUNVE61byDQ
 tlH/yxXRkLKjQ02Nr8LqR31OOxLqFDdvF0PAGbnb1mIBw+0YLLAJ04ZRe14FDBKMLOGy
 fLQ9WdTjWzls/yKX4VVgIL+XO2qu1SZanMKLwMDwPFw02KIf4wjIqLoYcNRIqLcPfPSl
 LLPy08NWf2Df4S5V27lS1SssuWzB+0xUzcJwSeLNx0in/A2E5WKwFpCQ2h0LI+Kn3QG2 Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s4tr0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 11:27:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 203C8100038;
 Wed, 23 Oct 2019 11:27:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16F7B2B35BA;
 Wed, 23 Oct 2019 11:27:04 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 23 Oct
 2019 11:27:03 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 23 Oct 2019 11:27:03 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v3 15/15] stm32mp1: add support for virtual
 partition read
Thread-Index: AQHViYQHMxcUIgtPrEu3W59znG1w6g==
Date: Wed, 23 Oct 2019 09:27:03 +0000
Message-ID: <e652bd1f-ec6c-d684-452d-aed33d231b85@st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
 <20191014072812.21843-16-patrick.delaunay@st.com>
In-Reply-To: <20191014072812.21843-16-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <95B4353B6D91DF4588A7DFBB376449E1@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_02:2019-10-22,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 15/15] stm32mp1: add support for
 virtual partition read
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrick

see below

On 10/14/19 9:28 AM, Patrick Delaunay wrote:
> Add read for OTP and PMIC NVM with alternates
> on virtual DFU device.
>
> Serie-cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3:
> - rebase on v2019.10
> - remove previous patch 16/16 pushed by error in v2
>   http://patchwork.ozlabs.org/patch/1162076/
>
> Changes in v2:
> - Update after Lukasz Majewski comments
>
>  board/st/stm32mp1/stm32mp1.c        | 83 +++++++++++++++++++++++++++++
>  configs/stm32mp15_basic_defconfig   |  1 +
>  configs/stm32mp15_optee_defconfig   |  1 +
>  configs/stm32mp15_trusted_defconfig |  1 +
>  4 files changed, 86 insertions(+)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index e4bdf05cd7..6045850c05 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -975,9 +975,92 @@ void set_dfu_alt_info(char *interface, char *devstr)
>  	if (!IS_ERR_OR_NULL(mtd))
>  		board_get_alt_info("spi-nand0", buf);
>  
> +#ifdef CONFIG_DFU_VIRT
> +	strncat(buf, "&virt 0=OTP", DFU_ALT_BUF_LEN);
> +
> +	if (IS_ENABLED(CONFIG_PMIC_STPMIC1))
> +		strncat(buf, "&virt 1=PMIC", DFU_ALT_BUF_LEN);
> +#endif
> +
>  	env_set("dfu_alt_info", buf);
>  	puts("DFU alt info setting: done\n");
>  }
> +
> +#if CONFIG_IS_ENABLED(DFU_VIRT)
> +#include <dfu.h>
> +#include <power/stpmic1.h>
> +
> +int dfu_otp_read(u64 offset, u8 *buffer, long *size)
> +{
> +	struct udevice *dev;
> +	int ret;
> +
> +	ret = uclass_get_device_by_driver(UCLASS_MISC,
> +					  DM_GET_DRIVER(stm32mp_bsec),
> +					  &dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = misc_read(dev, offset + STM32_BSEC_OTP_OFFSET, buffer, *size);
> +	if (ret >= 0) {
> +		*size = ret;
> +		ret = 0;
> +	}
> +
> +	return 0;

"return ret;" instead ?

> +}
> +
> +int dfu_pmic_read(u64 offset, u8 *buffer, long *size)
> +{
> +	int ret;
> +#ifdef CONFIG_PMIC_STPMIC1
> +	struct udevice *dev;
> +
> +	ret = uclass_get_device_by_driver(UCLASS_MISC,
> +					  DM_GET_DRIVER(stpmic1_nvm),
> +					  &dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = misc_read(dev, 0xF8 + offset, buffer, *size);
> +	if (ret >= 0) {
> +		*size = ret;
> +		ret = 0;
> +	}
> +	if (ret == -EACCES) {
> +		*size = 0;
> +		ret = 0;
> +	}
> +#else
> +	pr_err("PMIC update not supported");
> +	ret = -EOPNOTSUPP;
> +#endif
> +
> +	return ret;
> +}
> +
> +int dfu_read_medium_virt(struct dfu_entity *dfu, u64 offset,
> +			 void *buf, long *len)
> +{
> +	switch (dfu->data.virt.dev_num) {
> +	case 0x0:
> +		return dfu_otp_read(offset, buf, len);
> +	case 0x1:
> +		return dfu_pmic_read(offset, buf, len);
> +	}
> +	*len = 0;


insert a blank line

> +	return 0;
> +}
> +
> +int __weak dfu_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
> +{
> +	*size = SZ_1K;
> +
> +	return 0;
> +}
> +
> +#endif
> +
>  #endif
>  
>  static void board_copro_image_process(ulong fw_image, size_t fw_size)
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 699e687891..29e697ee67 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -66,6 +66,7 @@ CONFIG_STM32_ADC=y
>  CONFIG_DFU_MMC=y
>  CONFIG_DFU_RAM=y
>  CONFIG_DFU_MTD=y
> +CONFIG_DFU_VIRT=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
>  CONFIG_FASTBOOT_BUF_SIZE=0x02000000
> diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
> index 387de0ad35..3b8a90de2d 100644
> --- a/configs/stm32mp15_optee_defconfig
> +++ b/configs/stm32mp15_optee_defconfig
> @@ -53,6 +53,7 @@ CONFIG_STM32_ADC=y
>  CONFIG_DFU_MMC=y
>  CONFIG_DFU_RAM=y
>  CONFIG_DFU_MTD=y
> +CONFIG_DFU_VIRT=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
>  CONFIG_FASTBOOT_BUF_SIZE=0x02000000
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 29c23c634d..bcbd8a5c4e 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -52,6 +52,7 @@ CONFIG_STM32_ADC=y
>  CONFIG_DFU_MMC=y
>  CONFIG_DFU_RAM=y
>  CONFIG_DFU_MTD=y
> +CONFIG_DFU_VIRT=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
>  CONFIG_FASTBOOT_BUF_SIZE=0x02000000
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
