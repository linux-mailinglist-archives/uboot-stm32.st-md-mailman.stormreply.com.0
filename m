Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 721B7109DB5
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 13:16:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29AF6C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 12:16:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42544C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 12:16:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQC7MGB030083; Tue, 26 Nov 2019 13:16:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Sh3lkFo69uvyYTwVhbd4TuvIkE/a/MRCOpAJFrL4mII=;
 b=bZ8l6IQakqEz8mWKeJHUxqB5b5VDjbd25vYZReyVAExjEy79yGm1FR27svSG/g+U4/iR
 z/3mkMcp+uDEfnbd9GnOIoSJvCTRJGjIost/Khkj9P1KL6V/05qWx5IWfQO2Dj/toEZX
 VYbGKJ5i5NguKUruuDA1mXsH9G0sx99aoI/LBrSrIq/k+dd50PIAngw7rn4hXyMNYOOZ
 pz3w7bexsRy6F6igjaVB14GRJ+xz1lQwHPp5dCSkgCXLFWrCAkmtzd5N7qFQtRciex9G
 MgL/241pscqOOLD1cGyzDhj311q8EwSAz1XsPilU5Gt67UitmgQT4yuQOJYksp1N5eau yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wevhjq146-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 13:16:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A213210002A;
 Tue, 26 Nov 2019 13:16:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA30A2B6235;
 Tue, 26 Nov 2019 13:16:28 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 Nov
 2019 13:16:28 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 26 Nov 2019 13:16:28 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] board_f.c: Insure gd->new_bootstage alignment
Thread-Index: AQHVo5b8nMk4YyxpKkWVHbr0Um2wiqedXd5g
Date: Tue, 26 Nov 2019 12:16:27 +0000
Message-ID: <a4bdcd488930473dbeb01c6e9d678398@SFHDAG6NODE3.st.com>
References: <20191125134811.16462-1-patrice.chotard@st.com>
In-Reply-To: <20191125134811.16462-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_03:2019-11-26,2019-11-26 signatures=0
Cc: Stephen Warren <swarren@nvidia.com>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Trevor Woerner <trevor@toganlabs.com>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH] board_f.c: Insure gd->new_bootstage
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

Hi,

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: lundi 25 novembre 2019 14:48
> 
> In reserve_bootstage(), in case size is odd, gd->new_bootstage is not aligned. In
> bootstage_relocate(), the platform hangs when getting access to data-
> >record[i].name.
> To avoid this issue, make gd->new_bootstage 16 byte aligned.
> 
> Fixes: ac9cd4805c8b ("bootstage: Correct relocation algorithm")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
> ---

This patch is mandatory for stm32mp1 (ARM plaform with bootstage feature activated).

Without this patch, the boot failed for v2020.01-rc3 (crash has struct pointer new_bootstage is not aligned).

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com> 
Tested-by: Patrick Delaunay <patrick.delaunay@st.com>

>  common/board_f.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/common/board_f.c b/common/board_f.c index e3591cbaeb..9cd4cfaf5f
> 100644
> --- a/common/board_f.c
> +++ b/common/board_f.c
> @@ -559,6 +559,7 @@ static int reserve_bootstage(void)
>  	int size = bootstage_get_size();
> 
>  	gd->start_addr_sp -= size;
> +	gd->start_addr_sp = ALIGN_DOWN(gd->start_addr_sp, 16);
>  	gd->new_bootstage = map_sysmem(gd->start_addr_sp, size);
>  	debug("Reserving %#x Bytes for bootstage at: %08lx\n", size,
>  	      gd->start_addr_sp);
> --
> 2.17.1

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
