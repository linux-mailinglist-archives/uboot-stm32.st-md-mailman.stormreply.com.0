Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72033E1595
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 11:17:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A99FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 09:17:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55CD0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 09:17:02 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9N9G8U6005574; Wed, 23 Oct 2019 11:17:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=moION03jv4XSPYe6heOsYzlO2MuhYDM+fobw9lzcw0U=;
 b=BSZEui2mGHTjNbNtLmwkNaBf2nlvd7KMolqShGPDXcjvdkYHU67Nshn7rZ6klNSXTRVz
 RFCfpGaUn8NARHuBqWw/Q3SIBEfLCWFr3YrRB4uU4jGvI1c1IDxFcvB95NS58FUuz3KU
 Pr8F8DKxzMo1RS3k28F5uWFRbbrZM9OcPCShLJKA5E+7GbOzyWtswRXBHjv5nRV003Up
 HRB6COuTn1IkG4UtP7UuBLw4TU/lldHnkCDjp9uQIKOr+rHyLyxjkE61fv/10B9aDt45
 w2GKAZw9Bbg6De058GSaWxm8eNAOeJZtD22FIcBqD8WjGmfEo8M3SqedbMdf7FgzAlqS NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s1jncq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 11:17:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3272D10002A;
 Wed, 23 Oct 2019 11:17:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A5302B358B;
 Wed, 23 Oct 2019 11:17:00 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 23 Oct
 2019 11:16:59 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 23 Oct 2019 11:16:59 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v3 13/15] stm32mp1: configs: activate
 CONFIG_MTD_SPI_NAND
Thread-Index: AQHViYKf1kb0ZTIuhU6a73V28KBvFw==
Date: Wed, 23 Oct 2019 09:16:59 +0000
Message-ID: <87b020f3-6910-867b-7cdc-1395e15914e0@st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
 <20191014072812.21843-14-patrick.delaunay@st.com>
In-Reply-To: <20191014072812.21843-14-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <18C04C9E9EC067419B8B8343B5612D17@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_02:2019-10-22,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 13/15] stm32mp1: configs: activate
 CONFIG_MTD_SPI_NAND
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

On 10/14/19 9:28 AM, Patrick Delaunay wrote:
> Activate the support of SPI NAND in stm32mp1 U-Boot.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  configs/stm32mp15_basic_defconfig   | 1 +
>  configs/stm32mp15_optee_defconfig   | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index cd4fc20ca5..699e687891 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -86,6 +86,7 @@ CONFIG_STM32_SDMMC2=y
>  CONFIG_MTD=y
>  CONFIG_NAND=y
>  CONFIG_NAND_STM32_FMC2=y
> +CONFIG_MTD_SPI_NAND=y
>  CONFIG_DM_SPI_FLASH=y
>  CONFIG_SPI_FLASH=y
>  CONFIG_SPI_FLASH_MACRONIX=y
> diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
> index 8d3d2e8508..387de0ad35 100644
> --- a/configs/stm32mp15_optee_defconfig
> +++ b/configs/stm32mp15_optee_defconfig
> @@ -73,6 +73,7 @@ CONFIG_STM32_SDMMC2=y
>  CONFIG_MTD=y
>  CONFIG_NAND=y
>  CONFIG_NAND_STM32_FMC2=y
> +CONFIG_MTD_SPI_NAND=y
>  CONFIG_DM_SPI_FLASH=y
>  CONFIG_SPI_FLASH=y
>  CONFIG_SPI_FLASH_MACRONIX=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 8da8c4e22a..29c23c634d 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -72,6 +72,7 @@ CONFIG_STM32_SDMMC2=y
>  CONFIG_MTD=y
>  CONFIG_NAND=y
>  CONFIG_NAND_STM32_FMC2=y
> +CONFIG_MTD_SPI_NAND=y
>  CONFIG_DM_SPI_FLASH=y
>  CONFIG_SPI_FLASH=y
>  CONFIG_SPI_FLASH_MACRONIX=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
