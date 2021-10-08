Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B79642647E
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 08:11:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4F97C597B2;
	Fri,  8 Oct 2021 06:11:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC1DCC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 06:10:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984ZGjq032582; 
 Fri, 8 Oct 2021 08:10:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UM9oawgx5exts1Snqq/VA+9/ebDEIOl1OLn8X7jR3JQ=;
 b=MgLyztLIgVgwaQJtPrljN21+RTw1gvDxpH7c3D0l9LEir80OLG9/tg9zImqtc5V9oJmQ
 8LKS3Ob8BMacfdp8s/ElZSkUw3i8pq4Jw4BwEX+cFzYDww1Fe6bH+gtIav3lZqSH0wjP
 ozaMPmDwtT3u/tIgYqsvU2IZ1RRzPb8EguHsSkvZIyxr+NTOKvC4HIMLj9mUCNicX6Ae
 JHuOV6wxRoLOzIQJzdKEOYwpzynaahBxuID/5alvQ/pi/zKE8hKaHZpsGo8KXvJj47wg
 ISwfAVpPiqM8ugxa4EbuOFIhbTILozf7PU3LlZ+DxkvlNLzfD2xMHyEQijzXem9RNY2b QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjem10kba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 08:10:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0AFE510002A;
 Fri,  8 Oct 2021 08:10:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 006B4212FAC;
 Fri,  8 Oct 2021 08:10:49 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 08:10:48 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211006184935.1.Ifd2b939d3737fc79221a7032a05d1c8ab5a9957b@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <8131fb24-d77e-40aa-1780-69bfe7f5ce69@foss.st.com>
Date: Fri, 8 Oct 2021 08:10:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006184935.1.Ifd2b939d3737fc79221a7032a05d1c8ab5a9957b@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-07_05,2021-10-07_02,2020-04-07_01
Cc: Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>,
 Holger Brunck <holger.brunck@hitachi-powergrids.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Stefan Roese <sr@denx.de>,
 Ilko Iliev <iliev@ronetix.at>
Subject: Re: [Uboot-stm32] [PATCH] pm9263: Remove unused
	CONFIG_USER_LOWLEVEL_INIT
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

HI Patrick

On 10/6/21 6:49 PM, Patrick Delaunay wrote:
> Remove the latest reference of CONFIG_USER_LOWLEVEL_INIT in code
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  include/configs/pm9263.h     | 1 -
>  scripts/config_whitelist.txt | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/include/configs/pm9263.h b/include/configs/pm9263.h
> index c13f8de7c1..fb2d2bf8ce 100644
> --- a/include/configs/pm9263.h
> +++ b/include/configs/pm9263.h
> @@ -136,7 +136,6 @@
>  		 AT91_WDT_MR_WDDIS |				\
>  		 AT91_WDT_MR_WDD(0xfff))
>  
> -#define CONFIG_USER_LOWLEVEL_INIT	1
>  
>  /*
>   * Hardware drivers
> diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
> index 5bcd2c26c4..4a31346b30 100644
> --- a/scripts/config_whitelist.txt
> +++ b/scripts/config_whitelist.txt
> @@ -3085,7 +3085,6 @@ CONFIG_USB_TTY
>  CONFIG_USB_TUSB_OMAP_DMA
>  CONFIG_USB_ULPI_TIMEOUT
>  CONFIG_USB_XHCI_EXYNOS
> -CONFIG_USER_LOWLEVEL_INIT
>  CONFIG_USE_INTERRUPT
>  CONFIG_USE_ONENAND_BOARD_INIT
>  CONFIG_UTBIPAR_INIT_TBIPA
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
