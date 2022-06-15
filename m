Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D15F54C27A
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Jun 2022 09:12:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DDE7C0D2BC;
	Wed, 15 Jun 2022 07:12:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0209C03FDD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 07:12:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EKbZOP008429;
 Wed, 15 Jun 2022 09:11:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=EE5LbKf7MBWg+iyWQzD9UeT8au5Ar1VQUiLw/KqTI5k=;
 b=omp4ip60sSzASMQSI1u7tKHMaSBWf+moLSMbNV9vTapmeCkxe59lyJlfclU9ehGQrvba
 u1g6pmKLrDYJgzBEOxFnfBRkxCiqp1AjhmGegfj98Dtrv6dPCeqG2P7PZ3LwMfqI9qLj
 uAb3H+WEu+AovHAWzcj4qNQV7a4WitThBpqF0PVk43mASzqGkaRnyDmI3OCUAxBlTJvP
 7LfcTDJI1sdId6+9LY4bIjhL66TIYVaO+npGQEfcRQGYmL3UFlwALyia3f+ecC/P78Ng
 TfZ8nxn4EUwsZuixWQ4Z0i6YNHPOY4uCUD6ft1MxWRg+6+8DCj11tFruQT+HdyYHAdDI +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gp2uhebn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jun 2022 09:11:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C791710002A;
 Wed, 15 Jun 2022 09:11:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BBB33210F6F;
 Wed, 15 Jun 2022 09:11:51 +0200 (CEST)
Received: from [10.201.20.162] (10.201.20.162) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 15 Jun
 2022 09:11:51 +0200
Message-ID: <63a2485e-27f8-5936-5dcd-86d0bc83d5c7@foss.st.com>
Date: Wed, 15 Jun 2022 09:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220606160414.v1.1.I4f6455f026820524103f7fbdffaafd3b75585197@changeid>
 <20220606160414.v1.2.Ida901b98d25a7f60b6fb05d18f2e030d9c9ecc5c@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220606160414.v1.2.Ida901b98d25a7f60b6fb05d18f2e030d9c9ecc5c@changeid>
X-Originating-IP: [10.201.20.162]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_03,2022-06-13_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] ARM: stm32: activate OF_LIVE for
	DHSOM
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

Hi PAtrick

On 6/6/22 16:04, Patrick Delaunay wrote:
> Activate the live DT with CONFIG_OF_LIVE to reduce the DT parsing
> time.
> 
> Tested-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v1:
> - previously sent as RFC, Tested by Marek
>   http://patchwork.ozlabs.org/project/uboot/list/?series=301157
> 
>  configs/stm32mp15_dhcom_basic_defconfig | 1 +
>  configs/stm32mp15_dhcor_basic_defconfig | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
> index ca3873c7e6..f91bc173d5 100644
> --- a/configs/stm32mp15_dhcom_basic_defconfig
> +++ b/configs/stm32mp15_dhcom_basic_defconfig
> @@ -72,6 +72,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=nor0:256k(fsbl1),256k(fsbl2),1408k(uboot),64k(
>  # CONFIG_SPL_DOS_PARTITION is not set
>  # CONFIG_ISO_PARTITION is not set
>  # CONFIG_SPL_PARTITION_UUIDS is not set
> +CONFIG_OF_LIVE=y
>  CONFIG_OF_LIST="stm32mp15xx-dhcom-pdk2 stm32mp15xx-dhcom-drc02 stm32mp15xx-dhcom-picoitx"
>  CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
>  CONFIG_ENV_IS_IN_SPI_FLASH=y
> diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
> index 4e70566e3f..b19033bdaa 100644
> --- a/configs/stm32mp15_dhcor_basic_defconfig
> +++ b/configs/stm32mp15_dhcor_basic_defconfig
> @@ -70,6 +70,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=nor0:256k(fsbl1),256k(fsbl2),1408k(uboot),64k(
>  # CONFIG_SPL_DOS_PARTITION is not set
>  # CONFIG_ISO_PARTITION is not set
>  # CONFIG_SPL_PARTITION_UUIDS is not set
> +CONFIG_OF_LIVE=y
>  CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
>  CONFIG_ENV_IS_IN_SPI_FLASH=y
>  CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
