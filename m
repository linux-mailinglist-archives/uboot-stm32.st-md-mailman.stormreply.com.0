Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B5469FBB4
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Feb 2023 20:08:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C6EDC65E58;
	Wed, 22 Feb 2023 19:08:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33704C65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 19:08:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31MFaENw006442; Wed, 22 Feb 2023 20:07:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/eTLzDNyAAmEYuKTGEJL6gPf1qot6M5X2w19FQ0atxI=;
 b=cGuuw/vAxQn/rraWEYixK/KRKElLLPzqUwIxbm43j3211owMHfU8nwnRrSDUfIimLKk2
 xrR77+uT27gmAMh5R0zyo5tF4s3kxHn7NZa+m+6qqMhjwrJ+KN5a19+IHxcCatUl/LrZ
 3fac+RoyXilVbq9uPNyPdhX5bawKiYdJZklLN5VsQfDB/6GihQb+Iu1KhNYKQbUTHL9B
 XTP6jetdcnQfIyM9RvvZj+kVar8fAAVzJI7pzYnDNBfPDc/8+bQ/LVp5C5LN2KHfqrOr
 i3kxoqD9vP5QQCbuw994d8agbr6xqOCIuTNhtbIPxYbJlnRjohHokjFSECXra+sLYBqd DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nwhq2jnm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Feb 2023 20:07:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C000B10002A;
 Wed, 22 Feb 2023 20:07:41 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A24D22A6D3;
 Wed, 22 Feb 2023 20:07:41 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 22 Feb
 2023 20:07:38 +0100
Message-ID: <27682d0d-eb69-3501-4032-030892c11466@foss.st.com>
Date: Wed, 22 Feb 2023 20:07:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>, <u-boot@lists.denx.de>
References: <20230123220031.3540724-1-sjg@chromium.org>
 <20230123220031.3540724-70-sjg@chromium.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230123220031.3540724-70-sjg@chromium.org>
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
 Andre Przywara <andre.przywara@arm.com>, Lukasz Majewski <lukma@denx.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Sean Anderson <seanga2@gmail.com>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 69/88] arm: Rename STM32MP15x
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
>   arch/arm/dts/Makefile                          |  2 +-
>   arch/arm/dts/stm32mp15-u-boot.dtsi             |  2 +-
>   arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi       |  4 ++--
>   arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi       |  4 ++--
>   arch/arm/mach-stm32mp/Kconfig                  |  6 +++---
>   arch/arm/mach-stm32mp/Kconfig.15x              |  6 +++---
>   arch/arm/mach-stm32mp/Makefile                 |  2 +-
>   arch/arm/mach-stm32mp/cmd_stm32key.c           | 10 +++++-----
>   .../mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c |  2 +-
>   .../arm/mach-stm32mp/cmd_stm32prog/stm32prog.c |  4 ++--
>   .../arm/mach-stm32mp/cmd_stm32prog/stm32prog.h |  6 +++---
>   arch/arm/mach-stm32mp/fdt.c                    |  8 ++++----
>   arch/arm/mach-stm32mp/include/mach/stm32.h     | 10 +++++-----
>   arch/arm/mach-stm32mp/include/mach/stm32prog.h |  2 +-
>   board/st/common/Kconfig                        | 14 +++++++-------
>   board/st/common/stm32mp_mtdparts.c             | 18 +++++++++---------
>   board/st/stm32mp1/Kconfig                      |  2 +-
>   board/st/stm32mp1/stm32mp1.c                   |  6 +++---
>   configs/stm32mp15_basic_defconfig              |  2 +-
>   configs/stm32mp15_defconfig                    |  2 +-
>   configs/stm32mp15_trusted_defconfig            |  4 ++--
>   drivers/clk/stm32/Kconfig                      |  2 +-
>   22 files changed, 59 insertions(+), 59 deletions(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
