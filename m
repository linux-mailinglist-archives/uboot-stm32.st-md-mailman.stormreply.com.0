Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3644C246CD2
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Aug 2020 18:29:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF27DC32E8E
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Aug 2020 16:29:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64F0FC36B26
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Aug 2020 16:29:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HGHTN1021649; Mon, 17 Aug 2020 18:29:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Zg8u9y/Z5sragZ5FqcpQL390KCPmJRP0Ljr/sS7cL9k=;
 b=nm/LuFSEILNIAN958mw5THlYBO0aF5kwTBgQXfBLtO8/B1HcS3DS1YPuA6/C9iZbYWBD
 FqxBYhU00yWyhRQuEzx3LIQHsfClX2CAfumCHFLeQd4o5m7BAiHNlyl9iQH8U/Xvow5C
 8/HT2ESILjjYwyh+xTvQJGzXfCEUlFFLPgF0mxqy0XgCq7giV4Zi68qLu5WcVI2wgIYA
 vxDmLDVMwCGnyKpmZ3ImvETlNRBzqckDgOE2VFU1zR2yqTmarALXnPKVg30bKEGSkQmN
 o5mvA4ngmtGlYBZ/wYIn+ItO7E3XkVX5hlNASDOTRdF6kN1gINhaRbOQxumt29GFNY3y yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32yab5vc10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 18:29:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 970F310002A;
 Mon, 17 Aug 2020 18:29:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8637B21C216;
 Mon, 17 Aug 2020 18:29:44 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 17 Aug
 2020 18:29:44 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 17 Aug 2020 18:29:43 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Baruch Siach <baruch@tkos.co.il>, Patrick DELAUNAY
 <patrick.delaunay@st.com>
Thread-Topic: [PATCH] ARM: bootm: take into account gd->ram_top
Thread-Index: AQHV4puWH2BFS2eNkU+op+bjuNo0h6k8vCOAgADEWIA=
Date: Mon, 17 Aug 2020 16:29:43 +0000
Message-ID: <4076af80-1a4c-12d1-5fc1-448a109fb963@st.com>
References: <20200213182950.10744-1-patrick.delaunay@st.com>
 <87eeo5nakc.fsf@tarshish>
In-Reply-To: <87eeo5nakc.fsf@tarshish>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <0F17471DA030164D977952AD0B717218@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_13:2020-08-17,
 2020-08-17 signatures=0
Cc: Tom Rini <trini@konsulko.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Lokesh Vutla <lokeshvutla@ti.com>, Keerthy <j-keerthy@ti.com>,
 Simon Glass <sjg@chromium.org>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] ARM: bootm: take into account gd->ram_top
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

Hi Baruch

On 8/17/20 6:46 AM, Baruch Siach wrote:
> Hi Patrick, all,
>
> On Thu, Feb 13 2020, Patrick Delaunay wrote:
>> From: Patrice Chotard <patrice.chotard@st.com>
>>
>> If gd->ram_top has been tuned using board_get_usable_ram_top(),
>> it must be taken into account when reserving arch lmb.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>> Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> [snip]
>> diff --git a/arch/arm/lib/bootm.c b/arch/arm/lib/bootm.c
>> index a135bcfc7b..f4b5ca6de0 100644
>> --- a/arch/arm/lib/bootm.c
>> +++ b/arch/arm/lib/bootm.c
>> @@ -75,6 +75,9 @@ void arch_lmb_reserve(struct lmb *lmb)
>>  			gd->bd->bi_dram[bank].size - 1;
>>  		if (sp > bank_end)
>>  			continue;
>> +		if (bank_end > gd->ram_top)
>> +			bank_end = gd->ram_top - 1;
>> +
> This patch (now committed as 8ce1f10cf2b1) breaks kernel boot on Armada
> 8040 based Clearfog GT-8K with 16GB RAM. See below the console output of
> v2020.10-rc2 with a few added prints.
>
> The first memory bank (bi_dram[0]) goes from 0 to 3GB. The rest
> (4GB-17GB) is on bi_dram[1] (see a8k_dram_init_banksize()). ram_top is
> set to 2GB on
> arch/arm/mach-mvebu/arm64-common.c:board_get_usable_ram_top().

If i have correctly understood, before this patch, on your platform U-boot was using a memory area over

the ram_top limit set to 2Gb ? which is not correct.

You probably have to rework the platform memory mapping in order to either

_ make all needed memory area fit inside the ram_top limit (2Gb)

or

_ increase the ram_top limit over 2Gb.

It's only assumption as i don't know your platform.

Patrice


>
> Reverting commit 8ce1f10cf2b1 on top of v2020.10-rc2 fixes boot.
>
> Any Idea?
>
> Found /extlinux/extlinux.conf
> Retrieving file: /extlinux/extlinux.conf
> ## Current stack ends at 0x7fb24300
> arch_lmb_reserve: bank_end: bfffffff ram_top: 80000000
> 62 bytes read in 21 ms (2 KiB/s)
> 1:	linux
> Retrieving file: /extlinux/Image
> ## Current stack ends at 0x7fb23960
> arch_lmb_reserve: bank_end: bfffffff ram_top: 80000000
> 13740544 bytes read in 1266 ms (10.4 MiB/s)
> Retrieving file: /extlinux/armada-8040-clearfog-gt-8k.dtb
> ## Current stack ends at 0x7fb23960
> arch_lmb_reserve: bank_end: bfffffff ram_top: 80000000
> 33368 bytes read in 31 ms (1 MiB/s)
> ## Current stack ends at 0x7fb23cd0
> arch_lmb_reserve: bank_end: bfffffff ram_top: 80000000
> ## Flattened Device Tree blob at 04f00000
>    Booting using the fdt blob at 0x4f00000
>    Loading Device Tree to 00000000bfff4000, end 00000000bffff257 ... "Synchronous Abort" handler, esr 0x96000045
> elr: 000000000006e1cc lr : 0000000000068fd8 (reloc)
> elr: 000000007ffa91cc lr : 000000007ffa3fd8
> x0 : ffffffffffffffff x1 : 00000000bfffc258
> x2 : 0000000000000000 x3 : ffffffffffff7da7
> x4 : 0000000004f08258 x5 : 00000000bfff4000
> x6 : 00000000bfff4000 x7 : 000000000000000f
> x8 : 000000007fb23bf8 x9 : 0000000000000008
> x10: 00000000bffff257 x11: 00000000bffff257
> x12: 0000000000000000 x13: fffffffffffff000
> x14: 00000000bfff4000 x15: 0000000000000021
> x16: 000000007ff7bc38 x17: 0000000000000000
> x18: 000000007fb2add0 x19: 00000000bfff4000
> x20: 0000000004f00000 x21: 000000000000b258
> x22: 0000000058820000 x23: 0000000000000010
> x24: 000000007ffe3c40 x25: 000000007fb23cb8
> x26: 00000000c0000000 x27: 0000000000000000
> x28: 000000007fc3fd50 x29: 000000007fb23bd0
>
> Code: 54000061 aa0603e0 d65f03c0 38606882 (38206822) 
> Resetting CPU ...
>
> Thanks,
> baruch
>
>>  		lmb_reserve(lmb, sp, bank_end - sp + 1);
>>  		break;
>>  	}
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
