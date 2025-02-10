Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F7CA2E985
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2025 11:34:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1383DC78F88;
	Mon, 10 Feb 2025 10:34:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30C41C78F85
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 10:34:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9emKK017990;
 Mon, 10 Feb 2025 11:34:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 rAlBh73Q1zCk+1/EHihPxTi73MDxbZASqny5hBcrKbw=; b=bMI9AhJb34nZHrST
 bEbCSr2sDC49uyCsDYmd3EfokdulTGfj58IRsIH4IbdLoeDnFqPnH9Jxp6nanj70
 +H8HuXCykMajWMwQIE5dRcRKCREgamEJc7NN5dNdeA5psAQPoumGdLFWGyzXK/tn
 AN+u3AhIxJLBrLpBZ1WcUZFoHogpHRvLg3hV9JcTTlOznbynTThzgR01s6dLKDMx
 mem7JkCAGnNK6j8CSy1VZnDnqt4KkOX9mbjq1YFzRqOJEzJb/DXMSwlTjh23W6ax
 yxm0k1oWItSfsUlGcpZEKd4XdF/mrA5RCr3p5QgpwRl5hXwTNvPjTo3nZCJWjWHb
 LRYEyw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0qrwuv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2025 11:33:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F07BE40069;
 Mon, 10 Feb 2025 11:32:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AC5D2D2D51;
 Mon, 10 Feb 2025 11:28:53 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 11:28:52 +0100
Message-ID: <4492fe8a-1b60-44da-93b7-383eae3fa269@foss.st.com>
Date: Mon, 10 Feb 2025 11:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>
References: <20250130163547.512990-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250130163547.512990-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sjoerd Simons <sjoerd@collabora.com>, Mathieu Othacehe <othacehe@gnu.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sam Protsenko <semen.protsenko@linaro.org>, Simon Glass <sjg@chromium.org>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [Uboot-stm32] [PATCH v5 0/9] Restore USB and add UMS support
	for STiH407-B2260
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


Hi Marek

Any chance to get this series merged in next U-Boot tag 2025.04-rc2 ?

Thanks
Patrice

On 1/30/25 17:35, Patrice Chotard wrote:
> 
> This series is :
>  _ restoring USB on STiH410-B2260 which hasn't been
>    tested since a while.
>  _ migrating STi DWC3 glue from proprietary driver to
>    dwc3-generic driver.
>  _ adding UMS support for STiH410-B2260.
> 
> 
> Changes in v5:
>   - move this patch from 6/9 to 3/9 position to avoid to have
>     2 drivers with identical compatible string simultaneously.
>   - update commit description accordingly
>   - reorder files entry for ARM STI in MAINTAINERS file
>   - add #define LOG_CATEGORY UCLASS_NOP
>   - use UCLASS_NOP instead of UCLASS_SIMPLE_BUS
> 
> Changes in v4:
>   - Update Kconfig description
> 
> Changes in v3:
>   - add RB Mattijs Korpershoek
>   - Update comment by adding "Remove useless include files"
>   - Replace debug() by dev_err()
>   - check return value of syscon_regmap_lookup_by_phandle()
>   - add RB Mattijs Korpershoek
> 
> Changes in v2:
>   - remove useless include files
>   - add dwc3-sti.c DWC3 wrapper as done for dwc3-am62.c
> 
> Patrice Chotard (9):
>   ARM: dts: sti: Add fixed clock for ehci and ohci nodes in
>     stih410-b2260.dtsi
>   configs: stih410-b2260: Enable DM_REGULATOR flag
>   usb: dwc3: Remove dwc3 glue driver support for STi
>   usb: dwc3-generic: Reorder include
>   usb: dwc3-generic: Add STih407 support
>   configs: stih410-b2260: Enable USB_DWC3_GENERIC and USB_DWC3_STI flags
>   configs: stih410-b2260: Enable DM_USB_GADGET flag
>   board: stih410-b2260: Remove board_usb_init/cleanup()
>   configs: stih410-b2260: Enable CMD_USB_MASS_STORAGE flag
> 
>  MAINTAINERS                            |   3 +-
>  arch/arm/dts/stih410-b2260-u-boot.dtsi |  10 +
>  board/st/stih410-b2260/board.c         |  30 ---
>  configs/stih410-b2260_defconfig        |   5 +
>  drivers/usb/dwc3/Kconfig               |   8 +
>  drivers/usb/dwc3/Makefile              |   1 +
>  drivers/usb/dwc3/dwc3-generic-sti.c    | 134 +++++++++++++
>  drivers/usb/dwc3/dwc3-generic.c        |  20 +-
>  drivers/usb/host/Kconfig               |   9 -
>  drivers/usb/host/Makefile              |   1 -
>  drivers/usb/host/dwc3-sti-glue.c       | 253 -------------------------
>  include/dwc3-sti-glue.h                |  41 ----
>  12 files changed, 163 insertions(+), 352 deletions(-)
>  create mode 100644 drivers/usb/dwc3/dwc3-generic-sti.c
>  delete mode 100644 drivers/usb/host/dwc3-sti-glue.c
>  delete mode 100644 include/dwc3-sti-glue.h
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
