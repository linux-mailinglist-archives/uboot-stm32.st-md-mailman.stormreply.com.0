Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAF56F5013
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 May 2023 08:27:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19021C6A5FD;
	Wed,  3 May 2023 06:27:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61264C0356E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 06:27:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3434w0Ok017340; Wed, 3 May 2023 08:27:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=30wyotBELBo4ijPx0hzefRfptkeSXbd8itlk1cW7c7g=;
 b=BPFo8V8FdFpgA3+uEtvl4OuLeRf0zBhMqLijJxhoTVsXyIu+fmMI2fxP+75q3+Rw8uRB
 r3QAwNtbX+rppcgMIga1WaES+48EKsJ86NdZ+8jxHwwubg30O79O8SbYEnTbhxt0h9WS
 q6RyHnLdJIJPEPJ6QEmJ9FjHf/EeX76ySfEkushQz5r5p696G8jvQ12mJSMt+LakN64z
 Cph3sSzBxHCYdIxRzBK1w8LJE+7pasfdvkCsq00xnHpeL0xnSHyxnSRPQrSS54OyMtAg
 Rn8t7eqoAz19awr2QTWwCrgVV1hO4xGhMmVOOFIlIlaCM4ijVze+IS9m8RlvYARkSF1P gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qatkufmac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 08:27:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41E23100038;
 Wed,  3 May 2023 08:27:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 322F9211F36;
 Wed,  3 May 2023 08:27:23 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 3 May
 2023 08:27:22 +0200
Message-ID: <20d8269c-62da-a74f-bb0a-37391366c855@foss.st.com>
Date: Wed, 3 May 2023 08:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
 <20230427153632.1.I6aa05833267d4f481cd4b93967b34341002e2566@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230427153632.1.I6aa05833267d4f481cd4b93967b34341002e2566@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_03,2023-04-27_01,2023-02-09_01
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] stm32mp: add support of STM32MP15x
	Rev.Y
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
> Add support of STM32MP15x Rev.Y for the Silicon revision REV_ID = 0x2003.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/include/mach/sys_proto.h | 1 +
>  arch/arm/mach-stm32mp/stm32mp15x.c             | 5 ++++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index 0d39b67178e4..83fb32a45fcc 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -44,6 +44,7 @@ u32 get_cpu_dev(void);
>  #define CPU_REV1_2	0x1003
>  #define CPU_REV2	0x2000
>  #define CPU_REV2_1	0x2001
> +#define CPU_REV2_2	0x2003
>  
>  /* return Silicon revision = REV_ID[15:0] of Device Version */
>  u32 get_cpu_rev(void);
> diff --git a/arch/arm/mach-stm32mp/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp15x.c
> index 660c907a6ba3..afc56b02eea4 100644
> --- a/arch/arm/mach-stm32mp/stm32mp15x.c
> +++ b/arch/arm/mach-stm32mp/stm32mp15x.c
> @@ -266,7 +266,7 @@ static const char * const soc_type[] = {
>  };
>  
>  static const char * const soc_pkg[] = { "??", "AD", "AC", "AB", "AA" };
> -static const char * const soc_rev[] = { "?", "A", "B", "Z" };
> +static const char * const soc_rev[] = { "?", "A", "B", "Z", "Y"};
>  
>  static void get_cpu_string_offsets(unsigned int *type, unsigned int *pkg,
>  				   unsigned int *rev)
> @@ -307,6 +307,9 @@ static void get_cpu_string_offsets(unsigned int *type, unsigned int *pkg,
>  	case CPU_REV2_1:
>  		*rev = 3;
>  		break;
> +	case CPU_REV2_2:
> +		*rev = 4;
> +		break;
>  	default:
>  		*rev = 0;
>  		break;

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
