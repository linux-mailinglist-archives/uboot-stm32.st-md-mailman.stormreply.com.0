Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C69E1CDC40
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 15:58:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0673BC36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 13:58:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3714C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 13:58:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDRwdn007378; Mon, 11 May 2020 15:58:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Ee3WseXHIyBd2RYqzYRWVVbLKZeHidvN5vI/ohg9yu0=;
 b=RqndiOPKNGJQDCSQLHHfI/wZTrtZeuQTO3YR7T1wZygBsoSRzKJk2GnHEC84YCfbvobW
 Oye85/KCbPQkSnDK5rbzjNFGzT0eYENeclZliN3F//HezJGccTZO8KmdXsLOEmQrfpoU
 0TJLXpSqTax18k3zHuKHZLqmDIvRWSGti9Rp+H152kQV6BCcpTVMjM4cI8qmXGQ2oZ4D
 IWUBmyR6PusRxiWoPS5TnNERtR32gsNP33tQoh7J57muS+N/ej+h2dO48f/UfWtSDIUW
 PnosF6lpTJU6E6OQDZaEWMOXE2CgwtbdYCqL0tNo2/ln/GZYP5IQxH/O0ffsS/QE9Ipg Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wj01tws9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 15:58:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8051C10002A;
 Mon, 11 May 2020 15:58:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 772592A9794;
 Mon, 11 May 2020 15:58:09 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 15:58:08 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 15:58:09 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v2 07/12] board: stm32mp1: remove bootdelay
 configuration for usb or serial boot
Thread-Index: AQHWJ5wz0mx2PFM6hka0eu+/RNgJRg==
Date: Mon, 11 May 2020 13:58:09 +0000
Message-ID: <e4a1cf7a-6262-7fe3-d21c-7ee52e05d6e1@st.com>
References: <20200422122920.19340-1-patrick.delaunay@st.com>
 <20200422142834.v2.7.Ic051e25812481db408f2431c7962da1db1f198fb@changeid>
In-Reply-To: <20200422142834.v2.7.Ic051e25812481db408f2431c7962da1db1f198fb@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <AA48A85A299A12489DBD79CAB24D3599@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 07/12] board: stm32mp1: remove
 bootdelay configuration for usb or serial boot
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


On 4/22/20 2:29 PM, Patrick Delaunay wrote:
> It is not allowed to change the user setting of bootdelay, so
> remove the check of the boot-source to disable it dynamically
> in board_late_init()
>
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - remove bootdelay configuration after Wolfgang's comment on dropped patch
>   [11/16] board: stm32mp1: check env_get result in board_late_init
>
>  board/st/stm32mp1/stm32mp1.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 280c5b7ae4..687d605e29 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -692,7 +692,6 @@ int board_init(void)
>  
>  int board_late_init(void)
>  {
> -	char *boot_device;
>  #ifdef CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
>  	const void *fdt_compat;
>  	int fdt_compat_len;
> @@ -740,11 +739,6 @@ int board_late_init(void)
>  	board_check_usb_power();
>  #endif /* CONFIG_ADC */
>  
> -	/* Check the boot-source to disable bootdelay */
> -	boot_device = env_get("boot_device");
> -	if (!strcmp(boot_device, "serial") || !strcmp(boot_device, "usb"))
> -		env_set("bootdelay", "0");
> -
>  	return 0;
>  }
>  
>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
>
> Patrice
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
