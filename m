Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2555C66EC0
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:41:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEABCC06902
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:41:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EA67C06900
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:41:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CCao0S021431; Fri, 12 Jul 2019 14:41:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=qGYwAibJAgT+JFQ7qNyAtajr6YJy95P+Q1S68/gkXIw=;
 b=jWiCymirUEZqBdglrpeIE68B7MvSJpoj3RnJIO08cQFEhA62O4Gc7VKjhOG4ImGwgasz
 UNppmnyAEdH7I5OAXxzs07nTgg+yBeevaf4JMn7xmxxiFMSt/LpT+csr0Pd+XvrLqt/m
 W9FVerUN2UWVowjgyH2/582ZAp6RV0dpaG9Kqsjrpzz2byLa/Qe1WWb0pktUIJPZqizL
 E7CdQmvSqFzldUIQrb1tIRrBsMvRaQr0eyuUUwMK5igsrTqVeAukc4/3gDdhjzZBIzVK
 c4ShTgo85ucAnz/Aj7XformOm0laOGx9HD6mwMxaipxcxgS+kXn7//Hxp+neMDdxi0hy vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjjhja096-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:41:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 330F73D;
 Fri, 12 Jul 2019 12:41:07 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C9B42C14;
 Fri, 12 Jul 2019 12:41:07 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jul
 2019 14:41:06 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:41:06 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/3] stm32mp1: reorder some CONFIG in stm32mp1.h
Thread-Index: AQHVMMj1le/CF3V47EONBvJIwaypr6bG/Beg
Date: Fri, 12 Jul 2019 12:41:06 +0000
Message-ID: <5cee022c8fb3449287ea08d09727fc0e@SFHDAG6NODE3.st.com>
References: <1562066767-8221-1-git-send-email-patrick.delaunay@st.com>
 <1562066767-8221-2-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1562066767-8221-2-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] stm32mp1: reorder some CONFIG in
	stm32mp1.h
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
> Change config not directly linked to CONFIG_DISTRO_DEFAULTS.
> Allow to deactivate CONFIG_SYS_MTDPARTS_RUNTIME when
> CONFIG_MTDPARTS_DEFAULT is defined in defconfig.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  include/configs/stm32mp1.h | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
