Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F16536257B
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Apr 2021 18:17:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20FBBC57B78;
	Fri, 16 Apr 2021 16:17:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06FC8C57B76
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Apr 2021 16:17:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GGCsLP025674; Fri, 16 Apr 2021 18:16:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MGlMhg8+KjjT876KZeyMUf7jNy2uQfWrv8mAjJFI9r4=;
 b=WT+S+ZonCr3U67F30c+f3IU0Fl67mLTNLUAlsfWhImN7Ad2JaHAK/r0n6bHRzZWKq+y8
 Zzh0RMF3mPrOQ0vfxG3F6YN6bZ28nGoMLZzN/Y8O8qp2wSDSp0s8LDzjQe1bsO0s3i5g
 nOLK8iYiQAjw9k3Yb8oLeF5Ng8N2Jl8Is0KuK/sPg4PS3n7RP/5jP2DiWbGooc6s5i59
 liFAZEFTRiNuuMQfUq89o9kUCUsihhcNy2ZNFFqE7M5fNC4EQdfXXfDVM4dUyCg5FMe3
 XJ181IvRrd8GqNk93h35iuWEuZ9mDwk4Tg/Dv9bhySt6TjjIS7fslt5avwlKiJCyb75M 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37y0g84j1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 18:16:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 624E910002A;
 Fri, 16 Apr 2021 18:16:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 239E82A4D80;
 Fri, 16 Apr 2021 18:16:39 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Apr
 2021 18:16:38 +0200
To: Simon Glass <sjg@chromium.org>
References: <20210409073617.16045-1-patrice.chotard@foss.st.com>
 <20210409073617.16045-2-patrice.chotard@foss.st.com>
 <CAPnjgZ0ChJdek=+SGCde+Mu-Nmh-WtG1E87m_N463_GiXOt7UQ@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <ef7c5507-d681-9d5f-2a59-3367b8455a81@foss.st.com>
Date: Fri, 16 Apr 2021 18:16:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ0ChJdek=+SGCde+Mu-Nmh-WtG1E87m_N463_GiXOt7UQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_08:2021-04-16,
 2021-04-16 signatures=0
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Sean Anderson <seanga2@gmail.com>,
 Herbert Poetzl <herbert@13thfloor.at>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] cmd: bind: Fix driver binding on a
	device
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

Hi Simon

On 4/14/21 9:38 PM, Simon Glass wrote:
> On Fri, 9 Apr 2021 at 08:36, Patrice Chotard
> <patrice.chotard@foss.st.com> wrote:
>>
>> Fix a regression brings by commit 84f8e36f03fa ("cmd: bind: allow to
>> bind driver with driver data")
>>
>> As example, the following bind command doesn't work:
>>
>>    bind /soc/usb-otg@49000000 usb_ether
>>
>> As usb_ether driver has no compatible string, it can't be find by
>> lists_bind_fdt(). In bind_by_node_path(), which called lists_bind_fdt(),
>> the driver entry is known, pass it to lists_bind_fdt() to force the driver
>> entry selection.
>>
>> For this, add a new parameter struct *driver to lists_bind_fdt().
>> Fix also all lists_bind_fdt() callers.
>>
>> Fixes: 84f8e36f03fa ("cmd: bind: allow to bind driver with driver data")
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Reported-by: Herbert Poetzl <herbert@13thfloor.at>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: Herbert Poetzl <herbert@13thfloor.at>
>> ---
>>
>>  cmd/bind.c                     |  2 +-
>>  drivers/core/device.c          |  2 +-
>>  drivers/core/lists.c           | 11 ++++++++---
>>  drivers/core/root.c            |  2 +-
>>  drivers/misc/imx8/scu.c        |  2 +-
>>  drivers/serial/serial-uclass.c |  2 +-
>>  drivers/timer/timer-uclass.c   |  2 +-
>>  include/dm/lists.h             |  3 ++-
>>  test/dm/nop.c                  |  2 +-
>>  test/dm/test-fdt.c             |  2 +-
>>  10 files changed, 18 insertions(+), 12 deletions(-)
>>
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> Really this command needs a test.

Yes i will work on that even is there is already a bind test. 
In fact, this new use case was not covered by the existing implementation.

Patrice

> 
> Regards,
> Simon
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
