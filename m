Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCD2211D2A
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:40:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15922C36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:40:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E99A0C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:40:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627X1Rr007296; Thu, 2 Jul 2020 09:40:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=2RMHiQU7uQDGxP8Onfs31kbm9ibb0WC4Louy3J3k6Ts=;
 b=jlRghCZzR2Uq99llxrFha/FLQ7gLordOaHjQ7A3IZU4EFmDBWGRX9D9QynSPaXLrxEdD
 SOxNeTJT071ZMTacyNqM7LiOdM6c9bHcwJZEp8k/EWg8FkiYtgO9VuLW3YZtA7aUM8N3
 6bTI7IDJlrhxMOFHxd3SJDH+UcJ3d873TO99g2B7mTGjphsC5RxAxk9qfPCQyQ6Lhqx5
 gmXT6VIUMbi4YnbDWTKb2Z7TYdFdgWQBF0XlzXSzIsJoyP82P5xVwTXvSyQ9ol6HnuiW
 CqMmtPGQjRTi/zgpxKjtaAmO8zOduH85nJZ0NdvLSb0l2WyuVhoTPe3gEfCjnl/zdLgh 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0gejjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:40:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E63FC10002A;
 Thu,  2 Jul 2020 09:40:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCD2121E694;
 Thu,  2 Jul 2020 09:40:04 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 09:40:04 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:40:04 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] configs: stm32mp1: activate WATCHDOG
Thread-Index: AQHWP//L6lgY3+Y1Ok2F24vYcJIqt6jz5neA
Date: Thu, 2 Jul 2020 07:40:04 +0000
Message-ID: <b86226a1-56a1-eee0-0f46-8b87f984a54b@st.com>
References: <20200611145117.2936-1-patrick.delaunay@st.com>
In-Reply-To: <20200611145117.2936-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <2283EC72F3E41D4F8F6ADD37D44B6642@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp1: activate WATCHDOG
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

On 6/11/20 4:51 PM, Patrick Delaunay wrote:
> As kernel v5.6 have a solution since so we will be able to enable
> the watchdog at boot time. It is reloaded by the watchdog
> framework (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set) and
> until the userspace watchdog daemon takes over control.
>
> Need presence of kernel patch 85fdc63fe256 ("drivers: watchdog:
> stm32_iwdg: set WDOG_HW_RUNNING at probe") integrated in v5.6-rc1.
>
> This patch revert the previous commit ca351e705a5c ("stm32mp1:
> deactivate WATCHDOG in defconfig").
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/stm32mp15_basic_defconfig   | 2 ++
>  configs/stm32mp15_trusted_defconfig | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index c7dd2926c9..a3b6c381d2 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -140,5 +140,7 @@ CONFIG_VIDEO_STM32=y
>  CONFIG_VIDEO_STM32_DSI=y
>  CONFIG_VIDEO_STM32_MAX_XRES=1280
>  CONFIG_VIDEO_STM32_MAX_YRES=800
> +CONFIG_WDT=y
> +CONFIG_WDT_STM32MP=y
>  CONFIG_ERRNO_STR=y
>  CONFIG_FDT_FIXUP_PARTITIONS=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index ca4a10813b..cf5ad916e7 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -127,5 +127,7 @@ CONFIG_VIDEO_STM32=y
>  CONFIG_VIDEO_STM32_DSI=y
>  CONFIG_VIDEO_STM32_MAX_XRES=1280
>  CONFIG_VIDEO_STM32_MAX_YRES=800
> +CONFIG_WDT=y
> +CONFIG_WDT_STM32MP=y
>  CONFIG_ERRNO_STR=y
>  CONFIG_FDT_FIXUP_PARTITIONS=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
