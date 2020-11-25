Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AF82C3D10
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 10:56:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F6FBC5662F;
	Wed, 25 Nov 2020 09:56:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7278AC32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 09:56:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AP9qlF4008021; Wed, 25 Nov 2020 10:56:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=YfUKeWR74i6WdunZw4FFyhHKtbxXaDqGUfRIbQuf8Lg=;
 b=K0SrXdnf/YBnuy63ljO+Q/qecV3Wq+TigKK8Yz7iIOPm1wWHtKt0VFqDW2ftjFQnEBqj
 N8Q3FUR9E33QbmP9JEppOWpH5EyKSonRoxMDp4bTLKQNeWuC4RxG/DB4d9vlZF4qC0jo
 r+i7JUWmApbiRiS3RGaGLuOH7pvsgmhWYPIdQ+53lvXIUsWU4kl9TrEf7ME20+YMTlYG
 o2vNXLpmkxDo7VW7VI/1JP5gP39QpiaresGgJ14AEuTAq48BXpR1MS+SloZc/TUZeQDW
 42y39PWah3X35cfO4lW+m1evdKXLpW/uaNkMmnYMob6PX9u8844EH0k+FQL6IcqvdGTS wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0fgyksa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 10:56:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2328B100034;
 Wed, 25 Nov 2020 10:56:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16CFD231F92;
 Wed, 25 Nov 2020 10:56:21 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 10:56:20 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 10:56:20 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Richard Genoud <richard.genoud@posteo.net>, Patrice CHOTARD
 <patrice.chotard@st.com>
Thread-Topic: [PATCH] SPL: stm32mp1: fix spl_mmc_boot_partition not defined
Thread-Index: AQHWoKGV7MGwOzuthEyLzrXfB8K3dKnY4PKA
Date: Wed, 25 Nov 2020 09:56:20 +0000
Message-ID: <181fdd6872764d61a23a3951bdd383dc@SFHDAG2NODE3.st.com>
References: <20201012141109.29778-1-richard.genoud@posteo.net>
In-Reply-To: <20201012141109.29778-1-richard.genoud@posteo.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_06:2020-11-25,
 2020-11-25 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH] SPL: stm32mp1: fix spl_mmc_boot_partition
	not defined
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

Hi Richard,

> From: Richard Genoud <richard.genoud@posteo.net>
> Sent: lundi 12 octobre 2020 16:11
> 
> spl_mmc_boot_partition is only defined when
> CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION is defined.
> 
> Signed-off-by: Richard Genoud <richard.genoud@posteo.net>
> ---
>  arch/arm/mach-stm32mp/spl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
