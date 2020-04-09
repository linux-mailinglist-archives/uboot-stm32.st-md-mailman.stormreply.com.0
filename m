Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9511A322D
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 12:02:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C99DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 10:02:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E77D0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2020 10:02:06 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0399vAFP020758; Thu, 9 Apr 2020 12:02:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=a3ac9QcP9AOenqKdjPBYziHLkt6TKs+wl8mwJ8EkmhU=;
 b=SBMPqKF5SzkufZmgNKJebJqfl0kOtCNXdirTVrNoLuZtpcJbqma+5dIsTNqRaLTODboc
 rgffY6NI236Avq+vzvWnAzCHCH1aW2YKselGbSRrPj89kQdZDjnRkFOgi3u8L2L7VBD9
 uydKUfjKYyPEPxM3aaFcuRKSjE1dsNX1KyyjB1LWT+fFsaGvopciRNDon41o+UUxdlwK
 34lPHsRy47flPVx7Ig7QYKl1MmqBcuPjmgHrMKRkPXFx+ZR0DrBOmRtbg3rRXfiDoTzU
 0F7RTo7WTOf2ScLx1SMJt6qK20OZ4Mr9djc3eOLzt3Do953rrj81L2sWACRduxrLbdeh QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091qk9abt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Apr 2020 12:02:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C06410003D;
 Thu,  9 Apr 2020 12:01:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4241B222C98;
 Thu,  9 Apr 2020 12:01:56 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 9 Apr
 2020 12:01:55 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 9 Apr 2020 12:01:55 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/3] arm: caches: add DCACHE_DEFAULT_OPTION
Thread-Index: AQHWCZHnGsMjphwTIUWt6WPls6zgHKhnySMAgAfBaYCAAQKw0A==
Date: Thu, 9 Apr 2020 10:01:55 +0000
Message-ID: <6e789fd398524ffbbdd6122278d72564@SFHDAG6NODE3.st.com>
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
 <20200403102815.2.Ib6abcb05422a74bc6bc03daa71b15c98c99dbc5d@changeid>
 <ea5a59e9-dd9f-f2b6-a210-d99b417cb8f2@denx.de>
 <faf4ef59ca6a49c7a8a032726468fe43@SFHDAG6NODE3.st.com>
In-Reply-To: <faf4ef59ca6a49c7a8a032726468fe43@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-09_03:2020-04-07,
 2020-04-09 signatures=0
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

> From: Uboot-stm32 <uboot-stm32-bounces@st-md-mailman.stormreply.com> On
> Behalf Of Patrick DELAUNAY
> 
> Dear Marek,
> 
> > From: Marek Vasut <marex@denx.de>
> > Sent: vendredi 3 avril 2020 23:29
> >
> > On 4/3/20 10:28 AM, Patrick Delaunay wrote:
> > > Add the new flags DCACHE_DEFAULT_OPTION to define the default option
> > > to use according the compilation flags
> > > CONFIG_SYS_ARM_CACHE_WRITETHROUGH or
> > CONFIG_SYS_ARM_CACHE_WRITEALLOC.
> >
> > Can't you unify these macros into a single Kconfig "select" statement
> > instead , and then just select the matching cache configuration in Kconfig ?
> 
> Yes I will try, with 2 steps
> - migrate existing CONFIG_SYS_ARM_CACHE_.... in Kconfig

First step done...
I will push it as a separate patchset I think.

> - add new option CONFIG_SYS_ARM_CACHE_OPTION

In fact it is to difficult to use select because each defines
DCACHE_XXX value can have several values

they are build according CONFIG_ARM64 / LPAE

But, I can't use this define in Kconfig

I try :
option	ARM_OPTION
	int "option"
	default DCACHE_WRITETHROUGHT if CONFIG_SYS_ARM_CACHE_WRITETHROUGH
	default DCACHE_ WRITEALLOC if CONFIG_SYS_ARM_CACHE_ WRITEALLOC
	default DCACHE_WRITEBACK if CONFIG_SYS_ARM_CACHE_WRITEBACK

int and hex is invalid, and string can't be use with "".

And I don't found way to build it automatically when option is activated.

Any idea ?

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
