Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6A952E510
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 08:32:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFCC1C56630;
	Fri, 20 May 2022 06:32:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37011C5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 06:32:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K1ACZA022471;
 Fri, 20 May 2022 08:32:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=kXFsONcV+sH+i6c1xtInvNqaKP8uilT/x4dDPFd/15g=;
 b=SX+VJBfjxs3cBWvVLvnxnsaNSkZUWTz5/SNKM1v/E40HhA5ZU8tyXpq0x2b/WiYMw3ES
 BGf7ErgVnyc5LkM7BGClB90pl6HsuMCTVHNYq2DQDYXLadojiIDmK+yF6ongTeSZimH7
 9y3HovhGJn3B+GhR1LPB775Olo1cXBqWDVnLG1suJMAsuzy7JuJNWLaY7ADSoopWUnHN
 jTA0u7i5hEvGO6eyJ08MW16TTu3Bz+rQaAZWHZL+sneUPOsm8HFqVJ4Dkt5rd1tvrnCz
 DMALmVZ4gG+ig8StkRMuv5eQy0xJyMb9FvDJz3frEih4qcHGnkPvrLbCi8Oa7w80uF5T jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j9eg61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:32:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 74ACE10002A;
 Fri, 20 May 2022 08:32:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AB39211F17;
 Fri, 20 May 2022 08:32:02 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 08:32:02 +0200
Message-ID: <7679de3a-095f-b4cd-34ef-996961268e36@foss.st.com>
Date: Fri, 20 May 2022 08:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.2.Iea6a315c629bbbb6cbc18889a2207a465acb9bcc@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220506160540.2.Iea6a315c629bbbb6cbc18889a2207a465acb9bcc@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 02/16] configs: stm32mp1: move SUPPORT_SPL
	in STM32MP15x
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

On 5/6/22 16:06, Patrick Delaunay wrote:
> The SPL is only supported by STM32MP15x not by all the
> SOC with STM32MP arch.
> Only TFABOOT is supported in next products.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/Kconfig              | 1 -
>  arch/arm/mach-stm32mp/Kconfig | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 57946f61fa..82d6274c92 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1939,7 +1939,6 @@ config ARCH_STM32MP
>  	select OF_SYSTEM_SETUP
>  	select PINCTRL
>  	select REGMAP
> -	select SUPPORT_SPL
>  	select SYSCON
>  	select SYSRESET
>  	select SYS_THUMB_BUILD
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index e48f98ba29..be0d74b4ac 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -46,6 +46,7 @@ config STM32MP15x
>  	select STM32_RCC
>  	select STM32_RESET
>  	select STM32_SERIAL
> +	select SUPPORT_SPL
>  	select SYS_ARCH_TIMER
>  	imply CMD_NVEDIT_INFO
>  	help
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
