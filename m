Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5916312046D
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Dec 2019 12:54:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 144F0C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Dec 2019 11:54:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8208C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 11:54:13 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBGBrwCH007094; Mon, 16 Dec 2019 12:53:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=LXJ6QPQvRJbydLcCOvNMhXKOfbt0Go1nh4rIuT3/6nw=;
 b=ES+iCQRkRnrIUQ1/oidW5XPH5x6uIexbBcqJSGc+o1wUOa2+Zy2hvat0dZ0PqP/TDBcn
 hgbD3Q0nD5bVgpGlR0Qacs33YBOtjC+UtbGB/QtP1TO7XAHfaAdT7n4RThx5LWgpNSn7
 Qqr/TZKjzb/aPlFB6uQ6inkKM4Kir6Lu98KgYCL8eDoDpIJO42IxP/IVB1pfi4sF/is7
 SEFcGymHZJpGvGI09/6tFSgei+NpjQ+0nflCzDTDpK9Poe+XksSmS1TgXhbvrTb5NVsY
 Up8XJ+E8OoIDUSzfIdbX73wyGHwyrLnNlj0DQlQBGeVBctW6Jnr6dNVJwW7FaWdKz9bW YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wvpd19a3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2019 12:53:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 943B6100038;
 Mon, 16 Dec 2019 12:53:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 782012D379B;
 Mon, 16 Dec 2019 12:53:49 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Dec
 2019 12:53:48 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 16 Dec 2019 12:53:48 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH v3] board_f.c: Insure gd->new_bootstage alignment
Thread-Index: AQHVpQKuO35xYU0730Sul27V/xKK76e8l++A
Date: Mon, 16 Dec 2019 11:53:48 +0000
Message-ID: <611198b18f8e404d9c63a3ab2a1410dd@SFHDAG6NODE3.st.com>
References: <20191127091138.29223-1-patrice.chotard@st.com>
In-Reply-To: <20191127091138.29223-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-16_04:2019-12-16,2019-12-16 signatures=0
Cc: Stephen Warren <swarren@nvidia.com>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Trevor Woerner <trevor@toganlabs.com>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3] board_f.c: Insure gd->new_bootstage
	alignment
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

Hi Tom,

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: mercredi 27 novembre 2019 10:12
> 
> In reserve_bootstage(), in case size is odd, gd->new_bootstage is not aligned. In
> bootstage_relocate(), the platform hangs when getting access to data-
> >record[i].name.
> To avoid this issue, make gd->new_bootstage 16 byte aligned.
> 
> To insure that new_bootstage is 16 byte aligned (at least needed for
> x86_64 and ARMv8) and new_bootstage starts down to get enough space,
> ALIGN_DOWN macro is used.
> 
> Fixes: ac9cd4805c8b ("bootstage: Correct relocation algorithm")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
> Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
> 

Do you plan to merge this fixe for the next rc for v2020.01 ?
Or do you expect some change / review.

This patch is mandatory for stm32mp1 (ARM plaform with bootstage feature activated).
Without this patch, the boot failed (at least for v2020.01-rc3 : crash has struct pointer new_bootstage is not aligned).

Or I will deactivate the BOOTSTAGE feature...

Thanks 

Patrick

> ---
> 
> Changes in v3:
>   - Add Patrick Reviewed-by and Tested-by.
> 
> Changes in v2:
>   - Update comment to explain the ALIGN_DOWN() usage.
> 
>  common/board_f.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/common/board_f.c b/common/board_f.c index e3591cbaeb..d367f6b044
> 100644
> --- a/common/board_f.c
> +++ b/common/board_f.c
> @@ -559,6 +559,11 @@ static int reserve_bootstage(void)
>  	int size = bootstage_get_size();
> 
>  	gd->start_addr_sp -= size;
> +	/*
> +	 * Insure that start_addr_sp is aligned down to reserve enough
> +	 * space for new_bootstage
> +	 */
> +	gd->start_addr_sp = ALIGN_DOWN(gd->start_addr_sp, 16);
>  	gd->new_bootstage = map_sysmem(gd->start_addr_sp, size);
>  	debug("Reserving %#x Bytes for bootstage at: %08lx\n", size,
>  	      gd->start_addr_sp);
> --
> 2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
