Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE272434EA
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:24:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0809CC36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 07:24:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEF97C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 07:24:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D2NIOk022636; Thu, 13 Aug 2020 09:24:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=AHDJEf4zbueJzl/qJa1PN/c7CN2AR0zLb6/5pw4l9WI=;
 b=ZrPqJ7dlKUUjXjDCLPUxI3JesDVksSkEcdvgOP4zPP1JlkPdUAcRZrl2FtrgVYLMH3Q9
 ptWpXWo4u+PgrQ7aR3HvF8Z4Nb+lrqPRlbzok1V/HM2VkJTusw7elWRE01foVhV0vrx7
 odfzwVeRCo3S2vL6NoV4MgIp1QRmO9oIyojtLf3wjIZXbiSqC+Zj0vixjVgloer7DXTT
 bLMQ4rnNKjd3q+1brPHDax8X02I3OEntkEC5ZEc5zylYxGg1EQLRL23hs6ZUhKxaqzvq
 l1xlkAtq6lPK5MbRf5PqEt217DaMfxmEgAx7MM+bIdRUO1KEs8yvCibZvjcfnnSRKRRg kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32uj532x2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 09:24:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CDAAF10002A;
 Thu, 13 Aug 2020 09:24:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C5B6421F687;
 Thu, 13 Aug 2020 09:24:38 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 09:24:38 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 09:24:38 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 09/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in ft_board_setup
Thread-Index: AQHWcULNbPiLfk5xFEetlc6144sYvw==
Date: Thu, 13 Aug 2020 07:24:38 +0000
Message-ID: <9012ee45-824e-3cb3-b4a0-cde347e7185e@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
 <20200731143152.8812-9-patrick.delaunay@st.com>
In-Reply-To: <20200731143152.8812-9-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <9109B0EE236F7143B4A569AAA813DCAC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_02:2020-08-11,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 09/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in ft_board_setup
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

On 7/31/20 4:31 PM, Patrick Delaunay wrote:
> Use IS_ENABLED to prevent ifdef in ft_board_setup.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 08d18b6da8..4d26738a24 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -842,14 +842,14 @@ int mmc_get_env_dev(void)
>  #if defined(CONFIG_OF_BOARD_SETUP)
>  int ft_board_setup(void *blob, struct bd_info *bd)
>  {
> -#ifdef CONFIG_FDT_FIXUP_PARTITIONS
>  	struct node_info nodes[] = {
>  		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
>  		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_SPINAND},
>  		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
>  	};
> -	fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
> -#endif
> +
> +	if (IS_ENABLED(CONFIG_FDT_FIXUP_PARTITIONS))
> +		fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
>  
>  	return 0;
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
