Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0654FA9609F
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 10:11:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A8BCC78F68;
	Tue, 22 Apr 2025 08:11:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6D32C78F62
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 08:11:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7gssm028458;
 Tue, 22 Apr 2025 10:09:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 6Xa29XxqCzGoXKx6EmLDgCT4EFUQ4Fv4LmwS8hl4dDM=; b=Ddy6+ZedH65lU+r5
 Jcg+wokZIq+brOKJ3IJOXrwVZMGOgIIcsBIQ62afgi1tiLqMJ5IDnBlNBO8gjwAu
 0MevT9p0FuU2n3794ehmQJszLCyZEU7jaoZrWTeHnhR0J+yqzuzE5A8FGABdrnZg
 JACta7OeneYK29wxMuk/9VveSpxTIL1MTZP3F+WDwKlOSi+qJRLMPFCe4b1aK/Ci
 pVp7pDd7eJKRwLWF+xeeNVbeh2KnVq+up2FOCV/QrocvBvBvjyfATLnw24C1gzSd
 nN4fUf7mzDZX1lcTNZn6DEcbO3kz639LvdR5D53wf2rSmlUDyOuaSvuGnqQQ1Tcd
 hjstyg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4640y80y95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 10:09:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CFC1540048;
 Tue, 22 Apr 2025 10:07:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22F629C848C;
 Tue, 22 Apr 2025 10:06:28 +0200 (CEST)
Received: from [10.48.87.126] (10.48.87.126) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 10:06:27 +0200
Message-ID: <90ffbe15-8b0f-44ec-9d19-08e660b8e8e8@foss.st.com>
Date: Tue, 22 Apr 2025 10:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
 <20250401131413.387139-4-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250401131413.387139-4-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Fabio Estevam <festevam@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Prasad Kummari <prasad.kummari@amd.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 03/13] ARM: dts: stm32: convert stm23f7
 boards to OF_UPSTREAM
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
> Enable OF_UPSTREAM flag for STM32F7 platforms.
>
> Use upstream device tree for DSI and LTDC nodes,
> As now in upstream DT, in panel@0 node, power-supply property is
> present, which is a fixed-regulator, add DM_REGULATOR_FIXED flag
> for stm32f769-disco boards.
>
> Set also DEFAULT_FDT_FILE in defconfigs and use it in stm32f746-disco.h
> to indicate which FDT file to load (All STM32F7 boards are using this
> file).
>
> If something is missing, it must be added in upstream device tree
> in linux kernel ("px_clk" for DSI by example).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/Makefile                    |   4 -
>   arch/arm/dts/stm32746g-eval.dts          | 186 -------
>   arch/arm/dts/stm32f7-pinctrl.dtsi        | 415 ---------------
>   arch/arm/dts/stm32f746-disco-u-boot.dtsi |  13 +-
>   arch/arm/dts/stm32f746-disco.dts         | 169 -------
>   arch/arm/dts/stm32f746-pinctrl.dtsi      |  11 -
>   arch/arm/dts/stm32f746.dtsi              | 613 -----------------------
>   arch/arm/dts/stm32f769-disco-u-boot.dtsi |  60 +--
>   arch/arm/dts/stm32f769-disco.dts         | 133 -----
>   arch/arm/dts/stm32f769-pinctrl.dtsi      |  11 -
>   arch/arm/mach-stm32/Kconfig              |   1 +
>   configs/stm32746g-eval_defconfig         |   3 +-
>   configs/stm32746g-eval_spl_defconfig     |   3 +-
>   configs/stm32f746-disco_defconfig        |   3 +-
>   configs/stm32f746-disco_spl_defconfig    |   3 +-
>   configs/stm32f769-disco_defconfig        |   4 +-
>   configs/stm32f769-disco_spl_defconfig    |   4 +-
>   include/configs/stm32f746-disco.h        |   2 +-
>   18 files changed, 34 insertions(+), 1604 deletions(-)
>   delete mode 100644 arch/arm/dts/stm32746g-eval.dts
>   delete mode 100644 arch/arm/dts/stm32f7-pinctrl.dtsi
>   delete mode 100644 arch/arm/dts/stm32f746-disco.dts
>   delete mode 100644 arch/arm/dts/stm32f746-pinctrl.dtsi
>   delete mode 100644 arch/arm/dts/stm32f746.dtsi
>   delete mode 100644 arch/arm/dts/stm32f769-disco.dts
>   delete mode 100644 arch/arm/dts/stm32f769-pinctrl.dtsi
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
