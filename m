Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D09FB1A7B55
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 14:52:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84BE2C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 12:52:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF665C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 12:52:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EClC7o015156; Tue, 14 Apr 2020 14:52:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=wSDUbANdF8aSLsVoQx995xraIaKH9QPwbb29hVGlJ3w=;
 b=O3SR6YlZKpwznKTtozKpjgnjkq1ze1I62MPQsPptgcbnYm2G0Pf2/ZprzYIglhH01WgW
 4GoDK6p6PvhRu3NJliznMzKNxINmnx0XWTKlfQrqUQbdS4EixSOBwVy5ChJ6tfmHcpgs
 8CA7Rww4VzVzFVAsP0VZi8B4GKrf5JO3ouRCgC9TWWZl0N4aTJPWz87EbQ3sfaWo+iHB
 AkgdC+2L97UJuMjawReQWO7GxMUNT5mURlswJdrQyI29ZAJsJGJlmk0K5XayYRzhGfGV
 MZI/lJtPGxHdg/Ar+KUdBGGqhNyTIByuzGCy3rRLIZHUEMnjb59Gpevxu6wHucTR02VG 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5stdr4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 14:52:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8FB4110003D;
 Tue, 14 Apr 2020 14:52:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6180B2B5C27;
 Tue, 14 Apr 2020 14:52:38 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 14:52:38 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 14:52:38 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] ARM: stm32: Enable bootd, iminfo, imxtract on ST
 defconfig
Thread-Index: AQHWD1L0RrTRqZDrdE2tpik2zBDmOKh4dviA
Date: Tue, 14 Apr 2020 12:52:38 +0000
Message-ID: <701f7585-fa1c-3200-c5fd-aae30b0ef5ef@st.com>
References: <20200410181315.1.Icdfee0d20622a819ea009800c0bc4164107e0084@changeid>
In-Reply-To: <20200410181315.1.Icdfee0d20622a819ea009800c0bc4164107e0084@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <A090DFE34F066042A740049F7E4EE20F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Enable bootd, iminfo,
 imxtract on ST defconfig
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

Hi

On 4/10/20 6:13 PM, Patrick Delaunay wrote:
> Enable these standard U-Boot commands for image manipulation and for
> starting the default boot command using 'boot' command in U-Boot shell.
>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/stm32mp15_basic_defconfig   | 3 ---
>  configs/stm32mp15_trusted_defconfig | 3 ---
>  2 files changed, 6 deletions(-)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 6d82365348..c8f1780cab 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -21,10 +21,7 @@ CONFIG_SPL_MTD_SUPPORT=y
>  CONFIG_SPL_POWER_SUPPORT=y
>  CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
>  CONFIG_SYS_PROMPT="STM32MP> "
> -# CONFIG_CMD_BOOTD is not set
>  # CONFIG_CMD_ELF is not set
> -# CONFIG_CMD_IMI is not set
> -# CONFIG_CMD_XIMG is not set
>  # CONFIG_CMD_EXPORTENV is not set
>  # CONFIG_CMD_IMPORTENV is not set
>  CONFIG_CMD_MEMINFO=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 6928e9a65c..82a8b709cd 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -9,10 +9,7 @@ CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_FIT=y
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>  CONFIG_SYS_PROMPT="STM32MP> "
> -# CONFIG_CMD_BOOTD is not set
>  # CONFIG_CMD_ELF is not set
> -# CONFIG_CMD_IMI is not set
> -# CONFIG_CMD_XIMG is not set
>  # CONFIG_CMD_EXPORTENV is not set
>  # CONFIG_CMD_IMPORTENV is not set
>  CONFIG_CMD_MEMINFO=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
