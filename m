Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7645B87FBB5
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Mar 2024 11:22:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19ED2C6DD69;
	Tue, 19 Mar 2024 10:22:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA354C6B46B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Mar 2024 10:22:40 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42J83Q2H006428; Tue, 19 Mar 2024 11:22:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=AXdtRwfVD/VuseiD6+QEb9S1CsSOrdDJV/3KEdg4IsU=; b=hL
 HK8fY6XTRGiHqDGXggEi5+PlnVG7Z0FrtiKebiklf35+jfsmJhQMq6F91/DiczAY
 nKI37ISnBeAImgfNojO7ogIv4Af+hV/YyyVf7Aq1h7jUL5/6u0CgtJ38tVPjVIK+
 1CXKuNskBSUfRnkqD5+KyVaF3nipkgEMACgIXGwP7yFL4SFPuY9ejeoDeW06Lswc
 4cRvJi4BUr6AqSNFSqKVCtD1qHpFHUGuy9Dm+0vj3EpAEjoZ3AhQMMsfEFhNnwfO
 kSAO9eGhOiFU/GqslYXpCDO3qPzkM3QNshPdDZ5dydHvVjZZy53sdBMRkxDRl/Vg
 JIKYNYVKxND/sypzZtgg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ww1qkv2k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2024 11:22:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5246040046;
 Tue, 19 Mar 2024 11:22:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8175E24C45C;
 Tue, 19 Mar 2024 11:22:05 +0100 (CET)
Received: from [10.201.20.71] (10.201.20.71) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Mar
 2024 11:22:05 +0100
Message-ID: <f2ab30e8-e65a-4025-a203-639d7ff1b01e@foss.st.com>
Date: Tue, 19 Mar 2024 11:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240319024430.103196-1-marex@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240319024430.103196-1-marex@denx.de>
X-Originating-IP: [10.201.20.71]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_12,2024-03-18_03,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Default dfu_alt_info for
	STM32MP13xx SPI NOR
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



On 3/19/24 03:44, Marek Vasut wrote:
> Define dfu_alt_info with SPI NOR layout to make it easy to
> install or update bootloader in the SPI NOR using dfu-util.
> 
> Use the following U-Boot commands to start DFU mode:
> "
> => sf probe && dfu 0 mtd
> "
> 
> Use the following dfu-util invocation on Host PC to install binaries:
> "
> $ dfu-util -w -a 0 -D build/stm32mp1/release/tf-a-stm32mp135f-dhcor-dhsbc.stm32
> $ dfu-util -w -a 1 -D build/stm32mp1/release/tf-a-stm32mp135f-dhcor-dhsbc.stm32
> $ dfu-util -w -a 2 -D build/stm32mp1/release/fip.bin
> "
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  include/configs/stm32mp13_common.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/configs/stm32mp13_common.h b/include/configs/stm32mp13_common.h
> index 5b0658ced92..d6e4f8fd915 100644
> --- a/include/configs/stm32mp13_common.h
> +++ b/include/configs/stm32mp13_common.h
> @@ -63,6 +63,7 @@
>  	"fi;\0"
>  
>  #define STM32MP_EXTRA \
> +	"dfu_alt_info=mtd nor0=fsbl1 raw 0x0 0x40000;fsbl2 raw 0x40000 0x40000;uboot raw 0x80000 0x160000\0" \
>  	"env_check=if env info -p -d -q; then env save; fi\0" \
>  	"boot_net_usb_start=true\0"
>  


Hi Marek

On our STM32 board, the dfu_alt_info is build dynamically, we have CONFIG_SET_DFU_ALT_INFO enable 
Can you add the dfu_alt_info in a specific stm32mp13_dhxx.common.h instead ?

Thanks
Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
