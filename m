Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF01B243509
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:34:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B094C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 07:34:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43681C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 07:34:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D2NIRW022636; Thu, 13 Aug 2020 09:34:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=LvQ8bQO9wsxHJFnd7wC0/cPhFuhTHaZq8UvZMqoUeWE=;
 b=yvCNvlTKGFFjBP8GSPrc74mpNGimyCiMXrxWVZUAdJ/YTUCzAPfJPPB4Y2wXT3wRO4Kq
 XyQzMkyn0ij5qY9O0O4JRt+VSz7zHaOZ/wxeoakO5kKDMqWC8sMWPj9gxz3drEV73idj
 8o+NCpE8Z3fkhVsi7HxvkCKAPf407SowJiE5yYGVmAXL6ECEsK/r1XLK57POLIr2/nOi
 pX6v8mBNZXUVCQY5oKB6ecAOUSnEJCV2Qx2veKcKTyJyOUN5AoqIdvH5xdcUq8WSVUHH
 YJO9CxxV7+E831quxyaAgBXFu8j0WAVHZx5Wt+scIDM7SlmTaI78CJ3kFHnJrE5Na0QY jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32uj532ydh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 09:34:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F185E10002A;
 Thu, 13 Aug 2020 09:34:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E806421FE8E;
 Thu, 13 Aug 2020 09:34:28 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 09:34:28 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 09:34:28 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Christophe KERELLO <christophe.kerello@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 09/11] board: stm32mp1: update fdt fixup partitions table
Thread-Index: AQHWZw/oSHhgzhMM30qlb7Ubd70s1qk1mLMA
Date: Thu, 13 Aug 2020 07:34:28 +0000
Message-ID: <f2affd46-12b8-e149-2c07-11166eefe51a@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
 <1596182024-18181-10-git-send-email-christophe.kerello@st.com>
In-Reply-To: <1596182024-18181-10-git-send-email-christophe.kerello@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <AFB4FEB250020B4E857797D483CE4E2A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_02:2020-08-11,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 09/11] board: stm32mp1: update fdt fixup
	partitions table
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

Hi Christophe

On 7/31/20 9:53 AM, Christophe Kerello wrote:
> This patch adds "st,stm32mp1-fmc2-nfc" compatible string in the
> fdt fixup partitions table.
>
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 1d274c3..f2f6c99 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -851,6 +851,7 @@ int ft_board_setup(void *blob, struct bd_info *bd)
>  		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
>  		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_SPINAND},
>  		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
> +		{ "st,stm32mp1-fmc2-nfc",	MTD_DEV_TYPE_NAND, },
>  	};
>  	fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
>  #endif

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
