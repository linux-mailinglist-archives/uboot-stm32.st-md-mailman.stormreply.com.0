Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC2A2D59F2
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Dec 2020 13:05:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7C36C3FADA;
	Thu, 10 Dec 2020 12:05:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CC41C3089F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Dec 2020 12:05:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BAC1q9F030546; Thu, 10 Dec 2020 13:04:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : references
 : to : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xl4HLfNaEdDlv2RHLfMUw8QbeaAKyMr5eZgMXd3UPfM=;
 b=rKKc3+BikOo70TcSnsNzvsJm6ZBFhy2ssK9/0yFEYPP/3YK2M6KrlbQeX2LIYhTg1uOo
 +iXh7Y+UexyIxlq6aZC27a3+nBZDehg14eMVHqblT5ihmsBWgkCRlJNbJVpWozWq1zES
 GirGVHhAktv134v8h4wMvYoXjJxFIvU10xDXwkFUnHw8fdIm9aS3TxsjkLrwFupyWA3I
 TTV5As1e1WCVIWlfcMZ753+WbcDvMEBM/5IuWkRBqB3UAWNnQj2yfLwH7Y5FTdnekg/S
 znnakQfLQtxreisCkgsBAsVfCN5sGiGpEB27gZrdOZtCjtLkVM2kVEURk+KOOAb0sF96 Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35ag8jb5er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 13:04:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AAFE210002A;
 Thu, 10 Dec 2020 13:04:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D07B24E670;
 Thu, 10 Dec 2020 13:04:56 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Dec
 2020 13:04:56 +0100
References: <6fa4af68-ca93-d71d-9b48-6f8e5028e548@foss.st.com>
To: <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>, Rasmus Villemoes
 <rasmus.villemoes@prevas.dk>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
X-Forwarded-Message-Id: <6fa4af68-ca93-d71d-9b48-6f8e5028e548@foss.st.com>
Message-ID: <618da3e2-df99-fc1a-5fda-08fcf38d16ae@foss.st.com>
Date: Thu, 10 Dec 2020 13:04:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6fa4af68-ca93-d71d-9b48-6f8e5028e548@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_05:2020-12-09,
 2020-12-10 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>,
 Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] string: Use memcpy() within memmove()
	when we can
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Tom,

On 12/10/20 12:57 PM, Patrick DELAUNAY wrote:
> From: Tom Rini <trini@konsulko.com>
> Sent: mardi 8 d=E9cembre 2020 17:11
>
> On Wed, Nov 25, 2020 at 01:07:43PM +0100, Rasmus Villemoes wrote:
>> On 25/11/2020 12.26, Patrick Delaunay wrote:
>>> A common use of memmove() can be handled by memcpy(). Also memcpy()
>>> includes an optimization for large sizes: it copies a word at a
>>> time. So we can get a speed-up by calling memcpy() to handle our =

>>> move in this case.
>>>
>>> Update memmove() to call also memcpy() if the source don't overlap
>>> the destination (src + count <=3D dest).
>>>
>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>>> ---
>>> This patch allows to save 38ms for Kernel Image extraction (7327624
>>> Bytes) from FIT loaded at 0xC2000000 for ARMV7 board
>>> STM32MP157C-EV1, and with kernel destination =3D Load Address:
>>> 0xc4000000, located after the FIT without overlap, compared with
>>> destination =3D Load Address: 0xc0008000.
>>>
>>> -> 14,332 us vs 52,239 in bootstage report
>>>
>>> In this case the memmove funtion is called in
>>> common/image.c::memmove_wd() to handle overlap.
>>>
>>>
>>> lib/string.c | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/lib/string.c b/lib/string.c index
>>> ae7835f600..ef8ead976c 100644
>>> --- a/lib/string.c
>>> +++ b/lib/string.c
>>> @@ -567,7 +567,7 @@ void * memmove(void * dest,const void
>>> *src,size_t count) {
>>> char *tmp, *s;
>>> - if (dest <=3D src) {
>>> + if (dest <=3D src || (src + count) <=3D dest) {
>>> memcpy(dest, src, count);
>> Hm. So the condition you add (src + count <=3D dest) implies no overlap
>> at all, so that's ok. So this doesn't really have anything to do with
>> your patch per se.
>>
>> The existing condition relies on memcpy doing forward-copying. That's
>> the case if the implementation from lib/string.c is in use, i.e. if
>> __HAVE_ARCH_MEMCPY is not defined. And if an arch defines
>> __HAVE_ARCH_MEMMOVE, this memmove() is not used.
>>
>> But AFAICT, there's a potential problem for the case where
>> __HAVE_ARCH_MEMCPY is defined but __HAVE_ARCH_MEMMOVE is not, and e.g.
>> arch/arm/include/asm/string.h does
>>
>> #if CONFIG_IS_ENABLED(USE_ARCH_MEMCPY)
>> #define __HAVE_ARCH_MEMCPY
>> #endif
>> #undef __HAVE_ARCH_MEMMOVE
>>
>> Of course, the arch-specific implementation _may_ also do
>> forward-copying (I haven't tried to decipher it), but that seems to be
>> a rather fragile assumption. At the very least, some comments would be
>> in order.
> Looking at this deeper, today, ARM (non-64bit) can and usually but not =

> always does use the asm optimized memcpy / memset. No other optimized =

> functions were copied from Linux, and no other arches seem to use them =

> today either. I think in sum then, Patrick can you please do a v2 that =

> adds a comment here, in case we get more optimizations in the future?
> And thanks for the review here Rasmus!

I am preparing a V2 with added coment.

Patrick.

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
