Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D29550B1E3
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Apr 2022 09:43:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AC1CC60496;
	Fri, 22 Apr 2022 07:43:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77F11C60492
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:43:21 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M5OCGW016636;
 Fri, 22 Apr 2022 09:43:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RkcZx2R9VK72eVfz80S07+pKKbQz1zgzYVbJsluItkM=;
 b=UmwCvruxeQ3o1eu6NCsFORiPySPcY37ndlVREi5+YZCopOE2HDlYjCT4aeUHbP6OE6qF
 vx+SyDcZRjamuBALMbVlXZ8CXR9gD76s9svEKIebKvGyp8GfXQEzixbXkBNb65XWzYYv
 Z92CpwRMFEoPb80l5XJ6IBPea0KdnQf96MAkvR+67dR0F3EQP/Ptl1ULiLbN6ijzVi2G
 sDRebhVlXfvrdkxWCdy7SNqRt8EsDMVr0f5xCEYRxJiBiUXzHPc3B2Gu2tlJbXcckMeq
 TmhQtwV7YSZMR//BcW1umgkgkzPootFr6IoygHW+z5pQ7ze7oW9CShGv3cSipSXwJdMK Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqe7h2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:43:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 33A2E10002A;
 Fri, 22 Apr 2022 09:43:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2AED521683B;
 Fri, 22 Apr 2022 09:43:16 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 09:43:15 +0200
Message-ID: <e9c7b930-6f88-a928-4aee-0c07d1a7dee4@foss.st.com>
Date: Fri, 22 Apr 2022 09:43:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
 <20220328192520.8.I8052625ddd2a94516d82b9b7472a34ba52fbc2fa@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220328192520.8.I8052625ddd2a94516d82b9b7472a34ba52fbc2fa@changeid>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 8/8] stm32mp: stm32prog: handle
 flashlayout without STM32 image header
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

On 3/28/22 19:25, Patrick Delaunay wrote:
> Accept flashlayout without header in alternate 0, to simplify
> the support of stm32prog command with dfu-util.
> 
> By default the flashlayout file size is the size of the received binary,
> provided with the offset in the DFU alternate.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 65655e25ca..b7111123ba 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -1706,7 +1706,8 @@ static void stm32prog_end_phase(struct stm32prog_data *data, u64 offset)
>  			return;
>  		}
>  #endif
> -		if (parse_flash_layout(data, STM32_DDR_BASE, 0))
> +		log_notice("\nFlashLayout received, size = %lld\n", offset);
> +		if (parse_flash_layout(data, STM32_DDR_BASE, offset))
>  			stm32prog_err("Layout: invalid FlashLayout");
>  		return;
>  	}
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
