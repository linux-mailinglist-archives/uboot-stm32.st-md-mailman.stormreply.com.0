Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A07700982
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 May 2023 15:52:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 401F8C6904E;
	Fri, 12 May 2023 13:52:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17C03C65E60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 May 2023 13:52:44 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CCW6ke022567; Fri, 12 May 2023 15:52:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8FPaoawkb7E/+Iygv2rw4TDkU++v/K8PduGAZrWbQZs=;
 b=FlnQVK+vbYXw/0frVyGwcpGDQZYjlG1WLj7dLYTa+znN6hrxfSqbAO8q77j2k/QICTHs
 97L7Zmi2cuoya5o0Y623qjqhXC8+o4hLOHvvxINhlJ4kavjB90ivjmM1oZ4jpp4CU3Lc
 H0BASUBkHqbWUrCUmd2nY8KflVY2y0ClT8zFXkKbIoz+x07PX3mVDt3bYeiHjo8l1HBL
 p50vXOcqXfAF/6MBzQ7NM6JbL8dvdkJxyecLr0k3HUoDGDe3DmX5Fc6bbmd48lKviOpU
 ew+V1/jhp4TqXpX76+MbC6v8KE/+teM8aeP2YZm54Fl1Cnhdxcxy3j1h86BvO9WVPmbt mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qhj73j0ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 15:52:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2285510002A;
 Fri, 12 May 2023 15:52:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B24224C422;
 Fri, 12 May 2023 15:52:38 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 12 May
 2023 15:52:37 +0200
Message-ID: <59931751-b2dd-0b01-c2dd-869e7b25d33f@foss.st.com>
Date: Fri, 12 May 2023 15:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230511195545.228508-1-marex@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230511195545.228508-1-marex@denx.de>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_08,2023-05-05_01,2023-02-09_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, antonio.borneao@foss.st.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v2] ARM: stm32: Add IWDG handling into
 PSCI suspend code
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

On 5/11/23 21:55, Marek Vasut wrote:
> In case the IWDG is enabled by either U-Boot or Linux, the IWDG can never
> be disabled again. That includes low power states, which means that if the
> IWDG is enabled, the SoC would reset itself after a while in suspend via
> the IWDG. This is not desired behavior.
>
> It is possible to enable IWDG pre-timeout IRQ which is routed into the EXTI,
> and use that IRQ to wake the CPU up before the IWDG timeout is reached and
> reset is triggered. This pre-timeout IRQ can be used to reload the WDT and
> then suspend the CPU again every once in a while.
>
> Implement this functionality for both IWDG1 and IWDG2 by reading out all
> the unmasked IRQs, comparing the list with currently pending IRQs in GICv3:
> - If any IRQ is pending and it is NOT IWDG1 or IWDG2 pre-timeout IRQ,
>    wake up and let OS handle the IRQs
> - If IWDG1 or IWDG2 IRQ is pending and no other IRQ is pending,
>    ping the respective IWDG and suspend again
>
> This does not seem to have any adverse impact on power consumption in suspend.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
> V2: Ping the IWDG before entering WFI to assure they would not reset the SoC
> ---
>   arch/arm/mach-stm32mp/include/mach/stm32.h |  2 +
>   arch/arm/mach-stm32mp/psci.c               | 73 ++++++++++++++++++++--
>   2 files changed, 70 insertions(+), 5 deletions(-)


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
