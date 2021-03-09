Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0694933271E
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Mar 2021 14:27:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADD48C57B77;
	Tue,  9 Mar 2021 13:27:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D69D5C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:27:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129DQjqM022447; Tue, 9 Mar 2021 14:27:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=klAbysP2YZPhf2qsl5X2mzEGxKQaKGRoCXY3lxJrmu0=;
 b=ghCTqULdNRzUOh1RCoF7FDdXX7jIDvXkQhGop/SWlELboYTDryzZoGqGUDx4XNLkjaIh
 P5eQahEBGnz4g4gIfk/Pi78P2H6sqaUNL7lurZg9O1GEmJo7tKTiaF+r/RU0Dopu80KC
 tk6XuHVcRG3nKpbpRqctPTVjttB4BIKzzdoXM8xaqUv7aqkyquC6AQb+08D7TPXog+Us
 rW901VVoBzuJ89HWjqO6RMO67/30nrIFn0ej4CTius2VUjS3v42alLbJFM4IJ1N1zrEm
 HF94lmyWTZdO3AB1+cmEMgLVyfp467+DUydto0QQO+K7tYt7qp1tmKtdCaIBSSoIahwW mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 374036t3dm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 14:27:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B73A10002A;
 Tue,  9 Mar 2021 14:27:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 815EB25F412;
 Tue,  9 Mar 2021 14:27:18 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Mar
 2021 14:27:17 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210225134305.1.Iec7b40977c201f0a99cbaa730765c4888e950074@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <a5bcbdfb-5892-140f-6f4b-dea74e669d5e@foss.st.com>
Date: Tue, 9 Mar 2021 14:27:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225134305.1.Iec7b40977c201f0a99cbaa730765c4888e950074@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: bsec: manage clock when present
	in device tree
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

On 2/25/21 1:43 PM, Patrick Delaunay wrote:
> Enable the clocks during bsec probe when they are present in device tree.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/bsec.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
> index 88c7aec8b4..fe39bd80cf 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -6,6 +6,7 @@
>  #define LOG_CATEGORY UCLASS_MISC
>  
>  #include <common.h>
> +#include <clk.h>
>  #include <dm.h>
>  #include <log.h>
>  #include <misc.h>
> @@ -490,6 +491,15 @@ static int stm32mp_bsec_probe(struct udevice *dev)
>  {
>  	int otp;
>  	struct stm32mp_bsec_plat *plat;
> +	struct clk_bulk clk_bulk;
> +	int ret;
> +
> +	ret = clk_get_bulk(dev, &clk_bulk);
> +	if (!ret) {
> +		ret = clk_enable_bulk(&clk_bulk);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	/*
>  	 * update unlocked shadow for OTP cleared by the rom code
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
