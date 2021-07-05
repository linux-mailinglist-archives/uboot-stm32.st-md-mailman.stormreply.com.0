Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A293BC263
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Jul 2021 19:50:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5578EC424BD;
	Mon,  5 Jul 2021 17:50:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD532C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 17:50:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 165HkVMW021577; Mon, 5 Jul 2021 19:50:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=OGdW7k3yq1Y3EbdcBZiw7eWv4+60LxkcBSTFMtHlAU0=;
 b=dqhwFyOKn9hoLTjNkaQJVEq8UicBV1URjDoMRfMbW00llIvqLK5yCzqIveExt51iSs3H
 EWfbTq46MS0SB70vDY3bg9H6xQpo2HLceKcf3ebbjz3Xz5SmlOLcT0847maBjN6869xS
 GVquQmIiiovp5JurFgvyDbWxTKDcMT8IWjn/tripFz2UjB80xUgex1c8ZxBpst14jg0Z
 Q/hvGuEepBdNb690Mw/eis23/kxKmGYVNahd2AxR6iHDLg4ewQv1yxWJwsxEZdLOgAIr
 PliwbY+TkPeQy8n9FnBG4bJE9ypJ4+xa08ZOxG8es1gtc2bh5kXuhqVsYiEXvjlP+Bem LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39kxpstnh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 19:50:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5847F10002A;
 Mon,  5 Jul 2021 19:50:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 42A9A20EECB;
 Mon,  5 Jul 2021 19:50:39 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Jul
 2021 19:50:38 +0200
To: Ramon Fried <rfried.dev@gmail.com>
References: <20210330143429.1.I654d7aeb07f9cd0602752861d06f4c17e9a0ee17@changeid>
 <5d06fe48-bf97-8d23-36e7-8a509f0127ed@denx.de>
 <CAGi-RU+jA-zSy9n7zMJ--AEVuV0gi=vr5Q=eMZhZ5c57AT2gPQ@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <dd7843dc-6376-16a5-11b4-531492207302@foss.st.com>
Date: Mon, 5 Jul 2021 19:50:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAGi-RU+jA-zSy9n7zMJ--AEVuV0gi=vr5Q=eMZhZ5c57AT2gPQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-05_09:2021-07-02,
 2021-07-05 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: cosmetic: remove unused
 define EQOS_DESCRIPTOR_ALIGN
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

Hi Ramon,

On 3/31/21 4:43 PM, Ramon Fried wrote:
> On Tue, Mar 30, 2021 at 5:12 PM Marek Vasut <marex@denx.de> wrote:
>> On 3/30/21 2:34 PM, Patrick Delaunay wrote:
>>> Remove the define EQOS_DESCRIPTOR_ALIGN unused since the
>>> commit 6f1e668d964e ("net: dwc_eth_qos: Pad descriptors to cacheline size")
>>>
>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Acked-by: Marek Vasut <marex@denx.de>
>>
>> Thanks
> Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
It seens this patch is not applied on u-boot-net/network_master or on 
u-boot/next

even if it is accepted in patchwork.

http://patchwork.ozlabs.org/project/uboot/patch/20210330143429.1.I654d7aeb07f9cd0602752861d06f4c17e9a0ee17@changeid/


Any reason ?

or it is just a error in patchwork and the patch is forgotten...


best regards.

Patrick




_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
