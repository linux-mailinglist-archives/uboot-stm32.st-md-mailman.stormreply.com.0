Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA767E7C78
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Nov 2023 14:21:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4AF9C6B44F;
	Fri, 10 Nov 2023 13:21:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3FE4C6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 13:20:59 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AA9g8pV021377; Fri, 10 Nov 2023 14:20:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=08Px2yHn1n4XiOSf4vTGkdnV3tGFEmuKW0BXcRpbeoQ=; b=WP
 0tyF966aIW2Gf7odEr4lhVH02FtztxkzSHYQRN55GGfWKsSLhnxTYtlUypRaFFEB
 QdlXTvnVTfZxn5DJKrm0+FdEtakRp6Elo9Yn3mzvt+WzXV9kiMRv592ZlMbjIkF5
 Kn0jBkUk9jQy8LxFF+v3IJ9MHbEwViTXfxqTuEc/SDts1lKdwdhiGjgB09x7CWK8
 Z2VnmMOOCbt7SIkH59IoPraWC5+lUH9ONP6R+6YOLjvuc3QchyrMdEB8/beWC6+q
 9/QGg5w6zHPRyRLClRF80rrP5VSCUoh+Jc/carqvYIquUsePiTrckWoE9nPNeysm
 4AqGnbu3cF03h56T//Zw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u84a5n1g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 14:20:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F06A0100056;
 Fri, 10 Nov 2023 14:20:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA54725E53C;
 Fri, 10 Nov 2023 14:20:57 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 10 Nov
 2023 14:20:57 +0100
Message-ID: <fddd0f87-8f12-448e-896c-685f93320cf1@foss.st.com>
Date: Fri, 10 Nov 2023 14:20:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
 <20231027144304.1002307-4-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20231027144304.1002307-4-patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_10,2023-11-09_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v1 3/9] stm32mp: dram_init: Fix AARCH64
 compilation warnings
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



On 10/27/23 16:42, Patrice Chotard wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> When building with AARCH64 defconfig, we got warnings for debug
> message
> - format '%x' expects argument of type 'unsigned int',
>    but argument 3 has type 'size_t' {aka 'long unsigned int'}).
> - format '%lx' expects argument of type 'long unsigned int',
>   but argument 2 has type 'phys_addr_t' {aka 'long long unsigned
>   int'}
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/dram_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
> index a1e77a42e4f..cb35ed60ca1 100644
> --- a/arch/arm/mach-stm32mp/dram_init.c
> +++ b/arch/arm/mach-stm32mp/dram_init.c
> @@ -36,7 +36,7 @@ int dram_init(void)
>  		log_debug("Cannot get RAM size: %d\n", ret);
>  		return ret;
>  	}
> -	log_debug("RAM init base=%lx, size=%x\n", ram.base, ram.size);
> +	log_debug("RAM init base=%p, size=%zx\n", (void *)ram.base, ram.size);
>  
>  	gd->ram_size = ram.size;
>  
Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
