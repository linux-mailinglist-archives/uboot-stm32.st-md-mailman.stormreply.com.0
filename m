Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ADB3942EA
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 May 2021 14:46:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D0ACC57189;
	Fri, 28 May 2021 12:46:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C454C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 12:46:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SCcR7V016178; Fri, 28 May 2021 14:46:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=k4LayCACpqeM0kdgMbelL6sgieADfvL93V4lacyq8nQ=;
 b=8WcKVUbFBCYx22ilm35WjQO+2fdJj8i2ZgyZyApkI9NBbmTnGOq6MHmJNfCN8lpxAW1t
 4kOv/10G1l952VQluive/KDT1J/IzGPvfwtmiKk6ht20csBsDWC1ztZxMhbVuyjz9yag
 PfbKpxk4/VCB9NP2covDshr8O3XmOELbsxg0PviYmgFJgW+sOjvYorHYZCaaj2O+ywt4
 nfFi7JFnOQpd/HqBdoitbTJan8+rQab62P0iFCwOeXOAe8TCEruLqyvUZ5foH6TJ5Vfz
 bDvXMEJ+VyE2q1SBno+2WY/XLhCzJfPCTauAvhKq/28+8mxWmd6UdAwhNzGz6WNa90AK cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38u03c0751-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 14:46:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 85EC810002A;
 Fri, 28 May 2021 14:46:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B7B7226FAD;
 Fri, 28 May 2021 14:46:19 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 14:46:18 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20210506093041.1.I0019059e1020cfe0079e48d563acf59c0d6f0a1e@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <66ade021-9761-564e-0c11-132ed513f28a@foss.st.com>
Date: Fri, 28 May 2021 14:46:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210506093041.1.I0019059e1020cfe0079e48d563acf59c0d6f0a1e@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp: Enable UNZIP on
 STMicroelectronics stm32mp15 boards
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

On 5/6/21 9:31 AM, Patrick Delaunay wrote:
> The CMD_UNZIP provides the 'gzwrite' command, which is convenient
> for writing e.g. gz-compressed images to eMMC from U-Boot.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp15_basic_defconfig   | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index d7511a79a5..0c892dda8b 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -38,6 +38,7 @@ CONFIG_CMD_ERASEENV=y
>  CONFIG_CMD_NVEDIT_EFI=y
>  CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y
> +CONFIG_CMD_UNZIP=y
>  CONFIG_CMD_ADC=y
>  CONFIG_CMD_CLK=y
>  CONFIG_CMD_DFU=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index ee89a47171..f7aa571e8d 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -21,6 +21,7 @@ CONFIG_CMD_ERASEENV=y
>  CONFIG_CMD_NVEDIT_EFI=y
>  CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y
> +CONFIG_CMD_UNZIP=y
>  CONFIG_CMD_ADC=y
>  CONFIG_CMD_CLK=y
>  CONFIG_CMD_DFU=y
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
