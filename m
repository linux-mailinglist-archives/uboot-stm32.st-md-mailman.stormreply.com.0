Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2482A12452D
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 11:57:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E68F5C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 10:57:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEEEAC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 10:57:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBIAi6f9022003; Wed, 18 Dec 2019 11:57:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Xvste3Kg9O70KDNAU5PyFGfNXCt+GCwROmfnqLbgGsg=;
 b=v9tr2uT1s018fKCnr/gB8QtemMN12QzzPTg/o6N35JDrQk8nugRZFRpEzTEIfvZcuP1k
 2rNAna4fZ9+pE0oYP1w+xqyYjCvzyT3gGGUUoNvnmLVy7/rYdHTOwOmRFAH9CCKboIzv
 BXBPnTKstJ5jXsiNhLWrPWfVhI4viGvb1woxDzquvXIhgWs6YtsVLrDD5SPYhsDbtXQl
 FwIanmh9yVWQnpyYQBBh6x++DLKA/lasFfAJaASBbQEorTZqsJ4j8tyDWrQbrX9kH/8G
 NSb6N15t/ZnV77OdqnkoqtJzp4nzy0WzCEvzhkQ0qozZIAu44ZjkugYSiMWAAyeNfUey Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wvqgpuppc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 11:57:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C4533100042;
 Wed, 18 Dec 2019 11:57:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9ABCD2A8C07;
 Wed, 18 Dec 2019 11:57:25 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Dec
 2019 11:57:25 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Dec 2019 11:57:25 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] stm32mp1: configs: Resync with savedefconfig
Thread-Index: AQHVtYNZz5C1zQIAqUWRxg1AHANItae/uK/A
Date: Wed, 18 Dec 2019 10:57:25 +0000
Message-ID: <c8fc2f24b13245efbf088bb10523fd06@SFHDAG6NODE3.st.com>
References: <20191218091259.6748-1-patrick.delaunay@st.com>
 <20191218091259.6748-2-patrick.delaunay@st.com>
In-Reply-To: <20191218091259.6748-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_02:2019-12-17,2019-12-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] stm32mp1: configs: Resync with
	savedefconfig
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: mercredi 18 d=E9cembre 2019 10:13
> =

> Rsync all defconfig files using moveconfig.py
> =

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Acked-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot-stm32/master, thanks!

> ---
> =

>  configs/stm32mp15_basic_defconfig   | 2 +-
>  configs/stm32mp15_optee_defconfig   | 2 +-
>  configs/stm32mp15_trusted_defconfig | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/configs/stm32mp15_basic_defconfig
> b/configs/stm32mp15_basic_defconfig
> index 358c2cd079..713a7e6c57 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -132,10 +132,10 @@ CONFIG_USB_GADGET_VENDOR_NUM=3D0x0483
>  CONFIG_USB_GADGET_PRODUCT_NUM=3D0x5720
>  CONFIG_USB_GADGET_DWC2_OTG=3Dy
>  CONFIG_DM_VIDEO=3Dy
> +CONFIG_BACKLIGHT_GPIO=3Dy
>  CONFIG_VIDEO_BPP8=3Dy
>  CONFIG_VIDEO_BPP16=3Dy
>  CONFIG_VIDEO_BPP32=3Dy
> -CONFIG_BACKLIGHT_GPIO=3Dy
>  CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=3Dy
>  CONFIG_VIDEO_LCD_RAYDIUM_RM68200=3Dy
>  CONFIG_VIDEO_STM32=3Dy
> diff --git a/configs/stm32mp15_optee_defconfig
> b/configs/stm32mp15_optee_defconfig
> index a065d3e088..f9161fd7d1 100644
> --- a/configs/stm32mp15_optee_defconfig
> +++ b/configs/stm32mp15_optee_defconfig
> @@ -116,10 +116,10 @@ CONFIG_USB_GADGET_VENDOR_NUM=3D0x0483
>  CONFIG_USB_GADGET_PRODUCT_NUM=3D0x5720
>  CONFIG_USB_GADGET_DWC2_OTG=3Dy
>  CONFIG_DM_VIDEO=3Dy
> +CONFIG_BACKLIGHT_GPIO=3Dy
>  CONFIG_VIDEO_BPP8=3Dy
>  CONFIG_VIDEO_BPP16=3Dy
>  CONFIG_VIDEO_BPP32=3Dy
> -CONFIG_BACKLIGHT_GPIO=3Dy
>  CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=3Dy
>  CONFIG_VIDEO_LCD_RAYDIUM_RM68200=3Dy
>  CONFIG_VIDEO_STM32=3Dy
> diff --git a/configs/stm32mp15_trusted_defconfig
> b/configs/stm32mp15_trusted_defconfig
> index 632f11f59b..a5ea528ae3 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -115,10 +115,10 @@ CONFIG_USB_GADGET_VENDOR_NUM=3D0x0483
>  CONFIG_USB_GADGET_PRODUCT_NUM=3D0x5720
>  CONFIG_USB_GADGET_DWC2_OTG=3Dy
>  CONFIG_DM_VIDEO=3Dy
> +CONFIG_BACKLIGHT_GPIO=3Dy
>  CONFIG_VIDEO_BPP8=3Dy
>  CONFIG_VIDEO_BPP16=3Dy
>  CONFIG_VIDEO_BPP32=3Dy
> -CONFIG_BACKLIGHT_GPIO=3Dy
>  CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=3Dy
>  CONFIG_VIDEO_LCD_RAYDIUM_RM68200=3Dy
>  CONFIG_VIDEO_STM32=3Dy
> --
> 2.17.1

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
