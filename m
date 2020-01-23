Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5509814655A
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Jan 2020 11:05:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18BEFC36B0B
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Jan 2020 10:05:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76313C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 10:05:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00NA3lHH011330; Thu, 23 Jan 2020 11:05:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Hc5Iubv+hpNn0Ryi+LXvTCbgQcLbszud3D8/XquKPlg=;
 b=xx0F8QJ4IRoWMSbGxcYRVQuDL29l2+ZWxp25yfeDRPktIY4fqxEpGDpBwl5cML4c3AZE
 90UOc3k/Rxt5wcKLlVeu1SHd3+BpoUivhzDv7EvrxMgjV6z6H959y7IElfsccltPQfxz
 S2NcrvLEbqQ6z+bT3yTBswuuAK0FFh2ZixRvvfIl9WZFAzVfmVr+zdf7rimsLsptIF/C
 PpYEpaUkVi73RybH+Xlo7Vzsv6mSaasByGnscmeB1ACA6izxvTVxO/FF+x9PbdMBm+od
 vdtGgnB7xt9NLF76rJlIxICCmuWECQqEh/4HfE3UAvd/+dua5h34/g4E7N/zqPvH+C+q ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkssp98ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 11:05:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C0AA10002A;
 Thu, 23 Jan 2020 11:05:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 38190220324;
 Thu, 23 Jan 2020 11:05:27 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jan
 2020 11:05:26 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 23 Jan 2020 11:05:26 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Thread-Topic: [PATCH v2 4/4] board_f.c: Insure 16 alignment of start_addr_sp
 and reserved memory
Thread-Index: AQHV0Ss8SljoN8TBD0S46kgbYxF0eaf21hCAgAEwZ4A=
Date: Thu, 23 Jan 2020 10:05:26 +0000
Message-ID: <1187f061ba994422b5f4a03cb7a171f5@SFHDAG6NODE3.st.com>
References: <20200122135243.17683-1-patrick.delaunay@st.com>
 <20200122135243.17683-5-patrick.delaunay@st.com>
 <1508ecf0-66b1-928f-c766-6dc67252c6bc@wwwdotorg.org>
In-Reply-To: <1508ecf0-66b1-928f-c766-6dc67252c6bc@wwwdotorg.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_01:2020-01-23,
 2020-01-22 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/4] board_f.c: Insure 16 alignment of
 start_addr_sp and reserved memory
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

Hi Stephen,

> From: Stephen Warren <swarren@wwwdotorg.org>
> Sent: mercredi 22 janvier 2020 17:54
> 
> On 1/22/20 6:52 AM, Patrick Delaunay wrote:
> > Add a function reserve_sp() to reserved memory with 16 bits alignment
> > after the stack pointer (gd->start_addr_sp) and use this new function
> > in board_f.c to reserve all the memory area (malloc, board, gd, fdt,
> > bootstage, stacks).
> >
> > This 16 byte alignment is needed for cast on struct pointer for the
> > reserved memory, for example:
> > + x86_64 ABI: https://reviews.llvm.org/D30049: 16 bytes
> > + ARMv8 Instruction Set Overview: quad word, 16 bytes
> >
> > An other alignment value could be needed for other architecture.
> 
> > diff --git a/common/board_f.c b/common/board_f.c
> 
> >
> > +/*
> > + * reserve after start_addr_sp the requested size and make the stack
> > +pointer
> > + * 16-byte aligned, this alignment is needed for cast on the reserved
> > +memory
> > + * ref = x86_64 ABI: https://reviews.llvm.org/D30049: 16 bytes
> > + *     = ARMv8 Instruction Set Overview: quad word, 16 bytes
> > + */
> > +static unsigned long reserve_sp(size_t size)
> 
> Bikeshed: Not sure this name is very description. Perhaps
> reserve_stack_aligned() would be better. Not a big deal though. Patches
> 1,4 look fine otherwise.

Yes and thanks, I will update the comment.
I am waiting few day for sending v3.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
