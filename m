Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0129124509
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 11:49:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F069C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 10:49:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D4ECC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 10:49:46 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBIAgIbR004163; Wed, 18 Dec 2019 11:49:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pFkSG6y2sBC979GAwkorvWf2GoFVX3w+1THfKgLogSs=;
 b=yycVZHCnWZrmQpi6vFjpIiQclO6ZO719zM7f9W1iSAfBiZeSyzTn3wTJLGlkPdUSLpVZ
 s86LJpe7gB1ayWzWChEPS1Gh2jehAUhZe6h6SYtjGi7YGRRTHbNDQValHZsO9PB8Wl0E
 b/pmg9fz30jqw2wlpA3POsNTRiFuSMbw2skBnTaHaon/imP8HKTCeveuDUZ7+OsvaWBN
 Ro2BS9GZlsWhR7FIYGvcq7kxrwMGN1BDjVn3y6vuWZC3r5wUGzpBRw2inwEsm4zje/UT
 k+lxlIv6heGnfKFCFYXfGFPrm2erD8J5UIqwfC+3FujJn6fmDZbqb3waPcjC1Cft/zNS fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wvpd1kvjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 11:49:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C458100039;
 Wed, 18 Dec 2019 11:49:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 11A0B2A8BE1;
 Wed, 18 Dec 2019 11:49:39 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Dec
 2019 11:49:38 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Dec 2019 11:49:38 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp1: imply CMD_CLS
Thread-Index: AQHVqbUdDiJgju6lhU6xAbAS5b2Bcqe/zc1A
Date: Wed, 18 Dec 2019 10:49:38 +0000
Message-ID: <3105c56ac7b944598356ff0201fdfa57@SFHDAG6NODE3.st.com>
References: <20191203083858.7090-1-patrick.delaunay@st.com>
In-Reply-To: <20191203083858.7090-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_02:2019-12-17,2019-12-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: imply CMD_CLS
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
> Sent: mardi 3 d=E9cembre 2019 09:39
> To: u-boot@lists.denx.de
> Cc: Patrick DELAUNAY <patrick.delaunay@st.com>; Patrice CHOTARD
> <patrice.chotard@st.com>; U-Boot STM32 <uboot-stm32@st-md-
> mailman.stormreply.com>
> Subject: [PATCH] stm32mp1: imply CMD_CLS
> Importance: High
> =

> Activate by default the command CLS (clear screen); this command used in =
pxe
> or sysboot command (DISTRO support) when the "menu background" keyword is
> present.
> =

> This patch avoid the warning "Unknown command 'cls'"
> with extlinux.conf:
> =

> # Generic Distro Configuration file generated by OpenEmbedded menu title =
Select
> the boot mode MENU BACKGROUND /splash.bmp TIMEOUT 20 DEFAULT
> stm32mp157c-ev1-emmc LABEL stm32mp157c-ev1-emmc
> 	KERNEL /uImage
> 	FDT /stm32mp157c-ev1.dtb
> 	APPEND root=3D/dev/mmcblk1p4 rootwait rw console=3DttySTM0,115200
> =

> =

>   ...
>   Retrieving file: /mmc0_stm32mp157c-ev1_extlinux/extlinux.conf
>   614 bytes read in 36 ms (16.6 KiB/s)
>   Retrieving file: /splash.bmp
>   46180 bytes read in 40 ms (1.1 MiB/s)
>   Unknown command 'cls' - try 'help'
>   Select the boot mode
>   1:	stm32mp157c-ev1-sdcard
>   ...
> =

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>


Acked-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot-stm32/master, thanks!

> ---
> =

>  arch/arm/mach-stm32mp/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index c9bc084194..e920b89ef5 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -49,6 +49,7 @@ config TARGET_STM32MP1
>  	imply BOOTSTAGE
>  	imply CMD_BOOTCOUNT
>  	imply CMD_BOOTSTAGE
> +	imply CMD_CLS if CMD_BMP
>  	imply DISABLE_CONSOLE
>  	imply PRE_CONSOLE_BUFFER
>  	imply SILENT_CONSOLE
> --
> 2.17.1

BR
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
