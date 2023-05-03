Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 715146F5015
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 May 2023 08:27:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34C62C6A60E;
	Wed,  3 May 2023 06:27:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A79B4C6A60D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 06:27:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3436O2BA000396; Wed, 3 May 2023 08:27:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5imw9sVZKIEYuf1lK98im+XGUq7gBpRr16rqNcWBaSk=;
 b=VlCltEOX/F48FMt7pfCz9j4wLMyXv3U46Zn0jVCGnoL/dsaSaVVOAC70V5mrY/NtmlFN
 +lJVHMUL3ymwc6MKLVf0jHVjVT2YRssjMs8lUoh48db6DxbRaDh09ySyNn2nLz+FM1p/
 3yYiin1xCCc8wB8ZsV8z6CGPiN7eaQt002eptWlc3fEJ9L8c7gzgQ4vECUVVTGc2ItBE
 OiS4pE6XzRrnGILBGc3+Cgn2PeYrLDV9oaTBnO63zoX3On2/JStUZ3oEn33Z5PxvQ6i3
 tJo6dpNiaaRf+nuSq9JMTklO1ND/ywHOlfHDidNakJ7JodtkCHqvlwfvYQODJy4l4B2a Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qb37um10h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 08:27:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9BE7A10002A;
 Wed,  3 May 2023 08:27:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 95942211F33;
 Wed,  3 May 2023 08:27:50 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 3 May
 2023 08:27:50 +0200
Message-ID: <ad99a8c3-a021-b3f7-878d-89b13a948268@foss.st.com>
Date: Wed, 3 May 2023 08:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
 <20230427153632.3.Ib054753be65d3ea7a0b3fd189c0a0422d19b37c2@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230427153632.3.Ib054753be65d3ea7a0b3fd189c0a0422d19b37c2@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_03,2023-04-27_01,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/6] configs: stm32mp1: reduce
 DDR_CACHEABLE_SIZE to supported 256MB DDR
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
> Reduces the CONFIG_DDR_CACHEABLE_SIZE, the size of DDR mapped cacheable
> before relocation, to support DDR with only 256MB because the OP-TEE
> reserved memory is located at end of the DDR.
> 
> By default the new size of 128MB cacheable memory is enough
> in dram_bank_mmu_setup() for early_enable_caches() in arch_cpu_init()
> and is correct for DDR size = 256MB.
> 
> After relocation the real size of DDR, excluding the no-map reserved
> memory, is used after the U-Boot device tree parsing.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp13_defconfig | 2 +-
>  configs/stm32mp15_defconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index b076573c450f..4c1e412af0e6 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -7,7 +7,7 @@ CONFIG_ENV_OFFSET=0x900000
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp135f-dk"
>  CONFIG_SYS_PROMPT="STM32MP> "
>  CONFIG_STM32MP13x=y
> -CONFIG_DDR_CACHEABLE_SIZE=0x10000000
> +CONFIG_DDR_CACHEABLE_SIZE=0x8000000
>  CONFIG_CMD_STM32KEY=y
>  CONFIG_TARGET_ST_STM32MP13x=y
>  CONFIG_ENV_OFFSET_REDUND=0x940000
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index a8eda7b4ad88..b912d6735bc0 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -7,7 +7,7 @@ CONFIG_ENV_OFFSET=0x480000
>  CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
>  CONFIG_SYS_PROMPT="STM32MP> "
> -CONFIG_DDR_CACHEABLE_SIZE=0x10000000
> +CONFIG_DDR_CACHEABLE_SIZE=0x8000000
>  CONFIG_CMD_STM32KEY=y
>  CONFIG_TYPEC_STUSB160X=y
>  CONFIG_TARGET_ST_STM32MP15x=y
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
