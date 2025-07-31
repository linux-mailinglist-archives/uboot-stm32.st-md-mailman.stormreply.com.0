Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE778B16E78
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Jul 2025 11:22:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90993C3F933;
	Thu, 31 Jul 2025 09:22:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 326DDC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 09:22:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V8ijhn008673;
 Thu, 31 Jul 2025 11:22:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 yovxaic6wqCrO5V9wM7yi2zK8fNsgjvb5/QxGwB2BUE=; b=eyIz3ZTQSYSwfVWA
 pOUPWCUOw/aC7q6AftlrLITkeZcZpj8HG4OEW1KXNCI2l5WpxZWvaxUzrMafloKK
 63BrNJE+bQg7WleBaU1D8WwHvGo9IKgmgxetib4OwoXbG0hsTN6UYgALcd0A+Gmn
 BSsM8ryuRU6zQ6/sc+jBwWzMTwQeZGnbbXSnaEyksADUxKq4Wq1oR6VHYeQTnhRf
 xBmBbZ2RCMuMsAAaq00BBc7LhBrGk8BSaNlhqRgoSYNEP+U6qGmRdbbntzE1fRhG
 u8G9ACPvzw1kNdJ3upWqlVn+8zj7CzCz1xwP1JGTUyXsP3ZV4vMqwClGvq+SIQhl
 tUkUiw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484nwgwkv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Jul 2025 11:22:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BDBAC40044;
 Thu, 31 Jul 2025 11:22:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67E956CD64A;
 Thu, 31 Jul 2025 11:21:52 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 11:21:52 +0200
Message-ID: <7d274a4b-de3a-4024-be03-ade2d8b53dcf@foss.st.com>
Date: Thu, 31 Jul 2025 11:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20250626081721.49349-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250626081721.49349-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: replace space by tab in
	sys_proto.h
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



On 6/26/25 10:17, Patrice Chotard wrote:
> Cosmetic update to replace space by tab in sys_proto.h
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  .../arm/mach-stm32mp/include/mach/sys_proto.h | 32 +++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index 19073668497..5d67589bc79 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -31,22 +31,22 @@
>  #define CPU_STM32MP131Dxx	0x05010EC9
>  
>  /* ID for STM32MP25x = Device Part Number (RPN) (bit31:0) */
> -#define CPU_STM32MP257Cxx       0x00002000
> -#define CPU_STM32MP255Cxx       0x00082000
> -#define CPU_STM32MP253Cxx       0x000B2004
> -#define CPU_STM32MP251Cxx       0x000B3065
> -#define CPU_STM32MP257Axx       0x40002E00
> -#define CPU_STM32MP255Axx       0x40082E00
> -#define CPU_STM32MP253Axx       0x400B2E04
> -#define CPU_STM32MP251Axx       0x400B3E65
> -#define CPU_STM32MP257Fxx       0x80002000
> -#define CPU_STM32MP255Fxx       0x80082000
> -#define CPU_STM32MP253Fxx       0x800B2004
> -#define CPU_STM32MP251Fxx       0x800B3065
> -#define CPU_STM32MP257Dxx       0xC0002E00
> -#define CPU_STM32MP255Dxx       0xC0082E00
> -#define CPU_STM32MP253Dxx       0xC00B2E04
> -#define CPU_STM32MP251Dxx       0xC00B3E65
> +#define CPU_STM32MP257Cxx	0x00002000
> +#define CPU_STM32MP255Cxx	0x00082000
> +#define CPU_STM32MP253Cxx	0x000B2004
> +#define CPU_STM32MP251Cxx	0x000B3065
> +#define CPU_STM32MP257Axx	0x40002E00
> +#define CPU_STM32MP255Axx	0x40082E00
> +#define CPU_STM32MP253Axx	0x400B2E04
> +#define CPU_STM32MP251Axx	0x400B3E65
> +#define CPU_STM32MP257Fxx	0x80002000
> +#define CPU_STM32MP255Fxx	0x80082000
> +#define CPU_STM32MP253Fxx	0x800B2004
> +#define CPU_STM32MP251Fxx	0x800B3065
> +#define CPU_STM32MP257Dxx	0xC0002E00
> +#define CPU_STM32MP255Dxx	0xC0082E00
> +#define CPU_STM32MP253Dxx	0xC00B2E04
> +#define CPU_STM32MP251Dxx	0xC00B3E65
>  
>  /* return CPU_STMP32MP...Xxx constants */
>  u32 get_cpu_type(void);
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
