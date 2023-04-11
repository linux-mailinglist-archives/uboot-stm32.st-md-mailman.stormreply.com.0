Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD656DD30D
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Apr 2023 08:41:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC21BC03FC3;
	Tue, 11 Apr 2023 06:41:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EA57C03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 06:41:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33B2AlMB024723; Tue, 11 Apr 2023 08:41:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=L3mRiuzNyslD6Nr0u21//pyEh1vZjqyVfWrwDF4jeoQ=;
 b=QGh5rt4JeRK7ffJPuvicz5xF/eq8DeBvsru/fLSekxod/YALbS72zgwnERuz2z8+Z2Qb
 NEknawh0xveT+vfnI5uw5iIElS+Y4mmo5Ww6ctKzWvEVk2s8B0GVgyzV79sIPKzyZbbz
 58yWQ0FoEIYRS2facyHl1bQo1tgkM8d0qsUFqBqswYytgwlSkJnL5NXmlXhU6XcIbHzd
 ecxcn4Nx4abqbRh6sBMAl3Ei2g4wvMAatrkup/4x5uB4HY3LRfRMnC1IbcPjYIQ6hnT/
 Y51os6qVUoy7KxfitmIc3C/3Ug7k1ziZn9EQ1C8QytPYLX7lyFfXPSsa105iVH2n75xE Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ptym3k2g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 08:41:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F20FE10003D;
 Tue, 11 Apr 2023 08:41:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6B3420C8E6;
 Tue, 11 Apr 2023 08:41:30 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 11 Apr
 2023 08:41:30 +0200
Message-ID: <e0dac76e-bd9f-0c9c-168b-47e81206f86c@foss.st.com>
Date: Tue, 11 Apr 2023 08:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230407113657.1.I298af67004d61e65f93e38284ab3895dd7d5dc66@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230407113657.1.I298af67004d61e65f93e38284ab3895dd7d5dc66@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_03,2023-04-06_03,2023-02-09_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp15: increase malloc size
	for pre-reloc
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

On 4/7/23 11:37, Patrick Delaunay wrote:
> The early malloc usage increased so the associated defined
> CONFIG_SYS_MALLOC_F_LEN need to be increased.
> 
> For example, for stm32mp15_defconfig and
> stm32mp157c-dk2-scmi.dtsi, we have:
> 
> Early malloc usage: 280b8 / 80000
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp15_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index 0005e4266441..2676ff381d85 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -1,7 +1,7 @@
>  CONFIG_ARM=y
>  CONFIG_ARCH_STM32MP=y
>  CONFIG_TFABOOT=y
> -CONFIG_SYS_MALLOC_F_LEN=0x20000
> +CONFIG_SYS_MALLOC_F_LEN=0x80000
>  CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0xc0100000
>  CONFIG_ENV_OFFSET=0x480000
>  CONFIG_ENV_SECT_SIZE=0x40000

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
