Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCC215D59C
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 11:27:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D65FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 10:27:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F164CC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 10:27:52 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01EAMthu031495; Fri, 14 Feb 2020 11:27:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=qfsvxz+PlqPuomXlqwbDEkTLKfJ8o7v+quMRQnr/cgI=;
 b=xrbieUjgpdE3zTxcU1rIySc7+mY5mPC3RoaPs88v+ClzODRcYIfNisMhcBHioQ0Vk2EA
 dm+pfdabfgDhxQLAQ8/1r7vYwoSFmHt7arRESzcaO4fjpaJKNmifaH9XX3Rd5AXyMKJC
 Ek6ClU2l9YG667pgE6SMUsVabMV6FwMOo3pECu3vbpZ4n+GbSBC+37eaLR4EezYpOc6Q
 TFdn4UsetuBxBq9R4Dg/pr/0RwGoDLtBD3M3ssoNvD3Gwxr5zZtRiwDzZvH24onHKuPr
 MfGAfQpYJhTfVMc+SaY0znnjVJX3n0Rb952/auGQ9kRzIZwXxWFqmMe1PW/W1hLHbT8L xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufhu81h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 11:27:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A9CD10003B;
 Fri, 14 Feb 2020 11:27:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 712592AC879;
 Fri, 14 Feb 2020 11:27:45 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 11:27:45 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 14 Feb 2020 11:27:45 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 6/9] ARM: dts: stm32m1: add reg for pll nodes
Thread-Index: AQHV1bruDdDTatSHkkOiKey0nEXhUKgalytA
Date: Fri, 14 Feb 2020 10:27:45 +0000
Message-ID: <0eb88209553545fab43bf6f7fa65df58@SFHDAG6NODE3.st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128101042.6.I2f3909b277fbe345fc8d26129dfdf17ff2249b0a@changeid>
In-Reply-To: <20200128101042.6.I2f3909b277fbe345fc8d26129dfdf17ff2249b0a@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_02:2020-02-12,
 2020-02-14 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 6/9] ARM: dts: stm32m1: add reg for pll
	nodes
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
> Sent: mardi 28 janvier 2020 10:11
> 
> Fix the following DT dtc warnings for stm32mp1 boards:
> 
> Warning (unit_address_vs_reg): /soc/rcc@50000000/st,pll@0:
>   node has a unit name, but no reg property Warning (unit_address_vs_reg):
> /soc/rcc@50000000/st,pll@1:
>   node has a unit name, but no reg property Warning (unit_address_vs_reg):
> /soc/rcc@50000000/st,pll@2:
>   node has a unit name, but no reg property Warning (unit_address_vs_reg):
> /soc/rcc@50000000/st,pll@3:
>   node has a unit name, but no reg property
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm32/master, thanks!
 
Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
