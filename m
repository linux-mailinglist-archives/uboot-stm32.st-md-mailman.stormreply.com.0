Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC554F3EC
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jun 2022 11:08:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3915AC5F1F2;
	Fri, 17 Jun 2022 09:08:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B787DC5F1EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 09:08:21 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H7qKvl027682;
 Fri, 17 Jun 2022 11:08:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=b4RkLpLJPxj7C7f12L6XVcb5cxuIry1HFTc0e0tj19Y=;
 b=E/Q4trZZZdlc3lMVWCuoVQGrWCYPpM/DLJcfyiGve95UC/CBMl4j/NZvqyIW06OYr4ww
 7Hbu+keElmn3MV6+U2s4NbPp5qWrvIL6mE/Bmd+DXAgWa36ZHLbGMR1VrtYo7R1kH8M5
 cGumusd3I/4loDgBJofm6qjPEvfIFZeuRiTG5Sv4B5goMaUBusI+stZ/BhBqKagGQK4N
 YeLJ9swodfdICI4t0o05WAEZ7JQ4gVAFCjjiwqqzuQruQcHI9R37JbeiTSWY7J3mtApn
 9hglxGKSbYU33v0geu9m3OPvQjbySaWzVPSrGX3lEchw1jj145gDkIM16UW3MQWboXnO EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gqd185f5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 11:08:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 70DE610002A;
 Fri, 17 Jun 2022 11:08:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C05C21A22A;
 Fri, 17 Jun 2022 11:08:14 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.116) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 17 Jun
 2022 11:08:14 +0200
Message-ID: <bbaf0926-f58b-dc96-8ae1-41705d8ae165@foss.st.com>
Date: Fri, 17 Jun 2022 11:08:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220602130535.722317-1-patrick.delaunay@foss.st.com>
 <20220602150254.v3.1.Ieec76f320c9cc6885d7b519dffddff9ad4c97b59@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220602150254.v3.1.Ieec76f320c9cc6885d7b519dffddff9ad4c97b59@changeid>
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_08,2022-06-16_01,2022-02-23_01
Cc: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Lukasz Majewski <lukma@denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v3 1/3] clk: Add directory for STM32 clock
	drivers
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

On 6/2/22 15:05, Patrick Delaunay wrote:
> Add a directory in drivers/clk to regroup the clock drivers for all
> STM32 SoCs with CONFIG_ARCH_STM32 (MCUs with Cortex-M) or
> CONFIG_ARCH_STM32MP (MPUs with Cortex-A).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Grzegorz Szymaszek <gszymaszek@short.pl>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
> Changes in v3:
> - Some nits in commit message (s/Soc/SoCs/ & s/cortex /Cortex-/)
>
> Changes in v2:
> - replace '_' by '-' in file names to be consistant with other clk drivers
>    and prepare introduction of new files for stm32mp13
>
>   MAINTAINERS                                   |  2 +-
>   drivers/clk/Kconfig                           | 17 +-------------
>   drivers/clk/Makefile                          |  5 ++--
>   drivers/clk/stm32/Kconfig                     | 23 +++++++++++++++++++
>   drivers/clk/stm32/Makefile                    |  7 ++++++
>   .../clk/{clk_stm32f.c => stm32/clk-stm32f.c}  |  0
>   .../{clk_stm32h7.c => stm32/clk-stm32h7.c}    |  0
>   .../{clk_stm32mp1.c => stm32/clk-stm32mp1.c}  |  0
>   8 files changed, 34 insertions(+), 20 deletions(-)
>   create mode 100644 drivers/clk/stm32/Kconfig
>   create mode 100644 drivers/clk/stm32/Makefile
>   rename drivers/clk/{clk_stm32f.c => stm32/clk-stm32f.c} (100%)
>   rename drivers/clk/{clk_stm32h7.c => stm32/clk-stm32h7.c} (100%)
>   rename drivers/clk/{clk_stm32mp1.c => stm32/clk-stm32mp1.c} (100%)
>

Applied to u-boot-stm/next, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
