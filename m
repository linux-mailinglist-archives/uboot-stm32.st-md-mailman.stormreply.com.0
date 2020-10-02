Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0AC28101B
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 11:49:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADE05C3FAFF;
	Fri,  2 Oct 2020 09:49:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E03EC32EA8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:49:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0929lgSG012753; Fri, 2 Oct 2020 11:49:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=WeZVttGPA7qaeZ5DLSIaY11yyvzJujve5ZejxlTMKNc=;
 b=zravA5b7/bSILLNXCqqJKNOKjT4VDQ/SlazV+z9+79gwDHmmNr9PmPLUi+tGQ0IM2syF
 TC2j9MSMB75ItG/XHYHfSRXkxSBI+wfSH0XKrYNL7lHGmqZe/fIL879nlIrKKRjNI+WJ
 djbQ06sUVaoVzbgnM7BbLbuUd6t4uALC5buMbzST/jQ8ceQV3IFDsJ2SylwHjscgpTm1
 zbUJ19wLb4LeVtqZJEmU8ddPVqANNurq4A5K2Finp1lKYLr3XMPtjhBAKHH+mjwb4qHc
 xNMGKyPkCH/eUzXeU73rYr5pXtn9jYuuVNobUVrcHZxXUIa3CVzXX5paiZMLDuub8+h9 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33su409k7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 11:49:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D11F10002A;
 Fri,  2 Oct 2020 11:49:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 230E72B1506;
 Fri,  2 Oct 2020 11:49:01 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 11:48:34 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 11:48:34 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 1/4] configs: stm32mp1: enable fastboot
 support of eMMC boot partition
Thread-Index: AQHWmKExXedA77/uN06MDCi1ZNVVbQ==
Date: Fri, 2 Oct 2020 09:48:34 +0000
Message-ID: <8659f9e9-6d6d-c44f-132d-bb192b48751d@st.com>
References: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
In-Reply-To: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <0ED28ED09671BC4E98C1E3104C0016FD@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_05:2020-10-02,
 2020-10-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Jean-philippe
 ROMAIN <jean-philippe.romain@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] configs: stm32mp1: enable fastboot
 support of eMMC boot partition
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

On 9/9/20 3:24 PM, Patrick Delaunay wrote:
> From: Jean-Philippe ROMAIN <jean-philippe.romain@st.com>
>
> Activate fastboot support on boot partition for eMMC, mmc1 device
> on STMicroelectronics board (EV1).
>
> Signed-off-by: Jean-Philippe ROMAIN <jean-philippe.romain@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/stm32mp15_basic_defconfig   | 5 +++++
>  configs/stm32mp15_trusted_defconfig | 5 +++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index a8c4112dbe..fc3d2cc4fb 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -80,6 +80,11 @@ CONFIG_FASTBOOT_USB_DEV=1
>  CONFIG_FASTBOOT_FLASH=y
>  CONFIG_FASTBOOT_FLASH_MMC_DEV=1
>  CONFIG_GPIO_HOG=y
> +CONFIG_FASTBOOT_MMC_BOOT_SUPPORT=y
> +CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
> +CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
> +CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
> +CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
>  CONFIG_DM_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_STM32=y
>  CONFIG_DM_I2C=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 0792884a9d..bfe9e6b06c 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -60,6 +60,11 @@ CONFIG_FASTBOOT_USB_DEV=1
>  CONFIG_FASTBOOT_FLASH=y
>  CONFIG_FASTBOOT_FLASH_MMC_DEV=1
>  CONFIG_GPIO_HOG=y
> +CONFIG_FASTBOOT_MMC_BOOT_SUPPORT=y
> +CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
> +CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
> +CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
> +CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
>  CONFIG_DM_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_STM32=y
>  CONFIG_DM_I2C=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
