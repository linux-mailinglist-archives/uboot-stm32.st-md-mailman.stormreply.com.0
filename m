Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 044663FCB30
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Aug 2021 18:05:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51332C57B60;
	Tue, 31 Aug 2021 16:05:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2724C424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Aug 2021 16:05:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17VEkIw4014213;
 Tue, 31 Aug 2021 18:05:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nm0ON8NhMjtlosAS4w/gWhW0fW8Sdz0Ma81/Q4Htbr0=;
 b=ac8Qdg+yS1b3z2Jq8Hzz6lRXRxYE1kg8diwq/wHjJ0mM0bcXEU3wwQ481QL6lPiqCk33
 6hfN8CfUE++EVzJYRdyi/2QjELADnl7cP1EYprqG5ERbF67IcVN0hzA6IavlEgzKG8I8
 ZKXVX4tfVlwbLihPTTNyMf13qSp8ETnT/4M3hi0ySJZhfwtAV1amTmd77zX+pQ3FHzxg
 GXgos0Q/xKkBYNAyhZk7Qdh2p2NRPEXwVZyLxsy3ECm8ZkyZoyGitO2GOh4WYc8tugEI
 /fLQIGuUY8jpdwwo+tSmD0Tphb6U/R2zHgd4vqZGgMb+7MhJbp9S6Q7PI8EPhvPxGFqH 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3asheh281b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 18:05:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AEFC410002A;
 Tue, 31 Aug 2021 18:05:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 940C92540A2;
 Tue, 31 Aug 2021 18:05:08 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 18:05:07 +0200
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, <u-boot@lists.denx.de>
References: <20210826214209.254461-1-mr.nuke.me@gmail.com>
 <20210826214209.254461-2-mr.nuke.me@gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <88af3bca-b1e3-0e12-db57-49d8aca30767@foss.st.com>
Date: Tue, 31 Aug 2021 18:05:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826214209.254461-2-mr.nuke.me@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-31_07,2021-08-31_01,2020-04-07_01
Cc: marex@denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 01/10] stm32mp1: Add support for baudrates
 higher than 115200
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

I add in CC the ARM STM STM32MP Maintainers...

On 8/26/21 11:42 PM, Alexandru Gagniuc wrote:
> The UART can reliably go up to 2000000 baud when connected to the
> on-board st-link. Unfortunately u-boot will fall back to 115200 unless
> higher rates are declared via CONFIG_SYS_BAUDRATE_TABLE.
>
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>   include/configs/stm32mp1.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index b372838be8..9fcd60285a 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -16,6 +16,10 @@
>   #define CONFIG_ARMV7_SECURE_MAX_SIZE		STM32_SYSRAM_SIZE
>   #endif
>   
> +#define CONFIG_SYS_BAUDRATE_TABLE      { 9600, 19200, 38400, 57600, 115200, \
> +					 230400, 460800, 921600, \
> +					 1000000, 2000000 }
> +
>   /*
>    * Configuration of the external SRAM memory used by U-Boot
>    */

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
