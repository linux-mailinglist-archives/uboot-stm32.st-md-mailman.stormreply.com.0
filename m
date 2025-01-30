Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46545A22D36
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2025 14:03:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04426C78F6D;
	Thu, 30 Jan 2025 13:03:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A926EC78F67
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2025 13:03:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UCewov032689;
 Thu, 30 Jan 2025 14:03:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 LcQfM/SZU3il/qmNdq9zJB0E45RV4L84jz3TNgpAPzk=; b=GX2LJbBPJpKlSviY
 2Uxc4w2K75kEzufdNe712PKY3zR/UtPxfK1GbM4SDbxRqkxWKT8PCNUPhsP3MHWy
 /d20x3gpOUM/XHoy99kCy2wSICJKPNTHHAQmMbV9SZSAWk3VWMyncUIveyEnIXWt
 v1KQTa8p0sGThpWeN4lscbrydAQoDCRPZKLU0JDBpPaKL82t5txTGIE/GgndmtAD
 VDgzbzeK83p9pIntXOzar8MkE1W7HeLPlLnDsoVP/4vyYpz3Vb4GGI7KdVOhr7kn
 RxGlILjh52O8kw/RrR3dApw4u2fcx290Xr/mmkKW3X3oPbQonbz1mY1wOwTEbWzm
 9afmlQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44ftteb147-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2025 14:03:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B65E44004F;
 Thu, 30 Jan 2025 14:02:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB2532AB039;
 Thu, 30 Jan 2025 13:56:29 +0100 (CET)
Received: from [10.48.87.126] (10.48.87.126) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 13:56:29 +0100
Message-ID: <ea8211e5-df92-4e84-9140-0c2294ade6b4@foss.st.com>
Date: Thu, 30 Jan 2025 13:56:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250123144718.1139824-1-patrice.chotard@foss.st.com>
 <20250123144718.1139824-3-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250123144718.1139824-3-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v4 2/9] configs: stih410-b2260: Enable
	DM_REGULATOR flag
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 1/23/25 15:47, Patrice Chotard wrote:
> Since commit 6aa8bde8786d ("usb: host: ehci-generic: Remove DM_REGULATOR
> flag") device_get_supply_regulator() returns -ENOSYS which is not handle
> by ehci_enable_vbus_supply() and thus, ehci_usb_probe() return an error.
>
> By enabling DM_REGULATOR flag, device_get_supply_regulator() return -ENOENT
> which is handle and ehci_usb_probe() return 0.
>
> This fixed the following issue:
> stih410-b2260 =>usb start
> starting USB...
> Bus dwc3@9900000: Register 2000240 NbrPorts 2
> Starting the controller
> USB XHCI 1.00
> Bus usb@9a03c00: USB OHCI 1.0
> Bus usb@9a03e00: probe failed, error -38
> Bus usb@9a83c00: USB OHCI 1.0
> Bus usb@9a83e00: probe failed, error -38
> scanning bus dwc3@9900000 for devices... 1 USB Device(s) found
> scanning bus usb@9a03c00 for devices... data abort
> pc : [<7df929b4>]          lr : [<7df92918>]
> reloc pc : [<7d6409b4>]    lr : [<7d640918>]
> sp : 7c73b848  ip : 9cf13c5c     fp : 7c879d08
> r10: 7c85d040  r9 : 7c74ded0     r8 : 09a03c00
> r7 : 00000002  r6 : 7c85d080     r5 : 7c86a040  r4 : 00000000
> r3 : 00000000  r2 : 00000000     r1 : 7c85d080  r0 : 7c85d040
> Flags: nzCv  IRQs off  FIQs off  Mode SVC_32
> Code: 05853ae4 0affffe2 e59a2010 e59a300c (e5832010)
> Resetting CPU ...
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
> ---
>
> (no changes since v1)
>
>   configs/stih410-b2260_defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/configs/stih410-b2260_defconfig b/configs/stih410-b2260_defconfig
> index 815f7557d69..e312ca492d2 100644
> --- a/configs/stih410-b2260_defconfig
> +++ b/configs/stih410-b2260_defconfig
> @@ -48,6 +48,7 @@ CONFIG_MMC_SDHCI_STI=y
>   CONFIG_PHY=y
>   CONFIG_STI_USB_PHY=y
>   CONFIG_PINCTRL=y
> +CONFIG_DM_REGULATOR=y
>   CONFIG_STI_RESET=y
>   CONFIG_STI_ASC_SERIAL=y
>   CONFIG_SYSRESET=y


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
