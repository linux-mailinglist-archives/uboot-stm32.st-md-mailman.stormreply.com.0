Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D352294BF2
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 13:48:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14758C3FAE0;
	Wed, 21 Oct 2020 11:48:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 944E3C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 11:48:09 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LBm75a029887; Wed, 21 Oct 2020 13:48:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=sJO+J+ixmbG0T+ZP5Jn01XmuiHIisEp5EEe1EP2WDO4=;
 b=gDwapI0l6Y+SuCGrDppCaK84OhQANa9ubUrQTGmdBz1SyGg1+muLJTZyUVdaUIkenSlK
 ZjiRPTU6VlnHKT4d6XiYESLSDE+l80qWnJ82x+7fvAo9/ZVR1CDFjvbXWCUFX9DfYYtR
 s3h/gS/nN2pNBc4arqEvAI7IqOc5Mu4X5zSismPNEvJsxob9alpSYxCQQA5YUTo2CbBW
 R7Rsf4xdfcQf1p4Vgn3jsJoRB/SQcWenjGGIhaD+6g08fMVUFnwYts6zNmpFTyfbcGBi
 6tfD5+zmIXbTxvPKyg22Y1U7DkgGP6etzTjYcCIwcJFzFm4XL3rCsrl/8LE8JYMJhTeb bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347p30succ-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 13:48:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5EBB710002A;
 Wed, 21 Oct 2020 13:48:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54CFB2E1C2E;
 Wed, 21 Oct 2020 13:48:08 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 13:48:08 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 13:48:07 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 2/2] configs: stm32mp15: activate
 CMD_EXPORTENV
Thread-Index: AQHWou8vRMaEwAqTOEuoe9jukAHWuqmh2K2A
Date: Wed, 21 Oct 2020 11:48:07 +0000
Message-ID: <77b976e6-0e55-7f8e-cf98-2be01b2cbd09@st.com>
References: <20201015123152.6923-1-patrick.delaunay@st.com>
 <20201015123152.6923-2-patrick.delaunay@st.com>
In-Reply-To: <20201015123152.6923-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <084AFF1A55DDCE44A13C38EC865F8ECD@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] configs: stm32mp15: activate
 CMD_EXPORTENV
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

On 10/15/20 2:31 PM, Patrick Delaunay wrote:
> Activate CONFIG_CMD_EXPORTENV to accept the command "env export".
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/stm32mp15_basic_defconfig   | 1 -
>  configs/stm32mp15_trusted_defconfig | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index b4cba318fd..7b01092b5b 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -31,7 +31,6 @@ CONFIG_SPL_SPI_FLASH_MTD=y
>  CONFIG_SYS_PROMPT="STM32MP> "
>  CONFIG_CMD_ADTIMG=y
>  # CONFIG_CMD_ELF is not set
> -# CONFIG_CMD_EXPORTENV is not set
>  CONFIG_CMD_ERASEENV=y
>  CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 3a54aeffaf..e8b9a535cf 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -15,7 +15,6 @@ CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>  CONFIG_SYS_PROMPT="STM32MP> "
>  CONFIG_CMD_ADTIMG=y
>  # CONFIG_CMD_ELF is not set
> -# CONFIG_CMD_EXPORTENV is not set
>  CONFIG_CMD_ERASEENV=y
>  CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
