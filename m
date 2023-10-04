Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 863127B7CA4
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Oct 2023 11:55:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30D5AC6B45E;
	Wed,  4 Oct 2023 09:55:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46BD9C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 09:55:44 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39450H3o026784; Wed, 4 Oct 2023 11:55:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=rf76t6ChcusOmshBrH/jwUhR2UF8R8ZSIAcvNBgOzk8=; b=OX
 qZx9KKbE6YzTtcG6amu3RxOrXLsC9/9feZjEZuYeHTtBozQxZm9VIUf2czjbfX/z
 E0AaxMZh6tBnRhLjqguN6l7X6kpKPXEpmfm/zMgkaEuYIutOSVI+9uear+tVAIxC
 3b6byDqDcQKJTSwc7ZBiplEchp3R5nr1vW9grOkQvOJntxi2NjJJL+8qmaOs9t5K
 zGHq0GAbVFcIsIE75It1G2qE6Cd2J42zBr4EcOpxsVW3H7Sa+Lx23b3PFkpA/3rg
 V/MnVMLnOaaqc9uSADvv9o1WQiEO4ZSBJQfpXeylVGCqck80HDodRC/owhq8ovTS
 YmSU77wyakFnshM98XQw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tew80p09s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 11:55:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC849100053;
 Wed,  4 Oct 2023 11:55:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE6D222F7A4;
 Wed,  4 Oct 2023 11:55:40 +0200 (CEST)
Received: from [10.201.22.165] (10.201.22.165) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 11:55:39 +0200
Message-ID: <85fc4468-136b-4d26-b249-50f147722377@foss.st.com>
Date: Wed, 4 Oct 2023 11:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20230926150924.1150082-1-patrice.chotard@foss.st.com>
 <20230926150924.1150082-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230926150924.1150082-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_01,2023-10-02_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/6] ARM: dts: stm32mp: alignment with
	v6.6-rc1
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

On 9/26/23 17:09, Patrice Chotard wrote:
> Device tree alignment with Linux kernel v6.6.rc1.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp131.dtsi                  |  52 +--
>   arch/arm/dts/stm32mp135f-dk.dts               |  68 ++--
>   arch/arm/dts/stm32mp15-pinctrl.dtsi           | 364 +++++++++++++++++-
>   arch/arm/dts/stm32mp15-scmi.dtsi              |   7 +-
>   arch/arm/dts/stm32mp151.dtsi                  |  34 +-
>   arch/arm/dts/stm32mp157.dtsi                  |  15 +-
>   arch/arm/dts/stm32mp157a-dk1-scmi.dts         |   7 +-
>   ...157a-microgea-stm32mp1-microdev2.0-of7.dts |   3 +
>   arch/arm/dts/stm32mp157c-dk2-scmi.dts         |   7 +-
>   arch/arm/dts/stm32mp157c-dk2.dts              |  30 +-
>   arch/arm/dts/stm32mp157c-ed1-scmi.dts         |   7 +-
>   arch/arm/dts/stm32mp157c-ed1.dts              |  24 +-
>   arch/arm/dts/stm32mp157c-ev1-scmi.dts         |   7 +-
>   arch/arm/dts/stm32mp157c-ev1.dts              |  34 +-
>   arch/arm/dts/stm32mp15xx-dkx.dtsi             |  42 +-
>   include/dt-bindings/clock/stm32mp1-clks.h     |   2 +-
>   include/dt-bindings/clock/stm32mp13-clks.h    |   2 +-
>   .../regulator/st,stm32mp13-regulator.h        |  42 ++
>   include/dt-bindings/reset/stm32mp1-resets.h   |   2 +-
>   include/dt-bindings/reset/stm32mp13-resets.h  |   2 +-
>   20 files changed, 585 insertions(+), 166 deletions(-)
>   create mode 100644 include/dt-bindings/regulator/st,stm32mp13-regulator.h
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
