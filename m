Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD94211C9D
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:24:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14923C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:24:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0E8FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:24:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627J9Ur018957; Thu, 2 Jul 2020 09:24:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=klmS0agiIRmgsZI25cOo6yhY/Y1Fu92X7+pEGV++Cps=;
 b=Z/BVRZFy6/Jhrz7mRE8/pJTXRYWTNPt05kpi/P3wKHOXWwLcBIpDOMOBv5zYhlBiUvF1
 GrYKimo5TlmCXzEqwhDu0IKeS59qcfSbccXbCXO3I1pjCtYig+EV7a13IPEMV8dTy2/Y
 aLsYLz0VP2URRSCcrFi03oCWsCTTvkZTUDrnzu2ZZjTSH9bE7x3pS5CRk6nj3kw6bsMV
 oRAFtiplFvJxcwTZV3cj2kH+B47iZh4cosLht4SFM18TH4lGme3PBFYZWVvB0VaUiA5W
 mkf7ukXcHpvxRXioLcSUPapCBxUEwcZ7F/ooKM4s34OKzbkP695Toj08Jey5tU25IMcn Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0gefvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:24:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A1F510002A;
 Thu,  2 Jul 2020 09:24:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F3E521CA9A;
 Thu,  2 Jul 2020 09:24:22 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:24:21 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:24:21 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] stm32mp1: configs: activate CMD_ERASEENV
Thread-Index: AQHWQvbpD9UBR3EnwE+8GljF8D5KHajz3CaA
Date: Thu, 2 Jul 2020 07:24:21 +0000
Message-ID: <2c58bdd0-4f17-54eb-54d4-c402c463e638@st.com>
References: <20200615092513.25686-1-patrick.delaunay@st.com>
In-Reply-To: <20200615092513.25686-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <0B92A13F5C05074FA113CE2D9A8534F1@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: configs: activate CMD_ERASEENV
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

On 6/15/20 11:25 AM, Patrick Delaunay wrote:
> Activate the command env erase to reset the environment with the command:
>> env erase
> it is simpler than:
>> env default -a
>> env save
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/stm32mp15_basic_defconfig   | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 31597dbc40..4a2ecc00b9 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -26,6 +26,7 @@ CONFIG_SYS_PROMPT="STM32MP> "
>  # CONFIG_CMD_ELF is not set
>  # CONFIG_CMD_EXPORTENV is not set
>  # CONFIG_CMD_IMPORTENV is not set
> +CONFIG_CMD_ERASEENV=y
>  CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y
>  CONFIG_SYS_MEMTEST_START=0xc0000000
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index b7ff4b2aec..17d174c2f3 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -14,6 +14,7 @@ CONFIG_SYS_PROMPT="STM32MP> "
>  # CONFIG_CMD_ELF is not set
>  # CONFIG_CMD_EXPORTENV is not set
>  # CONFIG_CMD_IMPORTENV is not set
> +CONFIG_CMD_ERASEENV=y
>  CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y
>  CONFIG_SYS_MEMTEST_START=0xc0000000

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
