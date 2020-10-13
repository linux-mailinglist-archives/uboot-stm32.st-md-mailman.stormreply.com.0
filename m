Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 752D928CE36
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Oct 2020 14:19:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E698C35E2B;
	Tue, 13 Oct 2020 12:19:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 626E0C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 12:19:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09DC6gZT006217; Tue, 13 Oct 2020 14:18:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=kMtLrSf3a9OubQh5wr9QGaWBHbTV1Ml0UrexBHl3Pa8=;
 b=Mwj2NWG5uP6GW5WjYCfkW3bF3p335F6ak8mGCRL9yk6xwC2jOkxnEic6cQvzrq1UWSDb
 pSqCvoyf5YqWwRPlYxiKU2gQMALhmnnbVXILn/alFkjpB3yj6cqN5Jf4sVSQpnIw6ySn
 zr8sJQHlH4ZDBXZUFDvgRhKjkBhu2YwwtrYt9x+0WSJHF00tDJfONyqJBaIuun756I0r
 2WyqCuquLEArKBP8pWPWyuRtmvj8OwADCMvk8NtwsN57PYwdcACPfNIKvio38zujVcm/
 5odjT+rXUq4qGovA+WZ06MDkomqW5NzZ6qOC21qLnySAYao/4xe5X26jBY7pnH/RvkCB iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3455c8ae7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 14:18:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B385100034;
 Tue, 13 Oct 2020 14:18:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4FACB2C38BF;
 Tue, 13 Oct 2020 14:18:52 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 13 Oct
 2020 14:18:51 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Tue, 13 Oct 2020 14:18:51 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Richard Genoud <richard.genoud@posteo.net>, Patrice CHOTARD
 <patrice.chotard@st.com>
Thread-Topic: [PATCH] SPL: stm32mp1: fix spl_mmc_boot_partition not defined
Thread-Index: AQHWoKGV7MGwOzuthEyLzrXfB8K3dKmVcvCw
Date: Tue, 13 Oct 2020 12:18:51 +0000
Message-ID: <e60dfd9cc88b45a8a2e906741d17e7df@SFHDAG2NODE3.st.com>
References: <20201012141109.29778-1-richard.genoud@posteo.net>
In-Reply-To: <20201012141109.29778-1-richard.genoud@posteo.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-13_03:2020-10-13,
 2020-10-13 signatures=0
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

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Thanks for this missing check in spl.

NB: after check, it is possible to IS_ENABLED to prevent #ifdef here 

<unknown>:0: warning: Use 'if (IS_ENABLED(CONFIG...))' instead of '#if or #ifdef' where possible

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
