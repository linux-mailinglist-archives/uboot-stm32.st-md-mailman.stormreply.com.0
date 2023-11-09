Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB77E643A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Nov 2023 08:19:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D0D6C6B479;
	Thu,  9 Nov 2023 07:19:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EE2BC6B463
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Nov 2023 07:19:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A96HaoD030948; Thu, 9 Nov 2023 08:19:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=nYZkl3QzPYC+gQn8TPR8K6f3YnsMeOqZlEkptwX6VWU=; b=3n
 7iSHWp0uMn+A7L7RAjCcDxaZYZwXs4XlaT5wgyzEvVCETMiNb5wcN5yw4JvTVFox
 jugDubJyrpVMHr5hYaAjyxe6POrjw0YgcNP/SUoQ6/v2iyqEtIDSIX4S/plxi+2L
 W0f2+Ck74zxRfGdZPq/7NZE7XOAIjvwlAAWhTCnysX8JR4c95w7fvA6FAjnZLFno
 ADGXF8dvWSVN1RjyUn8+yffd6NzNyvde7u9XoytEbbqfuLLMcrm81sZbjpvLxPUx
 t/mJfHczkHhT/mBKzH5TM9IVpepnLZJB5vx4Hppmpl41ZO7RbPW0olfg8apAzCBY
 LtLkIN7N0tDxLPb29xMg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u7w26eyu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Nov 2023 08:19:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4676F10005A;
 Thu,  9 Nov 2023 08:18:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CB9420B861;
 Thu,  9 Nov 2023 08:18:50 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 9 Nov
 2023 08:18:49 +0100
Message-ID: <d660dfd1-fa0e-45de-9398-9407e13599de@foss.st.com>
Date: Thu, 9 Nov 2023 08:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20231104163203.117382-1-marex@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20231104163203.117382-1-marex@denx.de>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_05,2023-11-08_01,2023-05-22_02
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 1/2] arm: stm32: Enable TCP, IPv6,
 wget on DH STM32MP15 DHSOM
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



On 11/4/23 17:31, Marek Vasut wrote:
> Enable support for TCP protocol, wget, and IPv6 on this platform.
> The former two allow users download payload into the U-Boot from
> a web server, which may be more convenient or easier to set up
> than TFTP server. The later is enabled to future proof the IP
> stack on this platform.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andreas Geisreiter <ageisreiter@dh-electronics.de>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  configs/stm32mp15_dhcom_basic_defconfig | 5 +++++
>  configs/stm32mp15_dhcor_basic_defconfig | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
> index b6cd0a47fa7..08aac878f8e 100644
> --- a/configs/stm32mp15_dhcom_basic_defconfig
> +++ b/configs/stm32mp15_dhcom_basic_defconfig
> @@ -76,7 +76,10 @@ CONFIG_CMD_REMOTEPROC=y
>  CONFIG_CMD_SPI=y
>  CONFIG_CMD_USB=y
>  CONFIG_CMD_USB_MASS_STORAGE=y
> +CONFIG_CMD_DHCP6=y
> +CONFIG_CMD_TFTPPUT=y
>  CONFIG_SYS_DISABLE_AUTOLOAD=y
> +CONFIG_CMD_WGET=y
>  CONFIG_CMD_BOOTCOUNT=y
>  CONFIG_CMD_CACHE=y
>  CONFIG_CMD_TIME=y
> @@ -101,6 +104,8 @@ CONFIG_IP_DEFRAG=y
>  CONFIG_TFTP_TSIZE=y
>  CONFIG_USE_SERVERIP=y
>  CONFIG_SERVERIP="192.168.1.1"
> +CONFIG_PROT_TCP_SACK=y
> +CONFIG_IPV6=y
>  CONFIG_STM32_ADC=y
>  CONFIG_SPL_BLOCK_CACHE=y
>  CONFIG_BOOTCOUNT_LIMIT=y
> diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
> index d1acf9c657e..8cd6924b580 100644
> --- a/configs/stm32mp15_dhcor_basic_defconfig
> +++ b/configs/stm32mp15_dhcor_basic_defconfig
> @@ -74,7 +74,10 @@ CONFIG_CMD_REMOTEPROC=y
>  CONFIG_CMD_SPI=y
>  CONFIG_CMD_USB=y
>  CONFIG_CMD_USB_MASS_STORAGE=y
> +CONFIG_CMD_DHCP6=y
> +CONFIG_CMD_TFTPPUT=y
>  CONFIG_SYS_DISABLE_AUTOLOAD=y
> +CONFIG_CMD_WGET=y
>  CONFIG_CMD_BOOTCOUNT=y
>  CONFIG_CMD_CACHE=y
>  CONFIG_CMD_TIME=y
> @@ -99,6 +102,8 @@ CONFIG_IP_DEFRAG=y
>  CONFIG_TFTP_TSIZE=y
>  CONFIG_USE_SERVERIP=y
>  CONFIG_SERVERIP="192.168.1.1"
> +CONFIG_PROT_TCP_SACK=y
> +CONFIG_IPV6=y
>  CONFIG_STM32_ADC=y
>  CONFIG_SPL_BLOCK_CACHE=y
>  CONFIG_BOOTCOUNT_LIMIT=y

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
