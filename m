Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E2FA960B8
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 10:15:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73952C78F6F;
	Tue, 22 Apr 2025 08:15:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35457C78F68
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 08:15:01 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7dHpt023461;
 Tue, 22 Apr 2025 10:14:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 goslFgMyvc+8XvvFZrvBoMvd4NKi+4wPNSO14JnBtOA=; b=pFbehH5sRTUaTMz2
 2uQmpStOkbz+pDoPxfAK47hPCrFes6gwIsVpaZNbN3tN5DhfeLKqA0wihRPH00MJ
 kyfq/gkayCW6R/GO8bpbJvRk1UFLknExS4021tmJ/smGx/t5aEY/eNR7KFFXCMc4
 2gDUOF5ckoB3OZvtfpB+qU33m9FUI6FjorupxNKiJbdeQarDY4fTXkoQa73hUE4b
 E/rLPStF1L90w0J5IEvuwEgtAFRMLGYJ2JFzBeUU9zcS1QdS9v6PiK45DFFs28l4
 zifsHV51aM55NSMBJ7mgTT/l97UEIG4660LNbOR8hK95IHoc7UsIsVmbB6sqK2b3
 tzS6eg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 464nd3xx1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 10:14:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CC8FA4005E;
 Tue, 22 Apr 2025 10:12:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 619119C523B;
 Tue, 22 Apr 2025 10:10:07 +0200 (CEST)
Received: from [10.48.87.126] (10.48.87.126) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 10:10:06 +0200
Message-ID: <aa29e8d4-3492-40d7-a5dd-9f569151dd76@foss.st.com>
Date: Tue, 22 Apr 2025 10:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
 <20250401131413.387139-7-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250401131413.387139-7-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Fabio Estevam <festevam@denx.de>, Matteo Lisi <matteo.lisi@engicam.com>,
 Jonas Karlman <jonas@kwiboo.se>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Tom Rini <trini@konsulko.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Lionel Debieve <lionel.debieve@foss.st.com>,
 Adam Ford <aford173@gmail.com>, Prasad Kummari <prasad.kummari@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 06/13] ARM: dts: stm32: convert stm32mp15
 board to OF_UPSTREAM
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

On 4/1/25 15:14, Patrice Chotard wrote:
> Enable OF_UPSTREAM flag for STM32MP15 platforms, except for
> stm32mp15-odyssey,see following patch :
>
> "configs: stm32: introduce stm32mp15-odyssey_defconfig"
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/Makefile                         |   12 -
>   arch/arm/dts/stm32mp15-pinctrl.dtsi           | 2826 -----------------
>   arch/arm/dts/stm32mp15-scmi.dtsi              |   88 -
>   arch/arm/dts/stm32mp151.dtsi                  | 1868 -----------
>   arch/arm/dts/stm32mp153.dtsi                  |   59 -
>   arch/arm/dts/stm32mp157.dtsi                  |   48 -
>   arch/arm/dts/stm32mp157a-dk1-scmi.dts         |   82 -
>   arch/arm/dts/stm32mp157a-dk1.dts              |   25 -
>   .../stm32mp157a-icore-stm32mp1-ctouch2.dts    |   49 -
>   ...157a-microgea-stm32mp1-microdev2.0-of7.dts |  161 -
>   ...32mp157a-microgea-stm32mp1-microdev2.0.dts |   59 -
>   .../dts/stm32mp157a-microgea-stm32mp1.dtsi    |  148 -
>   arch/arm/dts/stm32mp157c-dk2-scmi.dts         |   88 -
>   arch/arm/dts/stm32mp157c-dk2.dts              |   94 -
>   arch/arm/dts/stm32mp157c-ed1-scmi.dts         |   87 -
>   arch/arm/dts/stm32mp157c-ed1.dts              |  403 ---
>   arch/arm/dts/stm32mp157c-ev1-scmi.dts         |   93 -
>   arch/arm/dts/stm32mp157c-ev1.dts              |  414 ---
>   arch/arm/dts/stm32mp15xc.dtsi                 |   18 -
>   arch/arm/dts/stm32mp15xx-dkx.dtsi             |  741 -----
>   arch/arm/dts/stm32mp15xxaa-pinctrl.dtsi       |   85 -
>   arch/arm/dts/stm32mp15xxab-pinctrl.dtsi       |   57 -
>   arch/arm/dts/stm32mp15xxac-pinctrl.dtsi       |   73 -
>   arch/arm/dts/stm32mp15xxad-pinctrl.dtsi       |   57 -
>   arch/arm/mach-stm32mp/Kconfig                 |    1 +
>   ...stm32mp15-icore-stm32mp1-ctouch2_defconfig |    2 +-
>   ...tm32mp15-icore-stm32mp1-edimm2.2_defconfig |    2 +-
>   ...-microgea-stm32mp1-microdev2-of7_defconfig |    2 +-
>   ...mp15-microgea-stm32mp1-microdev2_defconfig |    2 +-
>   configs/stm32mp15_basic_defconfig             |    4 +-
>   configs/stm32mp15_defconfig                   |    4 +-
>   configs/stm32mp15_trusted_defconfig           |    4 +-
>   32 files changed, 14 insertions(+), 7642 deletions(-)
>   delete mode 100644 arch/arm/dts/stm32mp15-pinctrl.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15-scmi.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp151.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp153.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp157.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp157a-dk1-scmi.dts
>   delete mode 100644 arch/arm/dts/stm32mp157a-dk1.dts
>   delete mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
>   delete mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
>   delete mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
>   delete mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp157c-dk2-scmi.dts
>   delete mode 100644 arch/arm/dts/stm32mp157c-dk2.dts
>   delete mode 100644 arch/arm/dts/stm32mp157c-ed1-scmi.dts
>   delete mode 100644 arch/arm/dts/stm32mp157c-ed1.dts
>   delete mode 100644 arch/arm/dts/stm32mp157c-ev1-scmi.dts
>   delete mode 100644 arch/arm/dts/stm32mp157c-ev1.dts
>   delete mode 100644 arch/arm/dts/stm32mp15xc.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dkx.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15xxaa-pinctrl.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15xxab-pinctrl.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15xxac-pinctrl.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15xxad-pinctrl.dtsi
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
