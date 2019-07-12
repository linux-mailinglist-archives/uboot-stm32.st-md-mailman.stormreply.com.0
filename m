Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9F766EE0
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:42:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 031DDC06908
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:42:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1843EC06904
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:42:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CCaoWO021425; Fri, 12 Jul 2019 14:42:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=PFXdvFC/m98WBIXoroPjFSm8EOPBJ82WzzbAPyiJZi4=;
 b=PYOeHAFulJQhXSCnBjjq+6BOf53cvWqDEN7Lrc0BeIKagG/xbouiFWEvG9Pat/X9aspN
 Hd45GIrqlwdXQ7pa2vh/R10+M0TJTfKL2Gd5VXkppQUKhoguAuISI/rSWIvRpsGBzkhB
 ywxvyqIXhz7AHVrvE8wtn/TJqZAjL0r5HCRtewAYO5LBMw8Hxh0Vpw/ClvljsSp9tLc4
 sKcLNtxwlp3Gl+Gf/5CKnZJN/ONI58G7KBkj4JHDzqnYSq7YQOGSgHDpk2OrL97sccqP
 Mb3YZ8Y3YJl8IQsmsviJcwCmOtFdc2239IhUHea9Zi3ch69B4V+Y53ppkX0bsX90sxrj GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjjhja0f3-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:42:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9ECEC38;
 Fri, 12 Jul 2019 12:42:11 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8AE602C1F;
 Fri, 12 Jul 2019 12:42:11 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 14:42:11 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:42:11 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/3] stm32mp1: activate OF_BOARD_SETUP and
 FDT_FIXUP_PARTITIONS
Thread-Index: AQHVMMj28BYt2MCb3EW7gEkWtQheNqbG/MNA
Date: Fri, 12 Jul 2019 12:42:11 +0000
Message-ID: <aa6ed02f58cf4bb38017b51c04f89a8a@SFHDAG6NODE3.st.com>
References: <1562066767-8221-1-git-send-email-patrick.delaunay@st.com>
 <1562066767-8221-4-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1562066767-8221-4-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] stm32mp1: activate OF_BOARD_SETUP and
 FDT_FIXUP_PARTITIONS
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

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: mardi 2 juillet 2019 13:26
> 
> Update kernel MTD partition in device tree with U-Boot information.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  arch/arm/mach-stm32mp/Kconfig       |  1 +
>  board/st/stm32mp1/stm32mp1.c        | 18 ++++++++++++++++++
>  configs/stm32mp15_basic_defconfig   |  1 +
>  configs/stm32mp15_optee_defconfig   |  1 +
>  configs/stm32mp15_trusted_defconfig |  1 +
>  5 files changed, 22 insertions(+)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
