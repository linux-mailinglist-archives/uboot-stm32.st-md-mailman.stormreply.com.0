Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 541223C539
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jun 2019 09:35:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D73DCBD2EA
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jun 2019 07:35:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A796ECBD2E9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 07:35:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5B7VPi3018846; Tue, 11 Jun 2019 09:35:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=zeFiFdUVPTFPPjl+jo0/9mxqnkGSLpGOQO11i5RjeF8=;
 b=03osrON+CLWQ4Rso10gYLW/TjO5XxqbCJzrBSzoIzHRW9VF0yUQek2wiR368o57LiEbW
 T3XleFb2x9b/ZpyUI4Ox+n0PjpiVk/0Sdak2e3izhdcRtSO8ezk3Kdu+hpWnq5HP1uwY
 3zn+cUyxet5ge4cg9pb8RC24hmMt6N5VEScFbCFLdM7dzQtTT0RlYJLvo++7WZC9lreA
 SzHzZcn9y0XUyxMes7PczueYyP24HaUdIBDK4GaMmboAtV0KpWRQev8NsIbulz+bXEUt
 8Y3pIsaql9WPWhbflucRbv+AAaP9kIlbG+nBq7Iyu6L/HVb9tXECMhWBMNdECVrlHykP 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t26rp8ds4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 11 Jun 2019 09:35:24 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D90531;
 Tue, 11 Jun 2019 07:35:23 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6441513AE;
 Tue, 11 Jun 2019 07:35:23 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Jun
 2019 09:35:23 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 11 Jun 2019 09:35:23 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Christophe ROULLIER <christophe.roullier@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 5/6] stm32mp1: Add Ethernet support for stm32mp1 board
Thread-Index: AQHVDLGwB5IcauEcvkCYgb85WNZvJ6aWFYqA
Date: Tue, 11 Jun 2019 07:35:22 +0000
Message-ID: <2578fb76-5b12-4a4c-0253-012ba7667261@st.com>
References: <20190517130847.13144-1-christophe.roullier@st.com>
 <20190517130847.13144-6-christophe.roullier@st.com>
In-Reply-To: <20190517130847.13144-6-christophe.roullier@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <B26CD566F2D95B4C82D736EBB3FC2BAB@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-11_03:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 5/6] stm32mp1: Add Ethernet support for
	stm32mp1 board
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



On 5/17/19 3:08 PM, Christophe Roullier wrote:
> Add default SERVERIP address
> Enable noncached memory region required by ethernet driver
> Add PXE support
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
> 
> Changes in v2: None
> 
>  include/configs/stm32mp1.h | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index fd6c97a0c61..cc14f6169b9 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -78,6 +78,14 @@
>  /*MMC SD*/
>  #define CONFIG_SYS_MMC_MAX_DEVICE	3
>  
> +/* Ethernet need */
> +#ifdef CONFIG_DWC_ETH_QOS
> +#define CONFIG_SYS_NONCACHED_MEMORY	(1 * SZ_1M)	/* 1M */
> +#define CONFIG_SERVERIP                 192.168.1.1
> +#define CONFIG_BOOTP_SERVERIP
> +#define CONFIG_SYS_AUTOLOAD		"no"
> +#endif
> +
>  /*****************************************************************************/
>  #ifdef CONFIG_DISTRO_DEFAULTS
>  /*****************************************************************************/
> @@ -87,7 +95,9 @@
>  #define BOOT_TARGET_DEVICES(func) \
>  	func(MMC, mmc, 1) \
>  	func(MMC, mmc, 0) \
> -	func(MMC, mmc, 2)
> +	func(MMC, mmc, 2) \
> +	func(PXE, pxe, na)
> +
>  /*
>   * bootcmd for stm32mp1:
>   * for serial/usb: execute the stm32prog command
> 

Applied

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
