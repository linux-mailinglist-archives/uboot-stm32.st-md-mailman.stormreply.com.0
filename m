Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B7C294BF1
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 13:47:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CE5BC3FAE0;
	Wed, 21 Oct 2020 11:47:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 851E6C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 11:47:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LBlB5X010312; Wed, 21 Oct 2020 13:47:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=U7MjsAwwpf7qBafFeU+zj87RAfvYEW/ScyXihCg3YnA=;
 b=Onrk6JM4jTvBNLM0xUjwCQojdB5gsnLOQOOdBWsfAhItDI+01lm+ZG9EPBx4j5YK7hCg
 ZB01Qs5EfPxwqU2lneDcgD1jCl4ieoqJlWz2U5l7RvYTqLLFgTXWth0WkdaYGBuyLpbB
 7W6gbSnWSdDJ4mJCNkOiVGuozvuzkjMX9B24eXIGbNbWPAxeeBhG03wZYtAqjdJYzD8V
 DIEX3JUqsvO2wnkKv81vH8dgFNOC19/nQt++j4xmgZ9kLSZZAiQ1yl/ZuomcBGqfdOFI
 iR80RDGJcwJm+FtShmsYcqJXlIw7z8fYQ8rMVG1JP79VPwpbk0iw+FVFRGlQg/4MvYsb eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347nr8jry1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 13:47:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39FD3100034;
 Wed, 21 Oct 2020 13:47:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30FD22E0859;
 Wed, 21 Oct 2020 13:47:49 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 13:47:48 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 13:47:48 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 1/2] configs: stm32mp15: activate
 CMD_IMPORTENV
Thread-Index: AQHWou8uIIHTKB+DIkqO/1IUph35/6mh2JYA
Date: Wed, 21 Oct 2020 11:47:48 +0000
Message-ID: <0ca06c33-06bf-9c89-eba9-0681cb8490fc@st.com>
References: <20201015123152.6923-1-patrick.delaunay@st.com>
In-Reply-To: <20201015123152.6923-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <FFC40417AA04034FAFA3C00416946F1D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] configs: stm32mp15: activate
 CMD_IMPORTENV
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
> Activate CONFIG_CMD_IMPORTENV to accept the command "env import".
> This command is useful in script to include some variable.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/stm32mp15_basic_defconfig   | 1 -
>  configs/stm32mp15_trusted_defconfig | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index a8c4112dbe..b4cba318fd 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -32,7 +32,6 @@ CONFIG_SYS_PROMPT="STM32MP> "
>  CONFIG_CMD_ADTIMG=y
>  # CONFIG_CMD_ELF is not set
>  # CONFIG_CMD_EXPORTENV is not set
> -# CONFIG_CMD_IMPORTENV is not set
>  CONFIG_CMD_ERASEENV=y
>  CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 0792884a9d..3a54aeffaf 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -16,7 +16,6 @@ CONFIG_SYS_PROMPT="STM32MP> "
>  CONFIG_CMD_ADTIMG=y
>  # CONFIG_CMD_ELF is not set
>  # CONFIG_CMD_EXPORTENV is not set
> -# CONFIG_CMD_IMPORTENV is not set
>  CONFIG_CMD_ERASEENV=y
>  CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
