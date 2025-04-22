Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC33A9609E
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 10:10:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 156E8C78F68;
	Tue, 22 Apr 2025 08:10:59 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 829E1C78F62
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 08:10:57 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7ffIA015946;
 Tue, 22 Apr 2025 10:10:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 4cIH3ywVNfOEGo2LTE3uClAl6vg/EQe0EZCJnYTsfyU=; b=31IEV5ObXWjt4dvc
 zUDZvwRq4c6isThujduGt93Fxo1fM0Y8BKuZ9syCjr7g4OD6wbUN56SPhjik8Mtl
 hn8AWEp397FYllMj+LLlC+aU/sPZkQxPws/IRUNEnVnnlpzMWS1Kvva/zNtNXfbk
 mkNe8YGrDZ0Z0kJEa7LkHXYqzk5U+pLi/CD3DmL9+S097j0AmitvczjLRv/K8C2E
 ttLzA70VSadDqtfE186TK1Pm44DVGOj4EhAuONYCvdl6BSrCDP/Ynwzags1j2M97
 XKOdjz5mMcrqI6ZMn4mmPYXsl1zd6OsP+0Grdoel0Di7ho2xechlNlVAnm1tsrqe
 mSfjAg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 464psp6kd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 10:10:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E2A9440046;
 Tue, 22 Apr 2025 10:08:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 91FD99C84A5;
 Tue, 22 Apr 2025 10:07:45 +0200 (CEST)
Received: from [10.48.87.126] (10.48.87.126) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 10:07:44 +0200
Message-ID: <ea27a334-3e85-4f4c-ad16-e0cf38a2ba70@foss.st.com>
Date: Tue, 22 Apr 2025 10:07:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
 <20250401131413.387139-5-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250401131413.387139-5-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Fabio Estevam <festevam@denx.de>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sumit Garg <sumit.garg@kernel.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Prasad Kummari <prasad.kummari@amd.com>, Adam Ford <aford173@gmail.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 04/13] ARM: dts: stm32: convert stm23f4
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
> Enable OF_UPSTREAM flag for STM32MPF4 platforms.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/Makefile                  |   4 -
>   arch/arm/dts/stm32429i-eval.dts        | 284 ---------
>   arch/arm/dts/stm32f4-pinctrl.dtsi      | 447 ---------------
>   arch/arm/dts/stm32f429-disco.dts       | 190 -------
>   arch/arm/dts/stm32f429-pinctrl.dtsi    |  55 --
>   arch/arm/dts/stm32f429.dtsi            | 758 -------------------------
>   arch/arm/dts/stm32f469-disco.dts       | 213 -------
>   arch/arm/dts/stm32f469-pinctrl.dtsi    |  55 --
>   arch/arm/dts/stm32f469.dtsi            |  18 -
>   arch/arm/mach-stm32/Kconfig            |   1 +
>   configs/stm32f429-discovery_defconfig  |   2 +-
>   configs/stm32f429-evaluation_defconfig |   2 +-
>   configs/stm32f469-discovery_defconfig  |   2 +-
>   13 files changed, 4 insertions(+), 2027 deletions(-)
>   delete mode 100644 arch/arm/dts/stm32429i-eval.dts
>   delete mode 100644 arch/arm/dts/stm32f4-pinctrl.dtsi
>   delete mode 100644 arch/arm/dts/stm32f429-disco.dts
>   delete mode 100644 arch/arm/dts/stm32f429-pinctrl.dtsi
>   delete mode 100644 arch/arm/dts/stm32f429.dtsi
>   delete mode 100644 arch/arm/dts/stm32f469-disco.dts
>   delete mode 100644 arch/arm/dts/stm32f469-pinctrl.dtsi
>   delete mode 100644 arch/arm/dts/stm32f469.dtsi
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
