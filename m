Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B663879DB
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 May 2021 15:25:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92928C57B6F;
	Tue, 18 May 2021 13:25:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78E8CC57B5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:25:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IDLfQZ009611; Tue, 18 May 2021 15:25:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=hs+EwhMur7JHBC/E1ldSD3KrnceXJ2e1qk85teOdFHc=;
 b=yeTiacmESsTixUG5lQApakqOP7tMHvJyxLyhFqfqSq/B6B9YfUY87ZtHvdM/4DpsLT71
 wde+pLVfW7khuJtd4vBLwOodHiPbYFamrIxlhYZu7hQxCsL/Hy37ygcYeIVgOkEKxt9+
 5c5k54vWqwTRm1LIqqPNtXPl6s92xs9xVVFN6RyAxN/4X9+yCZSXDoDHX2X+3r7KP/1O
 2H4daKbCYHE0AodgmAWtFWW+oLvb1U4SnBPVhZccpqC2XDgGEMKQYwC5IxTaK/zmuS3L
 e3l3Oe68JgUXzL+b7jydhCMX5v2F7lwgG0FwLX+dLX0eJZReShYl09aoBKbGyKTscGmI 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38km707yx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:25:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4BEF410002A;
 Tue, 18 May 2021 15:25:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 31A2122760E;
 Tue, 18 May 2021 15:25:10 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May
 2021 15:25:08 +0200
To: Simon Glass <sjg@chromium.org>
References: <20210504120237.v3.1.I94f875f95a48be081d332f9a2c447c0b78955e75@changeid>
 <CAPnjgZ26bfdjXZDV1YavacjbsoSobPx6sKDOq5E9ijpBMpeMhA@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <03772e7e-5701-0bc5-1219-811134ccd10a@foss.st.com>
Date: Tue, 18 May 2021 15:24:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ26bfdjXZDV1YavacjbsoSobPx6sKDOq5E9ijpBMpeMhA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Joe Hershberger <joe.hershberger@ni.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
Subject: Re: [Uboot-stm32] [PATCH v3] dm: core: Add address translation in
	fdt_get_resource
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

Hi Simon,

On 5/4/21 6:58 PM, Simon Glass wrote:
> On Tue, 4 May 2021 at 04:02, Patrick Delaunay
> <patrick.delaunay@foss.st.com> wrote:
>> Today of_address_to_resource() is called only in
>> ofnode_read_resource() for livetree support and
>> fdt_get_resource() is called when livetree is not supported.
>>
>> The fdt_get_resource() doesn't do the address translation
>> so when it is required, but the address translation is done
>> by ofnode_read_resource() caller, for example in
>> drivers/firmware/scmi/smt.c::scmi_dt_get_smt_buffer() {
>> ...
>>          ret = ofnode_read_resource(args.node, 0, &resource);
>>          if (ret)
>>                  return ret;
>>
>>          faddr = cpu_to_fdt32(resource.start);
>>          paddr = ofnode_translate_address(args.node, &faddr);
>> ...
>>
>> The both behavior should be aligned and the address translation
>> must be called in fdt_get_resource() and removed for each caller.
>>
>> Fixes: a44810123f9e ("dm: core: Add dev_read_resource() to read device resources")
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>> This patch allows to remove the workaround in smci/smt.c
>> introduced by [1].
>>
>> But it impact with all user of
>> - ofnode_read_resource
>> - ofnode_read_resource_byname
>> - dev_read_resource
>> - dev_read_resource_byname
>>
>> After my first check, the only impacts are in drivers/net/mscc_eswitch
>> => I remove the unnecessary translate after code review,
>>     this patch need to be verify on real hardware
>>
>> I proposed to merge the workaround [1] as soon as possible to avoid issue
>> on stm32mp1 platform and this patch can be merged when it will be acked
>> by mscc_eswitch maintainers and other API users.
>>
>> [1] "scmi: translate the resource only when livetree is not activated"
>>      http://patchwork.ozlabs.org/project/uboot/list/?series=236526&state=*
>>
>>
>> Changes in v3:
>> - add test dm_test_read_resource
>>
>> Changes in v2:
>> - remove translate in luton_switch.c:luton_probe()
>>
>>   drivers/firmware/scmi/smt.c               | 12 +--------
>>   drivers/net/mscc_eswitch/jr2_switch.c     |  4 +--
>>   drivers/net/mscc_eswitch/luton_switch.c   |  5 +---
>>   drivers/net/mscc_eswitch/ocelot_switch.c  |  4 +--
>>   drivers/net/mscc_eswitch/serval_switch.c  |  4 +--
>>   drivers/net/mscc_eswitch/servalt_switch.c |  4 +--
>>   lib/fdtdec.c                              |  6 ++++-
>>   test/dm/test-fdt.c                        | 33 +++++++++++++++++++++++
>>   8 files changed, 44 insertions(+), 28 deletions(-)
> Reviewed-by: Simon Glass <sjg@chromium.org>


Thanks for the review of this v3...

But today I see that V1 is already merged in master branch

http://patchwork.ozlabs.org/project/uboot/list/?series=237557&state=*

I will sent a separate serie with only the changes introcuduced by V2 and

V3 and rebased on master branch.

Regards

Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
