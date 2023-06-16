Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F42733053
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jun 2023 13:47:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DC10C65E58;
	Fri, 16 Jun 2023 11:47:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63896C64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 11:47:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35G85oYU021489; Fri, 16 Jun 2023 13:47:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/qsVf9cDRm6C/rF5Ixq7efHDDoy0u5DVAr4qjJdv03k=;
 b=J8ez3NP8JoJ4o+Uxux69K+qz7XrgILigK9dZ4lSqjH8spKK1AHV72vCLuVAHAjHh4v0x
 MnoJHIPh9JkgFij/HBdeiEV6F/P4t4q0lABkZiqzGvaCtwbKFKZ85F42ysbDcEijTUsl
 0Kix0v9Gm0YuwX+G0Dnv/JHsM+DIkohWcwKQxSZyX3WYzD4TR1iL3KVMCq4+AWKeIj9F
 xXd7UxROPea9RFYGnIMYELtH9YInN/BHK8DNLuyswjzPq+AgZWw4UL6s+r21OFRKvqg4
 DhGYPtkQ78+xp8fHCPGuXPrwLakwt+9e5zU/XJl31qIViTWTWf1ciZQcocGGh497lpv7 jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r8kx2hfdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 13:47:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A52B810004A;
 Fri, 16 Jun 2023 13:47:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F8DB216833;
 Fri, 16 Jun 2023 13:47:05 +0200 (CEST)
Received: from [10.252.4.57] (10.252.4.57) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 16 Jun
 2023 13:47:05 +0200
Message-ID: <84959252-6ec6-ab18-eec5-635fac48d210@foss.st.com>
Date: Fri, 16 Jun 2023 13:47:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
X-Originating-IP: [10.252.4.57]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
Cc: CITOOLS <MDG-smet-aci-reviews@list.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Simon Glass <sjg@chromium.org>,
 Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 0/6] stm32mp: soome changes and fixes for
 STM32MP13 and STM32MP15 boards
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


On 4/27/23 15:36, Patrick Delaunay wrote:
> Hi,
> 
> here come some cleanups and fixed for the STM32MP13 and STM32MP15 boards.
> 
> 
> 
> Patrick Delaunay (6):
>   stm32mp: add support of STM32MP15x Rev.Y
>   stm32mp: bsec: add check on null size in misc ops
>   configs: stm32mp1: reduce DDR_CACHEABLE_SIZE to supported 256MB DDR
>   stm32mp: stm32prog: fix OTP read/write error management
>   stm32mp: stm32prog: use the decimal format by default for offset
>     parsing
>   pmic: stpmic1: support new prefix node name for regulator
> 
>  arch/arm/mach-stm32mp/bsec.c                    |  4 ++--
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 11 +++++++++--
>  arch/arm/mach-stm32mp/include/mach/sys_proto.h  |  1 +
>  arch/arm/mach-stm32mp/stm32mp15x.c              |  5 ++++-
>  configs/stm32mp13_defconfig                     |  2 +-
>  configs/stm32mp15_defconfig                     |  2 +-
>  drivers/power/pmic/stpmic1.c                    |  2 ++
>  7 files changed, 20 insertions(+), 7 deletions(-)
> 

for the whole series:

Applied to u-boot-stm/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
