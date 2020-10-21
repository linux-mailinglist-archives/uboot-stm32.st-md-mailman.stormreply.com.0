Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B163E294BEF
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 13:47:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D7FCC3FAE0;
	Wed, 21 Oct 2020 11:47:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEF38C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 11:47:19 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LBfxrO015884; Wed, 21 Oct 2020 13:47:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=uSkY3h/JiIs6h3DuhWq6zutT/H+a9ZY7ZGaeY2nzzzM=;
 b=Erb0bc6PERM9s3f+SNNg/K6FDTptGlNVvKio0dKTVCoWrkAH7rkRla8YnGqvAD7KXGyA
 jQtM6E/reIDE+19x7hbRiOCqSxv4mz0IYmiIHXUFoOMvRfFG115kPwSruSvJ+N5QbzY+
 KzCw7xoJBXCbdmM2uW1/f3vbL38iB84rQrqzxTz1q9P3EAZ5gm98PHxmPMKGJrP7MY0t
 qjg4NIuJxGQErErLimIu1BVzC9S8rmA71clqsOHgq9Cn5aZ6+B5Ul9ZaTEbmyvE+EHv/
 cFRkhLjKGFN0xQY4gyYDH8M6opRPdQ2gA2NBb2EoaNQhmEogu7A2LFx+v34U0pBDbI1R Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcx1r7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 13:47:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D2789100034;
 Wed, 21 Oct 2020 13:47:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C46342E0856;
 Wed, 21 Oct 2020 13:47:18 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 13:47:18 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 13:47:18 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] configs: stm32mp15: activate CMD_ELF
Thread-Index: AQHWovE73chpnBqSXEmG90iJjEQ5Qqmh2G2A
Date: Wed, 21 Oct 2020 11:47:18 +0000
Message-ID: <1b3b22a3-cca7-302d-7068-f21e1a18efba@st.com>
References: <20201015124634.7419-1-patrick.delaunay@st.com>
In-Reply-To: <20201015124634.7419-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <EDA2C23FD653C845A0C817E7BE193025@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp15: activate CMD_ELF
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

On 10/15/20 2:46 PM, Patrick Delaunay wrote:
> Activate CONFIG_CMD_ELF to accept the command "bootelf".
>
> This patch simplifies the file stm32mp defconfig, as we have
> no reason to deactivate this command.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/stm32mp15_basic_defconfig   | 1 -
>  configs/stm32mp15_trusted_defconfig | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 7b01092b5b..331689ca05 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -30,7 +30,6 @@ CONFIG_SPL_POWER_SUPPORT=y
>  CONFIG_SPL_SPI_FLASH_MTD=y
>  CONFIG_SYS_PROMPT="STM32MP> "
>  CONFIG_CMD_ADTIMG=y
> -# CONFIG_CMD_ELF is not set
>  CONFIG_CMD_ERASEENV=y
>  CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index e8b9a535cf..33e7263366 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -14,7 +14,6 @@ CONFIG_FIT=y
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>  CONFIG_SYS_PROMPT="STM32MP> "
>  CONFIG_CMD_ADTIMG=y
> -# CONFIG_CMD_ELF is not set
>  CONFIG_CMD_ERASEENV=y
>  CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
