Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9532F4D95E8
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Mar 2022 09:07:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FA72C60467;
	Tue, 15 Mar 2022 08:07:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA85CC60464
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Mar 2022 08:07:16 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22F4JLPG009708;
 Tue, 15 Mar 2022 09:07:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wiICd2OyYwUU4FqZbp3eKHiLFY69gpr4IF59apAJ334=;
 b=YHlIUB2IvGVJVeuA1RM6ijYsKfwXp0RgmFlVaZq0zxI826sdSf+Mo0tRg9MDq0w9lKqx
 ODQZHFmmckVzR4N82ERfzpVSv66wMn+W4zjioezv6pYH3b5WS7S8WJ0I4LgGw+knHvS2
 m43HulqHXsKpTunjZhEmFSp9pa4BmyU05QRcLHuzT1/21sSgInCfCEuDa2D4clIFHiYZ
 0mqF3RWvo9dh4ezLQFI7vx81sCUfKrRDaYsidS4zVDy36HjI3efVxtuwEo18lhNXofsZ
 YTE8CZRgEzSiLcb65ZU9SHcw/KkkNiJiPe9kLWPk7rEwYlydoXOhy7MYslTFye1prYG4 sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et63h4sdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 09:07:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4DADD10002A;
 Tue, 15 Mar 2022 09:07:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 468A62128B6;
 Tue, 15 Mar 2022 09:07:15 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 15 Mar
 2022 09:07:14 +0100
Message-ID: <fd06f21f-e3aa-6c64-2764-d143a6dfd95a@foss.st.com>
Date: Tue, 15 Mar 2022 09:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>, <u-boot@lists.denx.de>
References: <20220222163849.77875-1-christophe.kerello@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220222163849.77875-1-christophe.kerello@foss.st.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] mtd: rawnand: stm32_fmc2: add NAND Write
	Protect support
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

Hi Christophe

On 2/22/22 17:38, Christophe Kerello wrote:
> This patch adds the support of the WP# signal. WP will be disabled
> before the first access to the NAND flash.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
> 
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index eee65949d77..fb3279b405e 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -12,6 +12,7 @@
>  #include <log.h>
>  #include <nand.h>
>  #include <reset.h>
> +#include <asm/gpio.h>
>  #include <dm/device_compat.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> @@ -149,6 +150,7 @@ struct stm32_fmc2_timings {
>  struct stm32_fmc2_nand {
>  	struct nand_chip chip;
>  	struct stm32_fmc2_timings timings;
> +	struct gpio_desc wp_gpio;
>  	int ncs;
>  	int cs_used[FMC2_MAX_CE];
>  };
> @@ -824,6 +826,9 @@ static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc, ofnode node)
>  		nand->cs_used[i] = cs[i];
>  	}
>  
> +	gpio_request_by_name_nodev(node, "wp-gpios", 0, &nand->wp_gpio,
> +				   GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE);
> +
>  	nand->chip.flash_node = node;
>  
>  	return 0;
> @@ -972,6 +977,10 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
>  	chip->ecc.size = FMC2_ECC_STEP_SIZE;
>  	chip->ecc.strength = FMC2_ECC_BCH8;
>  
> +	/* Disable Write Protect */
> +	if (dm_gpio_is_valid(&nand->wp_gpio))
> +		dm_gpio_set_value(&nand->wp_gpio, 0);
> +
>  	ret = nand_scan_ident(mtd, nand->ncs, NULL);
>  	if (ret)
>  		return ret;

Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
