Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7353C338CD9
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:26:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39E6BC57196;
	Fri, 12 Mar 2021 12:26:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16564C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:26:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CCNF6R029657; Fri, 12 Mar 2021 13:26:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QIk9UGcc2SUdgDR75BH8Xi6mZMFAoHZpIW601JDWqFw=;
 b=E7KW1XamACApe1PQRGzBiZgfOYhPcd6OWEJLFSTSHXR4/U4p/XcenUZKSCzjsFgo8XdH
 wrw8i+X1S82EOY84CVT6gA4Bi8RkuJyglfMN18cm04wOcjCyqWY4YiP7BJEgGOq2vffF
 CTfbj5sFhLKZWnvUz4L51Zq5E6IT15TqJNKMTB334FCvZ28NwvOvGpUwEF/576sWkryY
 URJyh2sf+ZQPIHO4RQYrku8McA4w5dkxu17bZIAj9L90fj7Ok6Pi+iM7R3PebcwtE8Ae
 MuqxfDUdePUC4drDTINLR3xILtwXByh6WueaCnb6k8CzQJROYjIEewFggA+9eIcON05/ TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrf5t0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:26:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0295610002A;
 Fri, 12 Mar 2021 13:26:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA82423C79B;
 Fri, 12 Mar 2021 13:26:17 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:26:17 +0100
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
 <20210224111907.5.I9181e07a082adec8ea1c0afd5b103d005f05b860@changeid>
 <1714ed28-4a5e-ff42-45ec-22a5ee6894cb@foss.st.com>
 <4515fbd0-93ab-e368-f822-0a0184fff161@foss.st.com>
Message-ID: <8c766dfb-125e-f369-bd3e-32c6bc282c2e@foss.st.com>
Date: Fri, 12 Mar 2021 13:26:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4515fbd0-93ab-e368-f822-0a0184fff161@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Etienne Carriere <etienne.carriere@linaro.org>,
 Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 5/6] scmi: cosmetic: reorder include files
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

Hi

On 3/12/21 1:26 PM, Patrice CHOTARD wrote:
> 
> 
> On 3/9/21 2:04 PM, Patrice CHOTARD wrote:
>> Hi Patrick
>>
>> On 2/24/21 11:19 AM, Patrick Delaunay wrote:
>>> Reorder include files in expected order.
>>>
>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>> ---
>>>
>>>  drivers/firmware/scmi/mailbox_agent.c     | 2 +-
>>>  drivers/firmware/scmi/scmi_agent-uclass.c | 3 +--
>>>  2 files changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/firmware/scmi/mailbox_agent.c b/drivers/firmware/scmi/mailbox_agent.c
>>> index 8043e2c2de..ea35e7e09e 100644
>>> --- a/drivers/firmware/scmi/mailbox_agent.c
>>> +++ b/drivers/firmware/scmi/mailbox_agent.c
>>> @@ -7,11 +7,11 @@
>>>  
>>>  #include <common.h>
>>>  #include <dm.h>
>>> -#include <dm/device_compat.h>
>>>  #include <errno.h>
>>>  #include <mailbox.h>
>>>  #include <scmi_agent.h>
>>>  #include <scmi_agent-uclass.h>
>>> +#include <dm/device_compat.h>
>>>  #include <dm/devres.h>
>>>  #include <linux/compat.h>
>>>  
>>> diff --git a/drivers/firmware/scmi/scmi_agent-uclass.c b/drivers/firmware/scmi/scmi_agent-uclass.c
>>> index 2491e0a747..527163b5ce 100644
>>> --- a/drivers/firmware/scmi/scmi_agent-uclass.c
>>> +++ b/drivers/firmware/scmi/scmi_agent-uclass.c
>>> @@ -7,11 +7,10 @@
>>>  
>>>  #include <common.h>
>>>  #include <dm.h>
>>> -#include <dm/device_compat.h>
>>>  #include <errno.h>
>>>  #include <scmi_agent-uclass.h>
>>>  #include <scmi_protocols.h>
>>> -
>>> +#include <dm/device_compat.h>
>>>  #include <dm/device-internal.h>
>>>  #include <linux/compat.h>
>>>  
>>>
>>
>>
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Thanks
>> Patrice
>>
> Applied to u-boot-stm/next
> 
> Thanks
> 
> Patrice
> 
Applied to u-boot-stm/next

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
