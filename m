Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B481A285F
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Apr 2020 20:16:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36F4FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Apr 2020 18:16:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22157C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2020 18:16:54 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038I2wB9021102; Wed, 8 Apr 2020 20:16:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pTh8D2yAESJdERXFx93dbfeJ9nDnTpt2swsG4E4p714=;
 b=JQ/QA7yb3pk+SzUrmOu6XpZfexdiHks5G+UX8NwhdnaPy5I1JN9neeBaZyU3o9rxu6OW
 TA91U5nLD3Q8Xp6mvjNwaZX7ZvQ/5baVkg/UKi7L1oWfNVqRrclMRAKEG4EYuNB3OExA
 K2tw+UMWBTr8su/NqqCyvzZvMiJyr6A/UlWqeu7Taxk9Z6wVPaGHUGnTmbfwuPHbFAFG
 0k6Gppt01BCKk5m0xP6sisgjSAQuUgkmzxLusvkpBjOAXFmIEivD2EJmeM+JwDra8s9M
 2Btgn7uSniy46SR5qf4xBXJnLkXIn6RcsU6ixg4nLpH/HiJqgto1yloAZnVSpTPJps9d EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091qk5ec6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 20:16:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BEFC0100034;
 Wed,  8 Apr 2020 20:16:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A601F2D3794;
 Wed,  8 Apr 2020 20:16:44 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Apr
 2020 20:16:44 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 8 Apr 2020 20:16:44 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/3] arm: caches: add DCACHE_DEFAULT_OPTION
Thread-Index: AQHWCZHnGsMjphwTIUWt6WPls6zgHKhnySMAgAfBaYA=
Date: Wed, 8 Apr 2020 18:16:44 +0000
Message-ID: <faf4ef59ca6a49c7a8a032726468fe43@SFHDAG6NODE3.st.com>
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
 <20200403102815.2.Ib6abcb05422a74bc6bc03daa71b15c98c99dbc5d@changeid>
 <ea5a59e9-dd9f-f2b6-a210-d99b417cb8f2@denx.de>
In-Reply-To: <ea5a59e9-dd9f-f2b6-a210-d99b417cb8f2@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
Cc: Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] arm: caches: add DCACHE_DEFAULT_OPTION
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

Dear Marek,

> From: Marek Vasut <marex@denx.de>
> Sent: vendredi 3 avril 2020 23:29
> 
> On 4/3/20 10:28 AM, Patrick Delaunay wrote:
> > Add the new flags DCACHE_DEFAULT_OPTION to define the default option
> > to use according the compilation flags
> > CONFIG_SYS_ARM_CACHE_WRITETHROUGH or
> CONFIG_SYS_ARM_CACHE_WRITEALLOC.
> 
> Can't you unify these macros into a single Kconfig "select" statement instead ,
> and then just select the matching cache configuration in Kconfig ?

Yes I will try, with 2 steps
- migrate existing CONFIG_SYS_ARM_CACHE_.... in Kconfig
- add new option CONFIG_SYS_ARM_CACHE_OPTION

> Or better yet, can't you extract this info from DT ?

I don't think.... it is called before device tree parsing

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
