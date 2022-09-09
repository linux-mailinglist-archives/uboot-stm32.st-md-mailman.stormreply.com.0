Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F995B3410
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Sep 2022 11:35:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E1A7C64112;
	Fri,  9 Sep 2022 09:35:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41138C64111
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Sep 2022 09:35:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2894F0Ws031613;
 Fri, 9 Sep 2022 11:35:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Fd/o3sGm1Ag5j1m+yIBgcgJhq3lmvL0FAC4tm+IqmN8=;
 b=1hzmpzaCaRAAwv/L7N1p9uSObjYkLYVOEGkMPBU7iywjqBV5/YENsyPBTzoZKCMVOxYk
 pAbjP26w0sfzNRoYfNcRqPXXI+qmbOIYew8AuQiF7dgA+2YKNgdnWWFRami7gfdkXH6C
 b4QS63plN/hV4LGaJKIZAZDIWciZAe2re9bpDBu+wbv911T53xLwla66r0+aRRjJ7GI/
 ARNw/M5DieK4L68sWPMiNta8WSSzjPPQVquVlCOCuV/Y3hnpEHf7ipukE4mrV0Ecsj4y
 FAKdHVv200MuXYzBthID/ta1KHJLIH4rPPRylurg2rurDkVQJWvmj/25Tx562aCqgeIl WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jergbg0ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Sep 2022 11:35:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0B22110002A;
 Fri,  9 Sep 2022 11:35:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A02B20B222;
 Fri,  9 Sep 2022 11:35:44 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.51) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 9 Sep
 2022 11:35:41 +0200
Message-ID: <d196607d-98c2-066e-f324-fad13ae0ffc8@foss.st.com>
Date: Fri, 9 Sep 2022 11:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>, Patrice CHOTARD
 <patrice.chotard@foss.st.com>
References: <20220815145211.31342-1-jorge@foundries.io>
 <20220815145211.31342-2-jorge@foundries.io>
 <80f7f6f4-22bf-7ece-2a6e-0ae34c493cd9@foss.st.com>
 <20220907092000.GA1713256@gnbcxd0016.gnb.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220907092000.GA1713256@gnbcxd0016.gnb.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_04,2022-09-09_01,2022-06-22_01
Cc: oleksandr.suvorov@foundries.io, uboot-stm32@st-md-mailman.stormreply.com,
 hs@denx.de, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCHv2 2/2] i2c: stm32f7: do not set the STOP
 condition on error
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

Hi,

On 9/7/22 11:20, Alain Volmat wrote:
> Hi,
>
> I confirm that a fix is necessary regarding this setting of the stop
> condition.  As a matter of fact, the controller is already sending
> the stop condition in case of NACK so there is no need to send the
> stop condition.
> However, this fix is not enough since the nack could be detected
> few lines above
>
> 	if (status & (STM32_I2C_ISR_NACKF | STM32_I2C_ISR_ERRORS))
> 		break;
>
> and in this case the current check would not catch it.
>
> I propose to set the STOP condition upon handling of the transfer
> complete.
>
> I've put this fix within a small 3 patches series that I'm going to
> send, could you check it to confirm this fixes the issue ?
>
> Regards,
> Alain
>
> On Thu, Aug 25, 2022 at 03:36:36PM +0200, Patrice CHOTARD wrote:
>> +Alain (with the correct email address ;-))
>>
>> Alain, can you have a look a this patch and give your feedback on it.
>>
>> On my side i tested it on stm32mp157c-ev1 and stm32mp157c-dk2, i didn't see any regression
>> but i prefer to get expert feedback
>>
>> Thanks
>> Patrice
>>
>> On 8/15/22 16:52, Jorge Ramirez-Ortiz wrote:
>>> Sending the stop condition without waiting for transfer complete
>>> has been found to lock the bus (BUSY) when NACKF is raised.
>>>
>>> Tested accessing the NXP SE05X I2C device.
>>> https://www.nxp.com/docs/en/application-note/AN12399.pdf
>>>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
>>> Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
>>> ---
>>>   drivers/i2c/stm32f7_i2c.c | 8 +++++---
>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>>

For reference, this patch is superseded by Alain Volmat patch:

[v2,1/3] i2c: stm32: fix comment and remove unused AUTOEND bit

http://patchwork.ozlabs.org/project/uboot/patch/20220908105934.1764482-2-alain.volmat@foss.st.com/

in the serie "i2c: stm32: cleanup & stop handling fix"

http://patchwork.ozlabs.org/project/uboot/list/?series=317443&state=*


Regards


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
