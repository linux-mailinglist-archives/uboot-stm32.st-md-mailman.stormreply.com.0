Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D3869FBB3
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Feb 2023 20:07:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A9B4C65E58;
	Wed, 22 Feb 2023 19:07:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1823C65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 19:07:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31MFoFv3006471; Wed, 22 Feb 2023 20:07:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Xr3EHAw3AFGXWFPn056Yyqa8Bz14ES2yycBhcwOvAjA=;
 b=1GFVbr1Xu3KUTBfBTH/Wbpz+cJ5r6Q5TP+4otp5Be+WuUOoqQkVN2zLru2rU6jwLTYMq
 y0hXkb0r5JU6jk8NiAcUcCjgP14ekq73jz1T7cwBqx1a/Au6nBDpISAmT5bL8TFRSgo+
 9RSQWXiTV/qrOql24WntivbxJdjydgNoXhSiKndICpieo+mINYb/wrxBfDdV03UAOxK5
 DX6p8Lvr+ga5WTpSMXr0PraaC2tKJNZ9T21ib4uhXutK/+zd97ciZ0HEWRSf3caCRCLm
 4YVfm0tBh2fKgbuItvHTKfILLpByQW2ZsJNHrVD/t7GG38gMlL2RpCb01y+oBMdEni7I 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nwhq2jnjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Feb 2023 20:07:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C27DB10002A;
 Wed, 22 Feb 2023 20:07:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B48AE22A6C5;
 Wed, 22 Feb 2023 20:07:14 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 22 Feb
 2023 20:07:07 +0100
Message-ID: <7719bf0c-4280-351b-3e4f-cf1629f7e993@foss.st.com>
Date: Wed, 22 Feb 2023 20:07:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>, <u-boot@lists.denx.de>
References: <20230123220031.3540724-1-sjg@chromium.org>
 <20230123220031.3540724-69-sjg@chromium.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230123220031.3540724-69-sjg@chromium.org>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_08,2023-02-22_02,2023-02-09_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Fabio Estevam <festevam@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 William Zhang <william.zhang@broadcom.com>,
 Samuel Holland <samuel@sholland.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Lukasz Majewski <lukma@denx.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Sean Anderson <seanga2@gmail.com>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 68/88] arm: Rename STM32MP13x
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

On 1/23/23 23:00, Simon Glass wrote:
> CONFIG options must not use lower-case letter. Convert this and related
> ones to upper case.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
>   arch/arm/dts/Makefile                      |  2 +-
>   arch/arm/mach-stm32mp/Kconfig              |  4 ++--
>   arch/arm/mach-stm32mp/Kconfig.13x          |  4 ++--
>   arch/arm/mach-stm32mp/Makefile             |  2 +-
>   arch/arm/mach-stm32mp/cmd_stm32key.c       | 10 +++++-----
>   arch/arm/mach-stm32mp/fdt.c                |  4 ++--
>   arch/arm/mach-stm32mp/include/mach/stm32.h |  6 +++---
>   board/st/common/Kconfig                    |  2 +-
>   board/st/stm32mp1/Kconfig                  |  2 +-
>   configs/stm32mp13_defconfig                |  4 ++--
>   drivers/clk/stm32/Kconfig                  |  2 +-
>   11 files changed, 21 insertions(+), 21 deletions(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
