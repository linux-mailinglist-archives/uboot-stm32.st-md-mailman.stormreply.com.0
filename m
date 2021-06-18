Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5A53AC47C
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 09:02:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 404F3C59780;
	Fri, 18 Jun 2021 07:02:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F648C58D5D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 07:02:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I6ugNT009425; Fri, 18 Jun 2021 09:02:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=BPMXVmHjQhL6wsJwdMaeIgyKZraDqckmqSXW6UyGhoI=;
 b=XUD81GHYi/8Up/I1Om7pIGXZHqYMQU59IcRhGVxlC5stxQP/Sgmk5X/BCeq4y2OGekST
 hgPCAn6VjTOmIj61RHQ8pLD3AfuyKl28lQILQYwYvNtcc6j7GcMW879VN2gCI5M/WhAU
 ApWNTbQoTbtwxEFWIaQM2HwkvwyDoldWRLfucYe5d/jZ02Vany4ZcXZT7CkAyNhNwkXL
 75rW7Hff4Pu61yqV7sKV/EUjDbFeIRrRwq3XSfnmE/KIXPQpPIo5eI9sv8LmzrcuGQ1o
 woNq1TpmzFyENlsbH4T9pjspSVjU4ISVCtLB+Uym85ejvdoKRDTU1g5DY4aEWmFtI/W+ zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3984bm5r72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:02:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B65310002A;
 Fri, 18 Jun 2021 09:02:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1BF6C217B6C;
 Fri, 18 Jun 2021 09:02:45 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 09:02:44 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210604183014.1.Idaeedfa2eaab3b76ec60a985d8f3625b803564b8@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <a0725931-fc29-ff2b-8768-84699e086301@foss.st.com>
Date: Fri, 18 Jun 2021 09:02:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604183014.1.Idaeedfa2eaab3b76ec60a985d8f3625b803564b8@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@dh-electronics.com,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: correct the property
	name for eth
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

It seems that my previous reviewed-by of this patch encountered an issue, so do it again.

On 6/4/21 6:30 PM, Patrick Delaunay wrote:
> Use the correct name for STMicroelectronics phys config properties,
> replace '_' by '-':
>   "st,eth_clk_sel" => "st,eth-clk-sel"
>   "st,eth-ref-clk-sel" => st,eth-clk-sel"
> 
> These property name are aligned with the upstreamed Linux kernel binding:
>  linux/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> 
> See Linux kernel commit "dt-bindings: net: stmmac: add phys config
> properties" merged in v5.1-rc1.
> 
> This patch allow to reuse the kernel device tree directly in U-Boot.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/dhelectronics/dh_stm32mp1/board.c | 4 ++--
>  board/st/stm32mp1/stm32mp1.c            | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index ac1af718d4..d7c1857c16 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -660,11 +660,11 @@ int board_interface_eth_init(struct udevice *dev,
>  	bool eth_ref_clk_sel_reg = false;
>  
>  	/* Gigabit Ethernet 125MHz clock selection. */
> -	eth_clk_sel_reg = dev_read_bool(dev, "st,eth_clk_sel");
> +	eth_clk_sel_reg = dev_read_bool(dev, "st,eth-clk-sel");
>  
>  	/* Ethernet 50Mhz RMII clock selection */
>  	eth_ref_clk_sel_reg =
> -		dev_read_bool(dev, "st,eth_ref_clk_sel");
> +		dev_read_bool(dev, "st,eth-ref-clk-sel");
>  
>  	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
>  
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 261ec15e1b..18b8870269 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -733,11 +733,11 @@ int board_interface_eth_init(struct udevice *dev,
>  	bool eth_ref_clk_sel_reg = false;
>  
>  	/* Gigabit Ethernet 125MHz clock selection. */
> -	eth_clk_sel_reg = dev_read_bool(dev, "st,eth_clk_sel");
> +	eth_clk_sel_reg = dev_read_bool(dev, "st,eth-clk-sel");
>  
>  	/* Ethernet 50Mhz RMII clock selection */
>  	eth_ref_clk_sel_reg =
> -		dev_read_bool(dev, "st,eth_ref_clk_sel");
> +		dev_read_bool(dev, "st,eth-ref-clk-sel");
>  
>  	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
>  
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
