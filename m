Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 486B03CD09A
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jul 2021 11:25:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D0F4C597AC;
	Mon, 19 Jul 2021 09:25:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D0B5C597AB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 09:25:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J9Cef6005840; Mon, 19 Jul 2021 11:25:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=axnW0Rs723b8au3Y7OmYbQMYPMi6KirTR+4OcCo+ly0=;
 b=ULeVbDNgpl9rIudi2FlEnyIouLhKmgGb29PnFs3Ejhapn3qCrWZKqKarNJ1DH1Ef0ACI
 tzPNNpjWb3kvGwKowelfo00P96d9cCt+048pt2N9jJp2qHkHyMfw5B88NTGni5HRpiTL
 Jj7AUBHaQmOxYg0uKyYmsQEv63bbo/H92K80bpoCzuAXv3g3BbFTr1OlxbKYz1rnqBxP
 RITYys+T0ZwQRfz2DOcXaMHRTLup9oajQGZ+tqnr5dAAZnfhsaXWE5lEqgi9fqTqcLef
 r4TQb+XoXtMhYqGGbvOFgxqUJd1Q8TdTIg/bP9D09dJ1MPj6YegGsx3Vv7uduyyt2rGD vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39w4kggv6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 11:25:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4EDA610002A;
 Mon, 19 Jul 2021 11:25:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A18D218CA7;
 Mon, 19 Jul 2021 11:25:14 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Jul
 2021 11:25:13 +0200
To: Tom Rini <trini@konsulko.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>
References: <20210226124451.3799-1-patrice.chotard@foss.st.com>
 <20210709161525.GA7917@bill-the-cat>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <0fe06aa3-336d-bc62-ff35-67fe3347da9c@foss.st.com>
Date: Mon, 19 Jul 2021 11:25:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709161525.GA7917@bill-the-cat>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_02:2021-07-16,
 2021-07-19 signatures=0
Cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simon Glass <sjg@chromium.org>, Suneel Garapati <sgarapati@marvell.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 mark.kettenis@xs4all.nl
Subject: Re: [Uboot-stm32] [PATCH] arm64: Update memcpy_{from,
	to}io() helpers
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

Hi Tom,

On 7/9/21 6:15 PM, Tom Rini wrote:
> On Fri, Feb 26, 2021 at 01:44:51PM +0100, Patrice Chotard wrote:
>
>> At early U-Boot stage, before relocation, MMU is not yet configured
>> and disabled. DDR may not be configured with the correct memory
>> attributes (can be configured in MT_DEVICE instead of MT_MEMORY).
>>
>> In this case, usage of memcpy_{from, to}io() may leads to synchronous
>> abort in AARCH64 in case the normal memory address is not 64Bits aligned.
>>
>> To avoid such situation, forbid usage of normal memory cast to (u64 *) in
>> case MMU is not enabled.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: mark.kettenis@xs4all.nl
>> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Sorry for the delay.  If this is still needed, you'll need to address
> the build failures on platforms such as cgtqmx8:
> +(cgtqmx8) board/congatec/cgtqmx8/cgtqmx8.c:377:6: error: conflicting types for 'reset_cpu'
> +(cgtqmx8)  void reset_cpu(ulong addr)
> +(cgtqmx8)       ^~~~~~~~~
> +(cgtqmx8) In file included from arch/arm/include/asm/io.h:341:0,
> +(cgtqmx8)                  from board/congatec/cgtqmx8/cgtqmx8.c:12:
> +(cgtqmx8) include/cpu_func.h:88:6: note: previous declaration of 'reset_cpu' was here
> +(cgtqmx8)  void reset_cpu(void);
>
> that are introduced with this patch.  Thanks.
>
I pushed a V2 serie to solve the issue.

http://patchwork.ozlabs.org/project/uboot/list/?series=254106


Regards.

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
