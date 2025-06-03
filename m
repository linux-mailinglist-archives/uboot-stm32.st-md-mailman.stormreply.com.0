Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DB5ACCC51
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jun 2025 19:40:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DD5AC349C2;
	Tue,  3 Jun 2025 17:40:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDFD6C349C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 17:40:12 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553FYUVV020798;
 Tue, 3 Jun 2025 19:39:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 1La8uoRmAYISCHljPnHlzx9cb8jZlKDAMFLIdaB/+kY=; b=J8zqiH6hay/g1AJ0
 YDEaiKcfbMhWtfGONQZGKq4Hze4r6h9RyE98sWu+CybO5LVO5DjInnYHpvx7xSqP
 Chz0Vxww0nh+Lpbif3tQvsl5oqPj4mmo2Va8BjFcKVWrILO10EgKLfjelEddprNn
 3l3Tf58PyMDZTg1tLMvWghpz6/wTnnCW0m2c/QJPtoqZUSXug2zeo4MlbiG9fweM
 +D4/+m71o0JQr2epUNNszYH875+XOL7BCabAqGtISnDZWxcTSJUhUQdyxXZ9KHw3
 8Bp/juz5nlqmCh+LpenYNN7kTblVdqhKZISSagbbHxvAUhhKMb6iSFYx+z2d5pBE
 8m5Qig==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g90dd69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jun 2025 19:39:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 047EC40048;
 Tue,  3 Jun 2025 19:37:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AF5DB53CAF;
 Tue,  3 Jun 2025 19:35:34 +0200 (CEST)
Received: from [10.48.86.182] (10.48.86.182) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 19:35:33 +0200
Message-ID: <62144808-0229-4d3d-a053-f6c79d6d3009@foss.st.com>
Date: Tue, 3 Jun 2025 19:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
 <20250527132755.2169508-12-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250527132755.2169508-12-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_02,2025-06-02_01,2025-03-28_01
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Christian Marangi <ansuelsmth@gmail.com>, Joseph Chen <chenjh@rock-chips.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Huan Zhou <me@per1cycle.org>, Elaine Zhang <zhangqing@rock-chips.com>,
 Sumit Garg <sumit.garg@kernel.org>, Igor Opaniuk <igor.opaniuk@gmail.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Greg Malysa <malysagreg@gmail.com>,
 Simon Glass <sjg@chromium.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>
Subject: Re: [Uboot-stm32] [PATCH v2 11/13] reset: stm32mp25: add stm32mp25
	reset driver
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

On 5/27/25 15:27, Patrice Chotard wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>
> Implement STM32MP25 reset drivers using stm32-core-reset API.
> This reset stm32-reset-core API and will be able to use DT binding
> index started from 0.
>
> This patch also moves legacy reset into stm32 directory reset.
>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> ---
>
> Changes in v2:
>      - Rename RCC_USB2CFGR to RCC_USBHCFGR
>
>   MAINTAINERS                            |   3 +-
>   drivers/misc/stm32_rcc.c               |  66 +++++-----
>   drivers/reset/Kconfig                  |   9 +-
>   drivers/reset/Makefile                 |   4 +-
>   drivers/reset/stm32-reset.c            |  97 ---------------
>   drivers/reset/stm32/Kconfig            |  23 ++++
>   drivers/reset/stm32/Makefile           |   9 ++
>   drivers/reset/stm32/stm32-reset-core.c |  92 ++++++++++++++
>   drivers/reset/stm32/stm32-reset-core.h |  31 +++++
>   drivers/reset/stm32/stm32-reset-mp1.c  |  55 +++++++++
>   drivers/reset/stm32/stm32-reset-mp25.c | 159 +++++++++++++++++++++++++
>   drivers/reset/stm32/stm32-reset.c      |  43 +++++++
>   include/stm32_rcc.h                    |   7 +-
>   13 files changed, 460 insertions(+), 138 deletions(-)
>   delete mode 100644 drivers/reset/stm32-reset.c
>   create mode 100644 drivers/reset/stm32/Kconfig
>   create mode 100644 drivers/reset/stm32/Makefile
>   create mode 100644 drivers/reset/stm32/stm32-reset-core.c
>   create mode 100644 drivers/reset/stm32/stm32-reset-core.h
>   create mode 100644 drivers/reset/stm32/stm32-reset-mp1.c
>   create mode 100644 drivers/reset/stm32/stm32-reset-mp25.c
>   create mode 100644 drivers/reset/stm32/stm32-reset.c
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
