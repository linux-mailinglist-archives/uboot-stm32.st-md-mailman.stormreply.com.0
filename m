Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EF6332606
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Mar 2021 14:05:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73972C57195;
	Tue,  9 Mar 2021 13:05:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 134FBC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:05:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129CuMDr020515; Tue, 9 Mar 2021 14:05:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=CaxJP77lEXK/uRfqHG15aVcFfIzfW6DNrz+W/eikaAE=;
 b=NelLdFy9VI81DVLAHeskVuOEaZI+fmd0xAUihCY5qrt4z92I+p1ggsI2P4JDWglMorHg
 +AOFxVQrN/D648nS1U74bQsPYt6CucQ9iR4ou3Yg71hkXeIP3l1R6CM7ZQRyI3hbVgN3
 wlmyVHcO632h7E8UciiVwi2gmL+adY3Z8ycJ9UVG/P8g7vjeh2fLNtGwPtUCh3nZTgTm
 MslLLzeXZsNDT7zc8fAa5ktqoxHTrnot0b1nYXVQS1k2yC0eI9Q6o5zY0Vz9ghHzwet8
 dMTO2lwnn/63gqLt+4rPYSsWQchjuem5x0vqNyhBuomD+W18ekIuMmTJCu4Rh9v3jhVO Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741y6scr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 14:05:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6ADEF10002A;
 Tue,  9 Mar 2021 14:05:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62116258C64;
 Tue,  9 Mar 2021 14:05:19 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Mar
 2021 14:05:18 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
 <20210224111907.6.Id6e8c7bc7b812ba39f50a9c331684c942745d483@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <64582a9a-77dc-16c1-30f1-6e292f083e0f@foss.st.com>
Date: Tue, 9 Mar 2021 14:05:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224111907.6.Id6e8c7bc7b812ba39f50a9c331684c942745d483@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 6/6] configs: stm32mp1_trusted_defconfig
 rely on SCMI support
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

On 2/24/21 11:19 AM, Patrick Delaunay wrote:
> Enable SCMI clock and reset domain support for stm32mp1 platform
> and ARM SMC mailbox driver used as communication channel for
> SCMI messages between non-secure world and secure SCMI server.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp15_trusted_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index da31b74cde..e1746332e6 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -51,6 +51,7 @@ CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  CONFIG_STM32_ADC=y
> +CONFIG_CLK_SCMI=y
>  CONFIG_SET_DFU_ALT_INFO=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
> @@ -107,6 +108,7 @@ CONFIG_DM_REGULATOR_GPIO=y
>  CONFIG_DM_REGULATOR_STM32_VREFBUF=y
>  CONFIG_DM_REGULATOR_STPMIC1=y
>  CONFIG_REMOTEPROC_STM32_COPRO=y
> +CONFIG_RESET_SCMI=y
>  CONFIG_DM_RNG=y
>  CONFIG_RNG_STM32MP1=y
>  CONFIG_DM_RTC=y
> 



Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
