Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1588BD8724
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 11:33:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED324C3FACE;
	Tue, 14 Oct 2025 09:33:08 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D71FAC3FACB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 09:33:06 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59E9WZDG1473547;
 Tue, 14 Oct 2025 04:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760434355;
 bh=ETELdLTaDIgegWwWitY1xc/IQ1VZ1EtovLBThwx+6pY=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=rrFBFCVNwy1MdV/ZHV58MHCya+FWxnWu8IPObBT7NoJWujxm/aeWRAsZ+JADiJsYU
 IXooj3oqVeeBc+LAO5ZWnBRSKHFvEj5zIX7bGm6w2v3kdzvFhaaTWAMwA/ejYdcQ43
 yRQakNtHvDVir0K1ltsLTQHTKhfXNxz1Jrg8lJlM=
Received: from DLEE200.ent.ti.com (dlee200.ent.ti.com [157.170.170.75])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59E9WZo93707178
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Oct 2025 04:32:35 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 04:32:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 04:32:34 -0500
Received: from [172.24.26.46] (lt5cd2489kgj.dhcp.ti.com [172.24.26.46])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59E9WSdX3345174;
 Tue, 14 Oct 2025 04:32:29 -0500
Message-ID: <27408a77-7656-409f-a466-252d9a6fca78@ti.com>
Date: Tue, 14 Oct 2025 15:02:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peng Fan <peng.fan@oss.nxp.com>, Tom Rini <trini@konsulko.com>
References: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
 <20251013-imx-rproc-v1-1-fb43a3fafcd0@nxp.com>
 <eac85809-2d75-434b-a107-3bbcf1807710@ti.com>
 <20251014020126.GB31468@nxa18884-linux.ap.freescale.net>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20251014020126.GB31468@nxa18884-linux.ap.freescale.net>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>, u-kumar1@ti.com,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Ryan Eatmon <reatmon@ti.com>,
 Andrew Davis <afd@ti.com>, u-boot@lists.denx.de,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, "NXP
 i.MX U-Boot Team" <uboot-imx@nxp.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Hari Nagalla <hnagalla@ti.com>, Fabio Estevam <festevam@gmail.com>,
 Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH 01/11] lib: Import iomem_copy from Linux
	Kernel
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Peng.

On 10/14/2025 7:31 AM, Peng Fan wrote:
> On Mon, Oct 13, 2025 at 11:41:25PM +0530, Kumar, Udit wrote:
>> On 10/13/2025 8:19 AM, Peng Fan (OSS) wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> memcpy_{from,to}io and memset_io is needed for i.MX8M to write
>>> TCM area. So import the APIs from Linux Kernel 6.17.
>>>
>>> Reviewed-by: Ye Li <ye.li@nxp.com>
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>>    include/asm-generic/io.h |  37 +++++++++++++
>>>    lib/Makefile             |   1 +
>>>    lib/iomem_copy.c         | 136 +++++++++++++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 174 insertions(+)
>>>
>>> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
>>> index 13d99cfb5973399209c00adee0080ff83414c064..cf981ad3501f935c714b7580536540e7aba249c1 100644
>>> --- a/include/asm-generic/io.h
>>> +++ b/include/asm-generic/io.h
>>> @@ -3,6 +3,7 @@
>>>     * Generic I/O functions.
>>>     *
>>>     * Copyright (c) 2016 Imagination Technologies Ltd.
>>> + * Copyright 2025 NXP
>>>     */
>>>    #ifndef __ASM_GENERIC_IO_H__
>>> @@ -453,5 +454,41 @@ static inline void iowrite64_rep(volatile void __iomem *addr,
>>>    #endif
>>>    #endif /* CONFIG_64BIT */
>>> +#ifndef memset_io
>> If you are on arm, then
>>
>> arch/arm/include/asm/io.h defines these io functions, for ARM64 and non-ARM64
>> platform,
>>
>> In your SOC, how this works.
> Thanks for pointing this out, I thought these helpers were not defined,
> so I import this file from Linux. So on my platform, the arm64 io helpers
> are used, the functions in this file are not used because there is
> "#ifndef xx".
>
> But anyway, for non-ARM/ARM64 platforms, this file is still useful.
>
> I could drop this if you prefer. Or keep this for other ARCH.


if you are test on other ARCH, please keep otherwise, you can drop this.



>
> Thanks
> Peng
>
>>> +/**
>>> + * memset_io -	Set a range of I/O memory to a constant value
>>> + * @addr:	The beginning of the I/O-memory range to set
>>> + * @val:	The value to set the memory to
>>> + * @count:	The number of bytes to set
>>> + *
>>> + * Set a range of I/O memory to a given value.
>>> + */
>>> +void memset_io(volatile void __iomem *addr, int val, size_t count);
>>> +#endif
>>> +
>>> +#ifndef memcpy_fromio
>>> +/**
>>> [..]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
