Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 783E1294BE9
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 13:45:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE985C3FAE0;
	Wed, 21 Oct 2020 11:45:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 125C2C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 11:45:06 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LBg31f015944; Wed, 21 Oct 2020 13:45:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ro4D3xLwqYhXi0YHbtXXjzYVLqtu5sYxrw5ICy40eUw=;
 b=pVfGBwRKSu5all/Vuc5ph4H450Fv8KAkZ0iIq5RTwoCZiJ0cbJ8xAtZLnb8w477RAIMV
 hhgGXyses6DC5u+H8aoIwn2Mjlutm/Nbs/WlTV3TWr4W6KhrWCLiB4gnlto5hh5lhT61
 F6PP1UQShP4k5S6FIgvEpijXQotVfyy/KWBEfT48xcULwdRCdiyfZQwXnQhUKxxJ7M/3
 S4w39l76rg9sANksuSUjCt5ro9EvEjzCUmBLUZmaNv0ck9vWM95bHmYLVWERK/R7rDMO
 irYnHEey0JTU9c78sDHss2EQxBQelh6+j37Fi6xQMbAuN52NHCeT59YASgF/oj36W5J4 +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcx1qty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 13:45:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C69D310002A;
 Wed, 21 Oct 2020 13:45:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE1232DD656;
 Wed, 21 Oct 2020 13:45:04 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 13:45:04 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 13:45:04 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] board: stm32mp1: no MTD partitions fixup
 for serial boot
Thread-Index: AQHWp5+dm3prcPilK0mSJrh+no4R2g==
Date: Wed, 21 Oct 2020 11:45:04 +0000
Message-ID: <fe61e220-811b-cd70-0ce7-1533fe79910e@st.com>
References: <20201015125230.8378-1-patrick.delaunay@st.com>
In-Reply-To: <20201015125230.8378-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <8AB0DEE292D7DE4E962FCD956FA5560F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: no MTD partitions fixup
 for serial boot
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

On 10/15/20 2:52 PM, Patrick Delaunay wrote:
> Remove the update of the MTD partitions in kernel device tree
> for serial boot (USB / UART), and the kernel will use the MTD
> partitions define in the loaded DTB because U-Boot can't known the
> expected flash layout in this case.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 03a19af930..8a3ce0a6f5 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -848,9 +848,14 @@ int ft_board_setup(void *blob, struct bd_info *bd)
>  		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
>  		{ "st,stm32mp1-fmc2-nfc",	MTD_DEV_TYPE_NAND, },
>  	};
> -
> -	if (IS_ENABLED(CONFIG_FDT_FIXUP_PARTITIONS))
> -		fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
> +	char *boot_device;
> +
> +	/* Check the boot-source and don't update MTD for serial or usb boot */
> +	boot_device = env_get("boot_device");
> +	if (!boot_device ||
> +	    (strcmp(boot_device, "serial") && strcmp(boot_device, "usb")))
> +		if (IS_ENABLED(CONFIG_FDT_FIXUP_PARTITIONS))
> +			fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
>  
>  	return 0;
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
