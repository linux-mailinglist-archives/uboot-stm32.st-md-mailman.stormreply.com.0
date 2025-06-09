Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D752AD1EA0
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 15:19:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EA58C32E8F;
	Mon,  9 Jun 2025 13:19:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0ABEAC349C5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 13:19:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BZ5Ir001336;
 Mon, 9 Jun 2025 15:18:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 4/lyrv9Zrw3feqjTrSbghBVx2y39sv1lxEH5IjJFuu0=; b=UikOSk9THZneJxCa
 hZAjhUrgPbpXjb9z2VkVJGnxRAI15ahlzIFKc93UwXLLlai5F3qIgWI56FD4W+yt
 xj0gLa8fq7srMCKR4FNl4YI7hXnOr70zUGMbYl+kZnvj00GqQ1H+bMmgEVeMzziH
 YMBxDbAzOIK3yK4OoH0wBNrzz9AI41Xp2AyjOVj8nV5746aWqr9ny5MvhZuqkd73
 6A3rCWgkVn1N4Gv1wNzS0uQixcCGU5VrxuvseLMQMUhWeRSJw/aOSblwAwhBMaeV
 FPDc0IGThsjbogXIcYrJm6XguA+DKEZTl2bC5CdmKrMKTGlsLvYVrDNS7FPNicMT
 5IPqNA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aj9yevw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 15:18:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3111840045;
 Mon,  9 Jun 2025 15:17:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7EEE0BACE22;
 Mon,  9 Jun 2025 15:15:15 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 15:15:14 +0200
Message-ID: <dc8bb4a3-c465-4ae0-a61d-bb2f74a42b64@foss.st.com>
Date: Mon, 9 Jun 2025 15:15:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 linux-amarula@amarulasolutions.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/9] Support stm32h747-discovery board
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



On 6/7/25 11:37, Dario Binacchi wrote:
> The series adds support for stm32h747-discovery board.
> 
> Detailed information can be found at:
> https://www.st.com/en/evaluation-tools/stm32h747i-disco.html
> 
> 
> Dario Binacchi (9):
>   ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandles
>   dt-bindings: arm: stm32: add compatible for stm32h747i-disco board
>   dt-bindings: clock: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
>   ARM: dts: stm32: add uart8 node for stm32h743 MCU
>   ARM: dts: stm32: add pin map for UART8 controller on stm32h743
>   ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
>   ARM: dts: stm32: support STM32h747i-disco board
>   ARM: dts: stm32: add stm32h747i-disco-u-boot DTS file
>   board: stm32: add stm32h747-discovery board support


Hi Dario

For the whole series
Applied to u-boot-stm32/next

Thanks
Patrice

> 
>  arch/arm/dts/stm32h747i-disco-u-boot.dtsi     | 104 ++++++++++++++
>  arch/arm/mach-stm32/stm32h7/Kconfig           |   4 +
>  board/st/stm32h747-disco/Kconfig              |  15 ++
>  board/st/stm32h747-disco/MAINTAINERS          |   7 +
>  board/st/stm32h747-disco/Makefile             |   6 +
>  board/st/stm32h747-disco/stm32h747-disco.c    |  42 ++++++
>  configs/stm32h747-disco_defconfig             |  35 +++++
>  drivers/clk/stm32/clk-stm32h7.c               |   5 +
>  dts/upstream/Bindings/arm/stm32/stm32.yaml    |   4 +
>  .../include/dt-bindings/clock/stm32h7-clks.h  |   4 +-
>  dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi  |  34 ++++-
>  dts/upstream/src/arm/st/stm32h743.dtsi        |   8 ++
>  dts/upstream/src/arm/st/stm32h743i-disco.dts  |   2 +-
>  dts/upstream/src/arm/st/stm32h743i-eval.dts   |   2 +-
>  dts/upstream/src/arm/st/stm32h747i-disco.dts  | 136 ++++++++++++++++++
>  dts/upstream/src/arm/st/stm32h750i-art-pi.dts |   6 +-
>  include/configs/stm32h747-disco.h             |  32 +++++
>  17 files changed, 435 insertions(+), 11 deletions(-)
>  create mode 100644 arch/arm/dts/stm32h747i-disco-u-boot.dtsi
>  create mode 100644 board/st/stm32h747-disco/Kconfig
>  create mode 100644 board/st/stm32h747-disco/MAINTAINERS
>  create mode 100644 board/st/stm32h747-disco/Makefile
>  create mode 100644 board/st/stm32h747-disco/stm32h747-disco.c
>  create mode 100644 configs/stm32h747-disco_defconfig
>  create mode 100644 dts/upstream/src/arm/st/stm32h747i-disco.dts
>  create mode 100644 include/configs/stm32h747-disco.h
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
