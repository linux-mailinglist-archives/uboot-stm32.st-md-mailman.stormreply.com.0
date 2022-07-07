Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA163569BC5
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:38:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64D1AC0D2BF;
	Thu,  7 Jul 2022 07:38:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 745E9C04005
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:38:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675ghjd029324;
 Thu, 7 Jul 2022 09:38:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=CaCPtNqKsMWBVXHoJI9VAKrATTn5F7E+f45+6tUYHBU=;
 b=o6FJmFPDZqyebuCP6mfHs3viPUQ4801fIO6PVwC/2gyiCziUBrCWg2vUmNOYGoiJ0Pkg
 Xtrn7iJShZeEK3sPtTYkWYjs8FF+VXuqZJokVVslQUUiEzAEEJygJM5rQlP1PIbnY8GA
 iIyk50qKBfIfpCHW4QgkVLuJj9bq+4lHLqcEuCl/dLlChoe3RM+d9bhSqeerhk/DHISM
 tE6Aj2WBrVpCsERbmmE9DE+tj1h4S0StfQRsHFVJGTFSiPiipppT57zGlQ6qjP9RUA8o
 pg8qMtuw1zSmVFknGdi9dydc+MA4GwrgH3Uz0fd3vXmIuPNQnAhF6D0nY8rewJw3hNy4 ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4ubfayqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:38:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43751100034;
 Thu,  7 Jul 2022 09:38:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3EDBA211614;
 Thu,  7 Jul 2022 09:38:21 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:38:20 +0200
Message-ID: <89110259-f66a-4715-9004-8bb19a6a3538@foss.st.com>
Date: Thu, 7 Jul 2022 09:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220630101930.v2.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
 <20220630101930.v2.3.I09a7e6bd976c0720cef2de21e3acd62ff8a7b846@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220630101930.v2.3.I09a7e6bd976c0720cef2de21e3acd62ff8a7b846@changeid>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_05,2022-06-28_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 03/10] stm32mp: add support of
	STM32MP13x Rev.Y
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

Hi Patrick

On 6/30/22 10:20, Patrick Delaunay wrote:
> Add support of STM32MP13x Rev.Y for the Silicon revision REV_ID = 0x1003.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - fix value of CPU_REV1_2 = 0x1003, because minor version in REV_ID
>   is bitfield at SoC level (0 = 0, 1 = 1, 2 = 3, 3 = 7, 4 =F, ....)
> 
>  arch/arm/mach-stm32mp/include/mach/sys_proto.h | 1 +
>  arch/arm/mach-stm32mp/stm32mp13x.c             | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index 4b564e86dc5..f19a70e53e0 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -41,6 +41,7 @@ u32 get_cpu_dev(void);
>  
>  #define CPU_REV1	0x1000
>  #define CPU_REV1_1	0x1001
> +#define CPU_REV1_2	0x1003
>  #define CPU_REV2	0x2000
>  #define CPU_REV2_1	0x2001
>  
> diff --git a/arch/arm/mach-stm32mp/stm32mp13x.c b/arch/arm/mach-stm32mp/stm32mp13x.c
> index bd3f24c349a..845d973ad1b 100644
> --- a/arch/arm/mach-stm32mp/stm32mp13x.c
> +++ b/arch/arm/mach-stm32mp/stm32mp13x.c
> @@ -126,6 +126,9 @@ void get_soc_name(char name[SOC_NAME_SIZE])
>  	case CPU_REV1_1:
>  		cpu_r = "Z";
>  		break;
> +	case CPU_REV1_2:
> +		cpu_r = "Y";
> +		break;
>  	default:
>  		cpu_r = "?";
>  		break;
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
